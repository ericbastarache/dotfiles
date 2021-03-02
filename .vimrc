set runtimepath+=~/.vim_runtime
source ~/.vim/bundle/fzf/plugin/fzf.vim
set rtp+=~/.vim/bundle/fzf/bin/fzf
let g:fzf_layout = { 'down': '40%' }
set number
set rnu
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
highlight CursorColumn guibg=#636363
set visualbell
set showmatch
set ttyfast
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"
map <silent><Leader>p "*p 
map <silent><Leader>c "*y
map <silent><Leader>x "*x
nnoremap <Leader>wq <esc>:wq<CR>
nnoremap <Leader>ws <esc>:w<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>v :vsp<CR>
nnoremap <Leader>h :sp<CR>
nnoremap <Leader>wl <C-w><C-l>
nnoremap <Leader>wj <C-w><C-j>
nnoremap <Leader>wk <C-w><C-k>
nnoremap <Leader>wh <C-w><C-h>
nnoremap <Leader><S-v> <C-v>
nnoremap <S-k> :m-2<CR>
nnoremap <S-j> :m+<CR>
inoremap <S-k> <Esc>:m-2<CR>
inoremap <S-j> <Esc>:m+<CR>
inoremap <Leader>es <esc>
vnoremap <Leader>es <esc>
nnoremap <Leader>e $
nnoremap <Leader>s 0
vnoremap < <gv
vnoremap > >gv
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
call plug#end()
let g:gruvbox_contrast_dark = 'hard'
let g:airline_theme='bubblegum'
autocmd vimenter * ++nested colorscheme gruvbox

try
    source ~/.vim_runtime/my_configs.vim
catch
endtry
