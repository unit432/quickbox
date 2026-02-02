return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local actions = require("telescope.actions")

    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-h>"] = actions.cycle_history_prev,
            ["<C-l>"] = actions.cycle_history_next,
          },
          n = {
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
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
        -- FIX: Removed preview_width from the root of layout_config
        layout_config = {
          horizontal = {
            width = 0.8,
            height = 0.9,
            preview_width = 0.5
          },
          vertical = {
            mirror = false,
          },
        },
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        dynamic_preview_title = true,
        -- Updated icons for Nerd Font V3
        prompt_prefix = "   ",
        selection_caret = "󰄾 ",
        entry_prefix = "  ",
      },
      pickers = {
        find_files = {
          -- Dropdown handles its own layout, so it won't crash now
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
          auto_quoting = true,
        },
      },
    }

    -- Load extensions
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('live_grep_args')
  end,
}
