return {
  "catppuccin/nvim",
  config = function()
    vim.g.catppuccin_flavor = "latte"  -- Set the Catppuccin flavor
    vim.cmd("colorscheme catppuccin")
    vim.o.background = "light"        -- Set the background to light
  end,
}
