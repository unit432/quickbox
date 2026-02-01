-- 1. Bootstrap lazy.nvim (auto-install if missing)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Set leader key
vim.g.mapleader = " "

-- 3. Load Plugins
require("lazy").setup("plugins")

-- Enable Cursor Blink and set cursor style
vim.o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr-o:hor20"

-- Customize cursor color to black (you can adjust this to any color you prefer)
vim.api.nvim_set_hl(0, "Cursor", { fg = "red", bg = "none" })

-- Other Config
-- vim.o.mouse = ""

vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Show line numbers
vim.o.number = true

-- Enable True Color
vim.o.termguicolors = true

-- Set file encoding to UTF-8
vim.o.encoding = 'utf-8'

-- Configure backspace behavior
vim.o.backspace = 'indent,eol,start'

-- Enable auto-indentation
vim.o.autoindent = true

-- Set number of spaces for indentation
vim.o.shiftwidth = 2

-- Set number of spaces for a tab
vim.o.softtabstop = 2

-- Use spaces instead of tabs
vim.o.expandtab = true

-- Set space as the leader key
vim.g.mapleader = " "

-- Keybindings
-- Telescope keybindings
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })  -- File search
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })   -- Text search
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" }) -- Open buffers
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Find help" })  -- Help tags
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<CR>", { desc = "Find recent files" }) -- A list of recent files

-- Go to the next buffer
vim.keymap.set("n", "]b", ":bnext<CR>", { desc = "Next buffer" })

-- Go to the previous buffer
vim.keymap.set("n", "[b", ":bprevious<CR>", { desc = "Previous buffer" })

-- Close the current buffer
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Reopen the last buffer
vim.keymap.set("n", "<leader>bl", ":b#<CR>", { desc = "Last buffer" })

-- Open Lazy
vim.keymap.set("n", "<leader>pl", ":Lazy<CR>", { desc = "Open Lazy.nvim" })

-- git gitsigns
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#FF69B4" })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#800080" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#FF0000" })

-- Copilot keybindings
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
