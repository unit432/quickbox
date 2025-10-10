return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = { -- Insert mode
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-h>"] = require("telescope.actions").cycle_history_prev,
            ["<C-l>"] = require("telescope.actions").cycle_history_next,
          },
          n = { -- Normal mode
            ["j"] = require("telescope.actions").move_selection_next,
            ["k"] = require("telescope.actions").move_selection_previous,
            ["h"] = require("telescope.actions").cycle_history_prev,
            ["l"] = require("telescope.actions").cycle_history_next,
          },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        layout_config = {
          horizontal = { width = 0.8, height = 0.9, preview_width = 0.5 },
          preview_width = 0.5,       -- Reduce preview size
        },
        sorting_strategy = "ascending", -- Show results in ascending order
        dynamic_preview_title = true,   -- Dynamically update preview title
        prompt_prefix = " ",
        selection_caret = " ",
        layout_strategy = "horizontal",
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
        },
        live_grep = {
          theme = "ivy",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
        },
        live_grep_args = {
          auto_quoting = true, -- Dynamically quote strings with spaces
        },
      },
    }

    -- Load extensions
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('live_grep_args')
  end,
}
