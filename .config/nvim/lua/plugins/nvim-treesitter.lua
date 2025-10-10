return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Treesitter configuration
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "ruby", "html", "javascript", "css", "scss", "lua", "json" }, -- Add all your languages
      sync_install = false, -- Install languages asynchronously
      auto_install = true, -- Automatically install missing parsers
      highlight = {
        enable = true, -- Enable syntax highlighting
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true }, -- Enable smart indentation
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn", -- Initialize selection
          node_incremental = "grn", -- Increment to the upper named parent
          scope_incremental = "grc", -- Increment to the upper scope
          node_decremental = "grm", -- Decrement to the previous node
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to the text object
          keymaps = {
            ["af"] = "@function.outer", -- Select around a function
            ["if"] = "@function.inner", -- Select inside a function
            ["ac"] = "@class.outer", -- Select around a class
            ["ic"] = "@class.inner", -- Select inside a class
          },
        },
      },
    }
  end,
}
