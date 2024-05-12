scriptencoding utf-8
set encoding=utf-8 nobomb
" relative line numbers
set rnu
set nu rnu
" backspace fix on mac
set backspace=indent,eol,start " white space showing
set list
set listchars=tab:→\ ,multispace:...\+,lead:.,trail:␣

" trim trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" setup ruler
set colorcolumn=79

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

" map leader-b to browse buffers w/ CTRLP
" nnoremap <silent> <C-y> :CtrlPBuffer<CR>

" map leader-P/F to FZF files/ag
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-f> :Ag<CR>

" smaller tabs in Markdown
au BufNewFile,BufRead *.md
\ set tabstop=2 |
\ set softtabstop=2 |
\ set expandtab |
\ set shiftwidth=2 |

" smart python indenting
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix |

" black of save
augroup black_on_save autocmd!
autocmd BufWritePre *.py Black
augroup end


" setup for NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

" vim-lsp ---- {{{
nnoremap gd :LspDefinition<CR>
nnoremap pd :LspPeekDefinition<CR>
nnoremap gs :LspDocumentSymbol<CR>
nnoremap gS :LspWorkspaceSymbol<CR>
nnoremap <leader>gr :LspReferences<CR>
nnoremap gi :LspImplementation<CR>
nnoremap <leader>gt :LspTypeDefinition<CR>
nnoremap <leader>rn :LspRename<CR>
nnoremap [g :LspPreviousDiagnostic<CR>
nnoremap ]g :LspNextDiagnostic<CR>
nnoremap K :LspHover<CR>
" }}}

" vim asyncomplete ---- {{{
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" }}}

" start w/ nerdtree open
"autocmd VimEnter * NERDTree
" close vim if only nerdtree is shown
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" make actual use of LSP w/ shortcutws
if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" coldfolding
" open unfolded
set foldlevel=99
" map sapce to fold/unfold
nnoremap <space> za

" map leader>b to safe and run python file
nmap <Leader>b :w \| bel ter python % <CR>

" make texlab behave and not randomly indent
set nocindent

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

"fzf
set rtp+=~/.fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" CTRLP
"Plugin 'kien/ctrlp.vim'

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

