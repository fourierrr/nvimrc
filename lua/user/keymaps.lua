local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader=" "
vim.g.maplocalleader=" "

-- Modes normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t", command_mode = "c",

keymap("","q","<Nop>", opts)
keymap("","?","<Nop>", opts)
-- keymap("","r","<Nop>", opts)

-- window navigation
keymap("n","<C-h>","<C-w>h",opts)
keymap("n","<C-l>","<C-w>l",opts)
keymap("n","<leader><up>","<C-w>k",opts)
keymap("n","<leader><down>","<C-w>j",opts)
keymap("n","<leader><left>","<C-w>h",opts)
keymap("n","<leader><right>","<C-w>l",opts)


-- move hole line up or down
keymap("n","<A-up>","<Esc>:m .-2<CR>",opts)
keymap("n","<A-down>","<Esc>:m .+1<CR>",opts)

-- fastquit and delete buffer
keymap("n","<leader>q",":q<CR>",opts)
keymap("n","<leader>d",":bdelete<CR>",opts)

keymap("i","jk","<ESC>",opts)
keymap("i","<C-\\>","<ESC>o",opts)

-- visual_mode indent change >  and <
keymap("v","<","<gv",opts)
keymap("v",">",">gv",opts)


-- accelarate j k
keymap("","<S-down>","7j",opts)
keymap("","<S-up>","7k",opts)
keymap("","<C-j>","7j",opts)
keymap("","<C-k>","7k",opts)

keymap("","R",":w<CR>:source %<CR>",opts)
keymap("","S",":w<CR>",opts)
keymap("",";",":",opts)

keymap("","<leader><CR>",":nohlsearch<CR>",opts)
keymap("","=","nzz",opts)
keymap("","-","Nzz",opts)

-- toggle show number and gitgutter
keymap("","<leader>n",":set nu! relativenumber!<CR>:GitGutterToggle<CR>",opts)

-- floaterm
keymap("n","T",":Fterm<CR>",opts)

-- nvim-tree kemap
keymap("n","ff",":NvimTreeToggle<CR>",opts)

-- telescope keymap
keymap("n","<leader>f","<cmd>Telescope find_files<cr>",opts)
keymap("n","<leader>g","<cmd>Telescope live_grep<cr>",opts)
keymap("n","<leader>b","<cmd>Telescope buffers<cr>",opts)
keymap("n","<leader>p","<cmd>Telescope projects<cr>",opts)
keymap("n","<leader>o","<cmd>Telescope oldfiles<cr>",opts)
keymap("n","mm","<cmd>Telescope oldfiles<cr>",opts)

-- trouble keymap
keymap("n","<leader>u","<cmd>TroubleToggle<CR>",opts)

-- bufferline keymap
-- nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
keymap("","<leader>1","<cmd>BufferLineGoToBuffer 1<CR>",opts)
keymap("","<leader>2","<cmd>BufferLineGoToBuffer 2<CR>",opts)
keymap("","<leader>3","<cmd>BufferLineGoToBuffer 3<CR>",opts)
keymap("","<leader>4","<cmd>BufferLineGoToBuffer 4<CR>",opts)
keymap("","<leader>5","<cmd>BufferLineGoToBuffer 5<CR>",opts)
keymap("","<leader>6","<cmd>BufferLineGoToBuffer 6<CR>",opts)
keymap("","<leader>7","<cmd>BufferLineGoToBuffer 7<CR>",opts)
keymap("","<leader>8","<cmd>BufferLineGoToBuffer 8<CR>",opts)
keymap("","<leader>9","<cmd>BufferLineGoToBuffer 9<CR>",opts)

