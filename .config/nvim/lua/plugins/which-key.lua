return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- Disable icons in Which Key
    icon = nil,
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
