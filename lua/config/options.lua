-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false

-- diskabel all animation
vim.g.snacks_animate = false

-- yank to system clipboard
-- need ojroques/vim-oscyank plugin
-- no need to install xclip or xsel 
-- no need to set vim.opt.clipboard = "unnamedplus"
vim.cmd(
	[[ autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankRegister "' | endif ]]
)
