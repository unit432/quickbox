return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp", -- Optional: for autocompletion in chat
    "nvim-telescope/telescope.nvim", -- Optional: for file/buffer picking
    { "github/copilot.vim" }, -- Optional: for ghost text autocomplete
  },
  opts = {
    strategies = {
      chat = { adapter = "gemini" },
      inline = { adapter = "gemini" },
      agent = { adapter = "gemini" },
    },
    adapters = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          env = { api_key = "GEMINI_API_KEY" },
          schema = {
            model = { default = "gemini-2.0-flash" },
            temperature = { default = 0.2 },
          },
        })
      end,
    },
    display = {
      chat = {
        show_settings = true, -- Shows model info at the top of the chat
        render_headers = false, -- Cleaner look if you use a markdown plugin
      },
    },
  },
  keys = {
    { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle AI Chat" },
    { "<leader>ca", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI Actions" },
    { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add code to Chat" },
    { "<leader>ci", "<cmd>CodeCompanion<cr>", mode = "n", desc = "Inline Prompt" },
  },
}
