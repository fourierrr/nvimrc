local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

-- draw by https://patorjk.com/software/taag/#p=display&v=0&f=ANSI%20Shadow&t=Alibaba
local art = {
  "                                                    ",
  " █████╗ ██╗     ██╗██████╗  █████╗ ██████╗  █████╗  ",
  "██╔══██╗██║     ██║██╔══██╗██╔══██╗██╔══██╗██╔══██╗ ",
  "███████║██║     ██║██████╔╝███████║██████╔╝███████║ ",
  "██╔══██║██║     ██║██╔══██╗██╔══██║██╔══██╗██╔══██║ ",
  "██║  ██║███████╗██║██████╔╝██║  ██║██████╔╝██║  ██║ ",
  "╚═╝  ╚═╝╚══════╝╚═╝╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝ ",
  "                                                    ",
}
-- dashboard.section.header.val = {
-- [[           ................          ................]],
-- [[    .::::::::::::::::::::          ::::::::::::::::::::.]],
-- [[  .:::::::::::::::::::::.          .:::::::::::::::::::::.]],
-- [[ ::::::::::::::::::::...            ...::::::::::::::::::::]],
-- [[::::::::::::....                            ....:::::::::::.]],
-- [[:::::::::.                                        .:::::::::]],
-- [[::::::::.                                          .::::::::]],
-- [[::::::::.                                          .::::::::]],
-- [[::::::::.                                          .::::::::]],
-- [[::::::::.               ............               .::::::::]],
-- [[::::::::.               ............               .::::::::]],
-- [[::::::::.                                          .::::::::]],
-- [[::::::::.                                          .::::::::]],
-- [[::::::::.                                          .::::::::]],
-- [[:::::::::.                                        .:::::::::]],
-- [[.::::::::::::...                            ...::::::::::::.]],
-- [[ :::::::::::::::::::::..            ..:::::::::::::::::::::]],
-- [[  .:::::::::::::::::::::.          ::::::::::::::::::::::.]],
-- [[    .::::::::::::::::::::          ::::::::::::::::::::.]],
-- [[         ................          ...............]],
-- }

local headers = {
  type = "text",
  val = art,
  opts = {
    position = "center",
    hl = "Constant",
  },
}

local plugins = ""
if vim.fn.has "linux" == 1 or vim.fn.has "mac" == 1 then
  local handle = io.popen('ls  $HOME"/.local/share/nvim/site/pack/packer/start" | wc -l ')
  plugins = handle:read("*a")
  handle:close()

  plugins = plugins:gsub("^%s*(.-)%s*$", "%1")
else
  plugins = "N/A"
end


local version = vim.version()
local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch

local pluginCount = {
  type = "text",
  val = "Neovim " .. print_version .. "    " .. plugins .. " plugins in total.",
  opts = {
    position = "center",
    hl = "String",
  },
}

local function button(usr_opts, txt, keybind, keybind_opts)
  local leader = '<LD>'
  local sc_after = usr_opts.shortcut:gsub('%s', ''):gsub(leader, '<leader>')

  local default_opts = {
    position = 'center',
    cursor = 5,
    width = 50,
    align_shortcut = 'right',
    hl_shortcut = 'Constant'
  }
  local opts = vim.tbl_deep_extend('force', default_opts, usr_opts)

  if nil == keybind then
    keybind = sc_after
  end
  keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
  opts.keymap = { 'n', sc_after, keybind, keybind_opts }

  local function on_press()
    -- local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
    local key = vim.api.nvim_replace_termcodes(sc_after .. '<Ignore>', true, false, true)
    vim.api.nvim_feedkeys(key, 't', false)
  end

  return {
    type = 'button',
    val = txt,
    on_press = on_press,
    opts = opts,
  }
end

local buttons = {
  type = "group",
  val = {
    -- { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
    { type = "padding", val = 1 },
    -- dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    button({ shortcut = 'f', hl = { { 'DevIconC', 2, 3 } } }, "  Find file", ":Telescope find_files <CR>"),
    { type = "padding", val = 1 },
    -- dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    button({ shortcut = 'e', hl = { { 'DevIconD', 2, 3 } } }, "  New file", ":ene <BAR> startinsert <CR>"),
    { type = "padding", val = 1 },
    -- dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
    button({ shortcut = 'p', hl = { { 'DevIconGo', 2, 3 } } }, "  Find project", ":Telescope projects <CR>"),
    { type = "padding", val = 1 },
    button({ shortcut = 'o', hl = { { 'DevIconHtm', 2, 3 } } }, "  Recently used files", ":Telescope oldfiles <CR>"),
    { type = "padding", val = 1 },
    button({ shortcut = 't', hl = { { 'DevIconDb', 2, 3 } } }, "  Find text", ":Telescope live_grep <CR>"),
    { type = "padding", val = 1 },
    button({ shortcut = 'c', hl = { { 'DevIconPy', 2, 3 } } }, "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
    { type = "padding", val = 1 },
    -- dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    button({ shortcut = 'q', hl = { { 'DevIconPdf', 2, 3 } } }, "  Quit Neovim", ":qa<CR>"),
    { type = "padding", val = 1 },
    { type = "padding", val = 1 },
    { type = "text", val = "--- 人算不如天算，天算就是云计算😎 ---",
      opts = { position = "center", hl = "Constant" } },
  },
  position = "center",
}

local function footer()
  -- NOTE: requires the fortune-mod package to work
  local datetime = os.date('%Y/%m/%d %H:%M:%S')
  return datetime
end

local foot = {
  type = "text",
  val = footer(),
  opts = {
    position = "center",
    hl = "String",
  },
}

-- dashboard.section.footer.val = footer()
-- dashboard.section.footer.opts.hl = "Type"
-- dashboard.section.header.opts.hl = "include"
-- dashboard.section.buttons.opts.hl = "Keyword"
dashboard.config.layout = {
  { type = "padding", val = 2 },
  headers,
  { type = "padding", val = 2 },
  pluginCount,
  { type = "padding", val = 2 },
  buttons,
  { type = "padding", val = 2 },
  foot,
}

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
-- alpha.setup(opts)
