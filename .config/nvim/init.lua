-- 1. Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- 2. Global Options (Must be set before loading plugins)
vim.g.mapleader = " "

-- 3. Load Plugins
require("lazy").setup("plugins")

-- 4. UI & Editor Settings
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr-o:hor20"
vim.api.nvim_set_hl(0, "Cursor", { fg = "red", bg = "none" })
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.autoindent = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- 5. GitSigns Colors (Pink/Purple theme)
vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#FF69B4" })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#800080" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#FF0000" })

-- 6. Keybindings
local map = vim.keymap.set

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })

-- Buffer Navigation
map("n", "]b", ":bnext<CR>", { desc = "Next buffer" })
map("n", "[b", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
map("n", "<leader>bl", ":b#<CR>", { desc = "Last buffer" })

-- Utils
map("n", "<leader>pl", "<cmd>Lazy<CR>", { desc = "Open Lazy" })
