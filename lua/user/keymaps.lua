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
keymap("","r","<Nop>", opts)

-- window navigation
keymap("n","<C-h>","<C-w>h",opts)
keymap("n","<C-j>","<C-w>j",opts)
keymap("n","<leader><up>","<C-w>k",opts)
keymap("n","<leader><down>","<C-w>j",opts)
keymap("n","<leader><left>","<C-w>h",opts)
keymap("n","<leader><right>","<C-w>l",opts)


-- move hole line up or down
keymap("n","<A-up>","<Esc>:m .-2<CR>",opts)
keymap("n","<A-down","<Esc>:m .+1<CR>",opts)

-- fastquit and delete buffer
keymap("n","<leader>q",":q<CR>",opts)
keymap("n","<leader>d",";bdelete",opts)

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

keymap("","<leader><CR>",":nohlsearch",opts)
keymap("","=","nzz",opts)
keymap("","-","Nzz",opts)

-- toggle show number and gitgutter
keymap("","<leader>n",":set nu! relativenumber!<CR>:GitGutterToggle<CR>",opts)
