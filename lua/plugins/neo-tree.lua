return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
    {
      "ff",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
    -- {
    --   "<leader>fE",
    --   function()
    --     require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
    --   end,
    --   desc = "Explorer NeoTree (cwd)",
    -- },
    -- { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
    -- { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    { "<leader>fe", false },
    { "<leader>fE", false },
    { "<leader>ge", false },
    { "<leader>be", false },
  },
  opts = {
    sources = { "filesystem", "buffers", "git_status" },
    open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
    window = {
      mappings = {
        -- key 'ff' for toggle NeotreeOpen
        ["f"] = "",
      },
    },
  },
}
