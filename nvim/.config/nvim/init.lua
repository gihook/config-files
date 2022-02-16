require("plugins")
require("general-settings")
require("lsp-settings")
require("mappings")

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

require("orgmode").setup({
	org_agenda_files = { "~/Dropbox/org/*", "~/my-orgs/**/*" },
	org_default_notes_file = "~/Dropbox/org/refile.org",
})

require("colorizer").setup()
