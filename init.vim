syntax on 
let mapleader=" "
set hlsearch
set ignorecase
exec "nohlsearch"
set incsearch
set number
set cursorline
set wrap
set showcmd
set cmdheight=2
set updatetime=300
set wildmenu

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set scrolloff=5

map <S-down> 5<down>
map <S-up> 5<up>

"map <LEADER><LEADER> <ESC>/<++><CR>c4l
map <LEADER>html :%TOhtml<CR>

map <LEADER><up> <C-w>k
map <LEADER><down> <C-w>j
map <LEADER><left> <C-w>h
map <LEADER><right> <C-w>l

noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>





map Q :q<CR>
map S :w<CR>
map R :source %<CR>
map ; :

call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim'
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'
Plug 'jiangmiao/auto-pairs'
call plug#end()


"nerdtree conf #################################################
autocmd vimenter * if !argc()|NERDTree|endif
nnoremap ff :NERDTreeToggle<CR> 
let g:NERDTreeWinSize = 35
"let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = '-'
"let NERDTreeDirArrows = 1



"set termguicolors
"let ayucolor="dark"
"colorscheme ayu

colorscheme one
set background=dark
highlight Normal guibg=NONE ctermbg=None
let g:airline_theme='one'

