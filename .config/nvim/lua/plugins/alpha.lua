return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set the custom header
    dashboard.section.header.val = {
      "    ____  _   _          ____    ____ ____ ",
      "   |  _ \\| | | | ___ ___| __ ) | __ ) ___|",
      "   | |_) | | | |/ _ ` __|  _ \\ |  _ \\ / _ \\",
      "   |  __/| |_| |  __/  __| |_) || __/|  __/",
      "   |_|    \\___/ \\___|_|   |____/ |____|\\___|"
    }

    -- Define buttons with updated Nerd Font icons
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New File", ":ene <BAR> startinsert <CR>"),
      dashboard.button("o", "󰄉  Recent Files", ":Telescope oldfiles<CR>"),
      dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
      dashboard.button("g", "󰱽  Find Text", ":Telescope live_grep<CR>"),
      dashboard.button("p", "󰉋  Projects", ":Telescope projects<CR>"),
    }

    -- Footer: Optional, shows how many plugins you have loaded
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"

    -- Setup: Use .opts, not .config
    alpha.setup(dashboard.opts)
  end
}
