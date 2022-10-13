vim.o.number = true
vim.o.relativenumber = true
vim.g.mapleader = " "
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.ignorecase = true
vim.o.cursorline = true

-- nvim-tree related
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- set colorscheme
vim.cmd([[colorscheme gruvbox]])

require("lualine").setup({
	options = { theme = "gruvbox" },
})
