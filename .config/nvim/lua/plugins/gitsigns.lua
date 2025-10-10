return {
  "lewis6991/gitsigns.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("gitsigns").setup {
      signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
      },
      signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame = false, -- Disable inline blame
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable for files longer than this
      preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    }

    -- Keybindings for Git actions
    vim.keymap.set("n", "<leader>hs", function()
      require("gitsigns").stage_hunk()
    end, { desc = "Stage hunk" })

    vim.keymap.set("v", "<leader>hs", function()
      require("gitsigns").stage_hunk { vim.fn.line("."), vim.fn.line("v") }
    end, { desc = "Stage hunk (visual)" })

    vim.keymap.set("n", "<leader>hS", function()
      require("gitsigns").stage_buffer()
    end, { desc = "Stage entire file" })

    vim.keymap.set("n", "<leader>hu", function()
      require("gitsigns").reset_hunk()
    end, { desc = "Undo stage hunk" })

    vim.keymap.set("n", "<leader>hU", function()
      require("gitsigns").reset_buffer()
    end, { desc = "Reset buffer" })

    vim.keymap.set("n", "<leader>hp", function()
      require("gitsigns").preview_hunk()
    end, { desc = "Preview hunk" })

    vim.keymap.set("n", "<leader>hb", function()
      require("gitsigns").blame_line()
    end, { desc = "Blame line" })
  end,
}
