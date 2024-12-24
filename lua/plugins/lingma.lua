return {
  {
    url = "git@gitlab.alibaba-inc.com:kuafu-io/lingma.nvim.git",
    build = "./install.sh",
    lazy = false,
    dependencies = {
      "hrsh7th/nvim-cmp",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("lingma").setup({
        chat_trigger_key = "<leader>hh",
        contex_update_key = "<leader>uu",
        allow_statistics = true,
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = { "git@gitlab.alibaba-inc.com:kuafu-io/lingma.nvim.git" },
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "Lingma",
        group_index = 1,
        priority = 100,
      })
    end,
  },
  {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = { "git@gitlab.alibaba-inc.com:kuafu-io/lingma.nvim.git", "saghen/blink.compat" },
    opts = {
      sources = {
        compat = { "Lingma" },
        providers = {
          Lingma = {
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
}
