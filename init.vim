lua << END
require "user.keymaps"
require "user.options"
END


exec "nohlsearch"
au BufRead,BufNewFile Dockerfile.* set filetype=dockerfile

call plug#begin('~/.config/nvim/plugged')
Plug 'lewis6991/impatient.nvim'
Plug 'ethanholz/nvim-lastplace'
" Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'xiyaowong/nvim-transparent'
Plug 'goolord/alpha-nvim'
" Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'majutsushi/tagbar'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
"" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'SirVer/ultisnips'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim',{ 'do': 'yarn install'  }
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-lualine/lualine.nvim'
Plug 'Pocco81/AutoSave.nvim'
" Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ahmedkhalf/project.nvim'
" Plug 'voldikss/vim-floaterm'
Plug 'doums/floaterm.nvim'
Plug 'gcmt/wildfire.vim'
Plug 'honza/vim-snippets'
" Plug 'yegappan/mru'
"colorscheme Plug
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
" Plug 'rakr/vim-one'
" Plug 'ayu-theme/ayu-vim'
call plug#end()


"inpatient nvim  speed up loading lua module
lua require('impatient')
lua require('user.conf.autosave')
lua require('user.conf.nvim-lastplace')

" ultisnips conf ###############################################
let g:UltiSnipsExpandTrigger="<tab>"



"mru conf #######################################
" nnoremap mm :MRUToggle<CR>


"vim-go conf  ###############################################
" let g:go_def_mode="godef"
" let g:go_fmt_command = "goimports"
" let g:go_list_type = "quickfix"
" let g:go_fmt_autosave = 1
" let g:go_import_autosave = 1
" let g:go_auto_type_info = 1
" let g:go_highlight_types = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_function_parameters = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_operations = 1
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0

"telescope conf
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>p <cmd>Telescope projects<cr>
nnoremap mm <cmd>Telescope oldfiles<cr>
nnoremap <leader>o <cmd>Telescope oldfiles<cr>

"gitsigns 
lua << END
require('gitsigns').setup()
END

"floaterm
lua << END
require('floaterm').setup()
END

"bufferline conf 
lua << END
require "user.conf.bufferline"
END
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

"lualine conf
lua << END
require "user.conf.lualine"
END

"alpha-nvim conf
lua << END
require "user.conf.alpha-nvim"
END

lua << END
require "user.conf.nvim-transparent"
END
nmap <leader>t :TransparentToggle<cr>

"nvim-tree conf
lua << END
require "user.conf.nvim-tree"
END
nmap ff :NvimTreeToggle<cr>

"project conf 
lua << END
require "user.conf.project"
END

"floaterm cof ###############################################
nmap T :Fterm<CR>


"coc conf    #######################################
let g:coc_global_extensions = [
    \ 'coc-actions',
    \ 'coc-snippets',
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-docker',
    \ 'coc-vimlsp',
	\ 'coc-go']

" 几个非常重要的定义跳转键,gd, gr
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w
nmap <leader>rn <Plug>(coc-rename)

" coc-snippets
imap <C-a> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-e>'
let g:coc_snippet_prev = '<c-n>'
imap <C-e> <Plug>(coc-snippets-expand-jump)

"查找上一个下一个报错的代码段
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <leader>- <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>= <Plug>(coc-diagnostic-next)

"在输入一部分字符的情况下，用tab来自动补全
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction


" 回车时，选择自动补全窗口的第一项
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


"colorscheme conf ###############################################
"set termguicolors
"let ayucolor="dark"
"colorscheme ayu
" colorscheme one
" Vim Script
colorscheme catppuccin
" highlight Normal guibg=NONE ctermbg=None
" highlight Pmenu ctermbg=lightgray 
" highlight Cursorline ctermbg=none cterm=underline 
" au BufRead,BufNewFile * highlight Pmenu ctermbg=lightgray 
" au BufRead,BufNewFile * highlight Cursorline ctermbg=none cterm=underline 

