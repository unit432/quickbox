return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      -- Web Development
      javascript = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
      scss = { "prettierd", "prettier", stop_after_first = true },
      
      -- Ruby & Templates
      -- ruby = { "standardrb", "rubocop" },
      haml = { "haml_lint" }, -- Note: haml-lint is the standard for HAML
      
      -- PHP
      -- "pint" is great for Laravel, "php_cs_fixer" is the general standard
      php = { "php_cs_fixer", "pint", stop_after_first = true },
      
      -- Configs
      lua = { "stylua" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
