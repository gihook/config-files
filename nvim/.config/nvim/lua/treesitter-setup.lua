local treesitter_config = require("nvim-treesitter.configs")

treesitter_config.setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})


