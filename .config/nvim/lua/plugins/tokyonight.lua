return {
  "folke/tokyonight.nvim",
  lazy = false, -- Must load immediately at startup
  priority = 1000, -- Load early to avoid flashing default colors
  config = function()
    require("tokyonight").setup({
      -- 1. FIX: Change the 'style' option from "moon" to "storm"
      style = "night",

      terminal_colors = true, -- Inherit terminal colors
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },

      -- 2. FIX: The colorscheme name is just 'tokyonight', not 'tokyonight-strom'.
      -- The 'style' option in setup() controls the variant.
      vim.cmd("colorscheme tokyonight"),
    })
  end,
}
