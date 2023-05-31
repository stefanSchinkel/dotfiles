" relative line numbers
set rnu
set nu rnu
" backspace fix on mac
set backspace=indent,eol,start
" white space showing
set list
set encoding=utf-8 nobomb
"set listchars=lead:.,leadmultispace:...+,trail:
"set listchars=lead:.,multispace:...\+,trail:␣
set listchars=lead:.,multispace:...\+tab:→\ ,trail:␣,precedes:«,extends:»,eol:⏎
" trim trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" setup ruler
set colorcolumn=72

" set split right
set splitright

" status line
set laststatus=2

set nocompatible              " required
filetype off                  " required

" ln -s ~/.vim/colors/zenburn.vim ~/.vim/bundle/Zenburn/colors/zenburn.vim
colors zenburn

" pres tab to browse buffers
set wildchar=<Tab> wildmenu wildmode=full

" smaller tabs in Markdown
au BufNewFile,BufRead *.md
\ set tabstop=2 |
\ set softtabstop=2 |
\ set expandtab |

" smart python indenting
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix |

" setup for NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" start w/ nerdtree open
"autocmd VimEnter * NERDTree
" close vim if only nerdtree is shown
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" coldfolding
" open unfolded
set foldlevel=99
" map sapce to fold/unfold
nnoremap <space> za

" map leader>b to safe and run python file
nmap <Leader>b :w \| vert ter python % <CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'scrooloose/nerdtree'

" CTRLP
Plugin 'kien/ctrlp.vim'

" Powerlines
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" python autocomplete
"Plugin 'davidhalter/jedi-vim'
" vim LSP
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'mattn/vim-lsp-settings'
Plugin 'dense-analysis/ale'
Plugin 'rhysd/vim-lsp-ale'

" commenting
 Plugin 'preservim/nerdcommenter'

" code folding
Plugin 'tmhedberg/SimpylFold'

" colorschemes for python
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

"Black formater
Plugin 'psf/black', { 'branch': 'stable' }

" Markdown Preview
Plugin 'iamcco/markdown-preview.nvim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

