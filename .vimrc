" Line numbers
:set number

" Syntax highlighting
:syntax on
:colorscheme solarized
":colorscheme VIvid

" Tab inserts 4 spaces
:set expandtab
:set tabstop=4

" Pressing backspace in a tabbed area removes 4 spaces
:set softtabstop=4

" Using >>, << or == moves by 4 spaces
:set shiftwidth=4

" Use 2 spaces for html and css
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2

" Allow saving of files as sudo when I forgot to start vim using sudo
cmap w!! w !sudo tee > /dev/null %
