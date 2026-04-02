return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter", -- Load as soon as you start typing
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- Integration with LSP
    "hrsh7th/cmp-buffer",   -- Complete words from current buffer
    "hrsh7th/cmp-path",     -- Complete file paths
    "saadparwaiz1/cmp_luasnip", -- Snippet engine integration
    "L3MON4D3/LuaSnip",     -- The actual snippet engine
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        -- Note: We leave <Tab> alone because your Copilot uses <C-j>
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
