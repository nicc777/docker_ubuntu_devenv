# Ubuntu Docker Development Image

This is my docker image I use to develop in.

This is work in progress...

## Build the image

Simply run:

	$ docker build -t docker_ubuntu_devenv:latest .

The build will install the basic tools to get you as a developer going.

## Run the image

The container is supposed to allow you to develop in a save throughaway environment. The easiest way to get started:

	$ docker run -i -t docker_ubuntu_devenv:latest /bin/bash -i

You will be in a shell straight away
	
### Run and Mount Local Folder

Another option is to mount a local folder, like your projects folder:

	$ docker run -v /your/projects/folder:/dev_local -i -t docker_ubuntu_devenv:latest /bin/bash -i
	
Any files you now edit in `/dev_local` will persist.

### Run and expose some ports

You can also expose some popular TCP ports, using the -p switch.

The following ports are configured to be exposed:

* 5000
* 8080
* 80
* 443

You can just edit the Dockerfile to add more if you require.

## X11 Hack (OSX)

Install XQuartz on OSX.

On OSX, get the IP address

	$ ip=$(ifconfig en3 | grep inet | awk '$1=="inet" {print $2}') && echo "My IP is: $ip"
	My IP is: xxx.xxx.xxx.xxx

NOTE: I had to use `en3` - you may require another device...

Then launch the docker with:

	$ docker run -it -e DISPLAY=${ip}:0 docker_ubuntu_devenv:latest /bin/bash -i

And now you can run "almost" any X based app, like `firefox`.
