autocmd BufReadPost COMMIT_EDITMSG exec "normal! gg"
set number

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set list
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•
syntax enable
set t_Co=256
set background=dark
colorscheme jellybeans
