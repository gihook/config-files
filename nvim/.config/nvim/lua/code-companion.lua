require("codecompanion").setup({
	strategies = {
		chat = {
			adapter = "gemini",
		},
		inline = {
			adapter = "gemini",
		},
		cmd = {
			adapter = "gemini",
		},
	},
	opts = {
		log_level = "DEBUG",
	},
	-- Configuration for Code Completion
	completion = {
		enabled = true,
	},
	adapters = {
		http = {
			gemini = function()
				return require("codecompanion.adapters").extend("gemini", {
					model = "gemini-2.5-pro",
				})
			end,
		},
	},
})
