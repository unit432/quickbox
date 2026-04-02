return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = { "zbirenbaum/copilot.lua", "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ac", "<cmd>CopilotChatToggle<CR>", desc = "Copilot Chat" },
    { "<leader>ae", "<cmd>CopilotChatExplain<CR>", desc = "Explain", mode = "v" },
    { "<leader>af", "<cmd>CopilotChatFix<CR>", desc = "Fix", mode = "v" },
  },
  opts = {},
}
