return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "codecompanion",
      callback = function()
        vim.keymap.set("i", "<C-s>", "<Esc><CR>", { buffer = true, desc = "Submit chat" })
      end,
    })
  end,
  opts = {
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {})
      end,
    },
    strategies = {
      chat = { adapter = "copilot" },
      inline = { adapter = "copilot" },
    },
  },
  keys = {
    { "<leader>ac", "<cmd>CodeCompanionChat Toggle<CR>", desc = "Toggle AI Chat" },
    { "<leader>aa", "<cmd>CodeCompanionActions<CR>", desc = "AI Actions", mode = { "n", "v" } },
    { "<leader>ai", "<cmd>CodeCompanion<CR>", desc = "AI Inline", mode = { "n", "v" } },
  },
}
