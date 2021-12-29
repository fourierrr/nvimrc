syntax on 
let mapleader=" "
set hlsearch
set ignorecase
exec "nohlsearch"
set incsearch
set cursorline
set number
set relativenumber

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
" open a terminal in a buttom split windows
map T :sp<CR><C-w>j:term<CR>
map R :source %<CR>
map ; :

call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'SirVer/ultisnips'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim'
Plug 'ayu-theme/ayu-vim'
Plug 'yegappan/mru'
Plug 'rakr/vim-one'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" ultisnips conf ###############################################
let g:UltiSnipsExpandTrigger="<tab>"



"mru conf #######################################
nnoremap mm :MRUToggle<CR>


"vim-go conf  ###############################################
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_fields = 1
let g:go_highlight_operations = 1

"fzf conf ###############################################
nnoremap <silent><nowait> <LEADER>o :<C-u>FZF<CR> 
nnoremap <silent><nowait> <LEADER>f :<C-u>Rg<CR> 
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

"nerdtree-git-plugin conf #######################################
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

"nerdtree conf #################################################
" autocmd vimenter * if !argc()|NERDTree|endif
nnoremap ff :NERDTreeToggle<CR> 
nnoremap fc :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let g:NERDTreeWinSize = 35
"let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = '-'
"let NERDTreeDirArrows = 1


"Togglebar conf #######################################
nmap tt :TagbarToggle<CR>
let g:tagbar_map_showproto = '\'
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }


"colorscheme conf ###############################################
"set termguicolors
"let ayucolor="dark"
"colorscheme ayu

colorscheme one
set background=dark
highlight Normal guibg=NONE ctermbg=None
let g:airline_theme='one'


"coc conf    #######################################
autocmd filetype * highlight Pmenu ctermbg=lightgray 
autocmd filetype * highlight Cursorline ctermbg=none cterm=underline 

" 几个非常重要的定义跳转键,gd, gr
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 回车时，选择自动补全窗口的第一项
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"在输入一部分字符的情况下，用tab来自动补全
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
