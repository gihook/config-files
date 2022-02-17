vim.o.number = true
vim.o.relativenumber = true
vim.g.mapleader = " "
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 4
vim.o.termguicolors = true

-- set colorscheme
vim.cmd([[colorscheme gruvbox]])

require("lualine").setup({
	options = { theme = "gruvbox" },
})
