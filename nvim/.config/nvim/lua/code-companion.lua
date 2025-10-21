local progress = require("fidget.progress")
local handles = {}
local group = vim.api.nvim_create_augroup("CodeCompanionFidget", {})

vim.api.nvim_create_autocmd("User", {
	pattern = "CodeCompanionRequestStarted",
	group = group,
	callback = function(e)
		handles[e.data.id] = progress.handle.create({
			title = "CodeCompanion",
			message = "Thinking...",
			lsp_client = { name = e.data.adapter.formatted_name },
		})
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "CodeCompanionRequestFinished",
	group = group,
	callback = function(e)
		local h = handles[e.data.id]
		if h then
			h.message = e.data.status == "success" and "Done" or "Failed"
			h:finish()
			handles[e.data.id] = nil
		end
	end,
})

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
