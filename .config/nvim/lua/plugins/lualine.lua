return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- Helper for Copilot.vim (Vimscript version) status
      local function copilot_status()
        local status = vim.fn['copilot#Enabled']()
        if status == 1 then
          return " " -- Active icon
        else
          return " " -- Disabled icon
        end
      end

      require("lualine").setup({
        sections = {
          lualine_x = {
            -- 1. Copilot Status
            {
              copilot_status,
              color = { fg = "#6CC644" }, -- GitHub Green
            },
            -- 2. CodeCompanion Spinner (Gemini)
            {
              function()
                local status = require("codecompanion").status()
                if status then
                  return " " .. status -- Shows "Thinking..." or "Processing"
                end
                return ""
              end,
              cond = function()
                return package.loaded["codecompanion"] ~= nil
              end,
            },
            "encoding",
            "filetype",
          },
        },
      })
    end,
  },
}
