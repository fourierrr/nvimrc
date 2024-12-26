return {
  "nvim-telescope/telescope.nvim",
  -- replace all Telescope keymaps with only one mapping
  keys = function()
    return {
      -- { "<leader>ff", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
      -- { "<leader>fF", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      -- { "<leader>sg", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
      -- { "<leader>sG", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      --
      -- { "<leader>f", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
      -- { "<leader>F", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      -- { "<leader>t", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
      -- { "<leader>T", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
    }
  end,
}
