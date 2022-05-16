local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 1,
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  smartcase = true,
  number = true,
  relativenumber = true,
  cursorline = true, -- highlight the current line


  termguicolors = true,
  wrap = true,
  showcmd = true,
  updatetime = 200,
  fileencoding = "utf-8",

  mouse = "a",
  showtabline = 2,
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  scrolloff = 5,
  foldmethod = "expr", -- fold with nvim_treesitter
  foldexpr = "nvim_treesitter#foldexpr()",
  foldenable = false, -- no fold to be applied when open a file
  foldlevel = 99, -- if not set this, fold will be everywhere

}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end


--  增加连词符
vim.cmd [[set iskeyword+=-]]

-- vim.cmd [[set <a-cr>=^[^M]]
