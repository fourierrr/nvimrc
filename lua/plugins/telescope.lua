return {
  "nvim-telescope/telescope.nvim",
  -- replace all Telescope keymaps with only one mapping
  keys = function()
    return {
      { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    }
  end,
}
