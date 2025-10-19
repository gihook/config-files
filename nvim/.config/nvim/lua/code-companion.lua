require("codecompanion").setup({
	strategy = "gemini",
	opts = {
		log_level = "DEBUG",
	},
	-- Configuration for Code Completion
	completion = {
		enabled = true,
	},
	adapters = {
		gemini = function()
			return require("codecompanion.adapters").extend("gemini", {
				model = "gemini-2.5-flash",
				env = {
					api_key = "",
				},
			})
		end,
	},
})
