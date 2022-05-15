local fn = vim.fn

-- Automatically install packer
-- local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
-- if fn.empty(fn.glob(install_path)) > 0 then
--   PACKER_BOOTSTRAP = fn.system {
--     "git",
--     "clone",
--     "--depth",
--     "1",
--     "https://github.com/wbthomason/packer.nvim",
--     install_path,
--   }
--   print "Installing packer close and reopen Neovim..."
--   vim.cmd [[packadd packer.nvim]]
-- end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("packer not found!")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    -- open_fn = function()
    --   return require("packer.util").float { border = "rounded" }
    -- end,
  },
}


--  useage
-- use {
--   "myusername/example",        -- The plugin location string
--   -- The following keys are all optional
--   disable = boolean,           -- Mark a plugin as inactive
--   as = string,                 -- Specifies an alias under which to install the plugin
--   installer = function,        -- Specifies custom installer. See "custom installers" below.
--   updater = function,          -- Specifies custom updater. See "custom installers" below.
--   after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
--   rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
--   opt = boolean,               -- Manually marks a plugin as optional.
--   branch = string,             -- Specifies a git branch to use
--   tag = string,                -- Specifies a git tag to use. Supports "*" for "latest tag"
--   commit = string,             -- Specifies a git commit to use
--   lock = boolean,              -- Skip updating this plugin in updates/syncs. Still cleans.
--   run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
--   requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
--   rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
--   config = string or function, -- Specifies code to run after this plugin is loaded.
--   -- The setup key implies opt = true
--   setup = string or function,  -- Specifies code to run before this plugin is loaded.
--   -- The following keys all imply lazy-loading and imply opt = true
--   cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
--   ft = string or list,         -- Specifies filetypes which load this plugin.
--   keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
--   event = string or list,      -- Specifies autocommand events which load this plugin.
--   fn = string or list          -- Specifies functions which load this plugin.
--   cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
--   module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
--                                -- with one of these module names, the plugin will be loaded.
--   module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
--   requiring a string which matches one of these patterns, the plugin will be loaded.
-- }

-- Install your plugins here
return packer.startup(function(use)

  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp", --neovim 内置 LSP 客户端的 nvim-cmp 源
      --以下插件可选，可以根据个人喜好删减
      "onsails/lspkind-nvim", --美化自动完成提示信息
      "hrsh7th/cmp-buffer", --从buffer中智能提示
      "hrsh7th/cmp-nvim-lua", --nvim-cmp source for neovim Lua API.
      'hrsh7th/cmp-cmdline',
      -- "octaltree/cmp-look", --用于完成英语单词
      "hrsh7th/cmp-path", --自动提示硬盘上的文件
      -- "hrsh7th/cmp-calc", --输入数学算式（如1+1=）自动计算
      -- "f3fora/cmp-spell", --nvim-cmp 的拼写源基于 vim 的拼写建议
      -- "hrsh7th/cmp-emoji", --输入: 可以显示表情
    }
  }
  use {
    "L3MON4D3/LuaSnip",
    requires = {
      "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
      "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    }
  }

  use "j-hui/fidget.nvim" -- show lsp progress
  use 'folke/trouble.nvim'

  use 'lewis6991/impatient.nvim'
  use 'ethanholz/nvim-lastplace'
  -- use 'airblade/vim-gitgutter'
  use 'lewis6991/gitsigns.nvim'
  use 'phaazon/hop.nvim'
  use 'nvim-lua/plenary.nvim'
  use "norcalli/nvim-colorizer.lua" -- show color

  use 'nvim-telescope/telescope.nvim'
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  }
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-live-grep-raw.nvim"
  use "MattesGroeger/vim-bookmarks"
  use "tom-anders/telescope-vim-bookmarks.nvim"
  use "nvim-telescope/telescope-dap.nvim"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'xiyaowong/nvim-transparent'
  use "kosayoda/nvim-lightbulb" -- code action

  use 'goolord/alpha-nvim'
  use 'majutsushi/tagbar'
  use {
    "akinsho/bufferline.nvim", -- tab
    tag = "v2.*",
  }
  use 'tpope/vim-commentary'
  -- use 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  -- use 'SirVer/ultisnips'
  -- use 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  -- use 'neoclide/coc.nvim',{ 'do': 'yarn install'  }
  use 'jiangmiao/auto-pairs'
  
  -- debug
  use "ravenxrz/nvim-dap"
  use "ravenxrz/DAPInstall.nvim" -- help us install several debuggers
  use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  use 'nvim-lualine/lualine.nvim'
  use 'Pocco81/AutoSave.nvim'
  use "djoshea/vim-autoread"
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'ahmedkhalf/project.nvim'
  use 'doums/floaterm.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  -- use 'gcmt/wildfire.vim'
  -- use 'honza/vim-snippets'
  use {
    "catppuccin/nvim",
    as = "catppuccin",
  }




  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
