" Only do this part when compiled with support for autocommands.
if has("autocmd")
    filetype plugin indent on
    autocmd FileType make set tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
endif

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
syntax on
set ruler

