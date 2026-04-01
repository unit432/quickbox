return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- Helper for copilot.lua status
      local function copilot_status()
        local ok, api = pcall(require, "copilot.api")
        if not ok then return "" end
        local status = api.status.data.status
        if status == "Normal" then
          return " "
        elseif status == "InProgress" then
          return " " -- You could add a spinner here
        else
          return " "
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
