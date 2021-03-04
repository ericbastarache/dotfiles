source ~/.vim/bundle/fzf/plugin/fzf.vim
let g:fzf_layout = { 'down': '40%' }
let g:netrw_winsize = 30
set number
set rnu
set scrolloff=8
set omnifunc=javascriptcomplete#CompleteJS
set omnifunc=htmlcomplete#CompleteTags
set omnifunc=csscomplete#CompleteCSS
set guifont=Comic\ Shanns\ Regular
set tabstop=4
set autoindent
set expandtab
set smarttab
set hlsearch
set incsearch
set ruler
set cursorline
set cursorcolumn
set timeout timeoutlen=3000 ttimeoutlen=100
set belloff=all
set showmatch
set ttyfast
set showcmd
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"
vnoremap <leader>p "_dP
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
vnoremap J :m '>+1<CR>gv=gv 
vnoremap K :m '>-2<CR>gv=gv 
nnoremap <Leader>wq <esc>:wq<CR>
nnoremap <Leader>q <esc>:q<CR>
nnoremap <Leader>ww <esc>:w<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>v :vsp<CR>
nnoremap <Leader>h :sp<CR>
nnoremap <Leader>pv :Lex<CR>
nnoremap <Leader><CR> :so ~/.vimrc<CR>
nnoremap <Leader>wl <C-w><C-l>
nnoremap <Leader>wj <C-w><C-j>
nnoremap <Leader>wk <C-w><C-k>
nnoremap <Leader>wh <C-w><C-h>
nnoremap <Leader><S-v> <C-v>
vnoremap <Leader>c <esc>
nnoremap <Leader>e $
nnoremap <Leader>s 0
vnoremap < <gv
vnoremap > >gv
call plug#begin('~/.vim/plugged')
Plug 'ayu-theme/ayu-vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'eslint/eslint'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'mogelbrod/vim-jsonpath'
Plug 'OmniSharp/omnisharp-vim'
Plug 'morhetz/gruvbox'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'tyrannicaltoucan/vim-deep-space'
call plug#end()
set termguicolors
let ayucolor="dark"
colorscheme ayu
