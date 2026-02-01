return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    { "github/copilot.vim" }, -- Optional: for ghost text autocomplete
  },
  -- This table is passed to require("codecompanion").setup(opts)
  opts = {
    strategies = {
      chat = {
        adapter = "gemini",
      },
      inline = {
        adapter = "gemini",
      },
    },
    adapters = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          env = {
            api_key = "GEMINI_API_KEY",
          },
          schema = {
            model = {
              default = "gemini-2.0-flash",
            },
          },
        })
      end,
    },
    opts = {
      log_level = "DEBUG",
    },
  },
  -- Adding keymaps so you can actually open the interface
  keys = {
    { "<leader>ca", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
    { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "CodeCompanion Chat" },
    { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add code to CodeCompanion" },
  },
}
