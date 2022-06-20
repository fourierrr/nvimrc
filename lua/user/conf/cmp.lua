local status_cmp_ok, cmp = pcall(require, "cmp")
if not status_cmp_ok then
  return "cmp not load!"
end
local status_luasnip_ok, luasnip = pcall(require, "luasnip")
if not status_luasnip_ok then
  return "luasnip not load!"
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
require("luasnip.loaders.from_vscode").lazy_load() -- load freindly-snippets
require("luasnip.loaders.from_vscode").load({ paths = { -- load custom snippets
  vim.fn.stdpath("config") .. "/my-snippets"
} }) -- Load snippets from my-snippets folder

Cmp_config = {
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = true,
  },
  preselect = cmp.PreselectMode.None,

  completion = {
    ---@usage The minimum length of a word to complete on.
    -- keyword_length = 1,

    -- hight the first selection
    completeopt = 'menu,menuone,noinsert'

  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    max_width = 50,
    kind_icons = {
      Class = " ",
      Color = " ",
      Constant = "ﲀ ",
      Constructor = " ",
      Enum = "練",
      EnumMember = " ",
      Event = " ",
      Field = " ",
      File = "",
      Folder = " ",
      Function = " ",
      Interface = "ﰮ ",
      Keyword = " ",
      Method = " ",
      Module = " ",
      Operator = "",
      Property = " ",
      Reference = " ",
      Snippet = " ",
      Struct = " ",
      Text = " ",
      TypeParameter = " ",
      Unit = "塞",
      Value = " ",
      Variable = " ",
    },
    source_names = {
      nvim_lsp = "(LSP)",
      treesitter = "(TS)",
      emoji = "(Emoji)",
      path = "(Path)",
      calc = "(Calc)",
      cmp_tabnine = "(Tabnine)",
      vsnip = "(Snippet)",
      luasnip = "(Snippet)",
      buffer = "(Buffer)",
      spell = "(Spell)",
    },
    duplicates = {
      buffer = 1,
      path = 1,
      nvim_lsp = 0,
      luasnip = 1,
    },
    duplicates_default = 0,
    format = function(entry, vim_item)
      local max_width = Cmp_config.formatting.max_width
      if max_width ~= 0 and #vim_item.abbr > max_width then
        vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
      end
      vim_item.kind = Cmp_config.formatting.kind_icons[vim_item.kind]
      -- vim_item.menu = Cmp_config.formatting.source_names[entry.source.name]
      vim_item.menu = entry:get_completion_item().detail
      vim_item.dup = Cmp_config.formatting.duplicates[entry.source.name]
          or Cmp_config.formatting.duplicates_default
      return vim_item
    end,
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "cmp_tabnine" },
    { name = "nvim_lua" },
    { name = "spell" },
    { name = "calc" },
    { name = "emoji" },
    { name = "treesitter" },
    { name = "crates" },
  },
  mapping = cmp.mapping.preset.insert {
    -- ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),

    ["<C-p>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i","c"}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      -- vim.cmd(":echo starttab <CR> ")
      if cmp.visible() then
        -- cmp.select_next_item()
        cmp.confirm({ select = true })
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
        -- elseif has_words_before() then
        -- cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      -- if cmp.visible() then
      --   cmp.select_prev_item()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

  },
}
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })

cmp.setup.cmdline('?', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'cmdline' }
  }, {
    { name = 'path' }
  })
})

-- disable autocompletion for guihua
vim.cmd("autocmd FileType guihua lua require('cmp').setup.buffer { enabled = false }")
vim.cmd("autocmd FileType guihua_rust lua require('cmp').setup.buffer { enabled = false }")

cmp.setup(Cmp_config)
