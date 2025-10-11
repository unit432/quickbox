return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require'alpha'
    local dashboard = require'alpha.themes.dashboard'

    vim.cmd("colorscheme tokyonight")

    -- Set the custom header (ASCII Art or custom text)
    dashboard.section.header.val = {
      "   ____  _   _          ____    ____ ____ ",
      "  |  _ \\| | | | ___ ___| __ ) | __ ) ___|",
      "  | |_) | | | |/ _ ` __|  _ \\ |  _ \\ / _ \\",
      "  |  __/| |_| |  __/  __| |_) || __/|  __/",
      "  |_|    \\___/ \\___|_|   |____/ |____|\\___|"
    }

    -- Define buttons for quick access actions
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New File", ":ene <BAR> startinsert <CR>"),
      dashboard.button("o", "  Recent Files", ":Telescope oldfiles<CR>"),
      dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
      dashboard.button("g", "  Find Text", ":Telescope live_grep<CR>"),
      dashboard.button("p", "  Project", ":Telescope projects<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- Setup the alpha dashboard with the defined configuration
    alpha.setup(dashboard.config)
  end
}
