-- Setup nvim-cmp.
local cmp = require("cmp")

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "ultisnips" },
		{ name = "buffer" },
		-- { name = "luasnip" }, -- For luasnip users.
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

cmp.setup.filetype("codecompanion", {
	sources = cmp.config.sources({
		{ name = "codecompanion" }, -- You can specify the `cmp_git` source if you were installed it.
	}),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
vim.lsp.config("lua_ls", {
	capabilities = capabilities,
})

vim.lsp.config("intelephense", {
	settings = {
		intelephense = {
			files = {
				maxSize = 5000000, -- Adjust as needed
			},
		},
	},
})

vim.lsp.config("ts_ls", {
	capabilities = capabilities,
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
	end,
})

-- vim.lsp.config("angularls", {
-- 	root_dir = util.root_pattern("angular.json", "project.json"),
-- })

vim.lsp.config("jsonls", {
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
	end,
})

local path_to_elixirls = vim.fn.expand("~/.local/share/nvim/mason/packages/elixir-ls/language_server.sh")

vim.lsp.config("elixirls", {
	cmd = { path_to_elixirls },
})

vim.lsp.config("elixirls", {
	filetypes = { "elixir", "eelixir", "heex", "surface" },
	-- root_dir = function(bufnr, on_dir)
	--   local fname = vim.api.nvim_buf_get_name(bufnr)
	--   local matches = vim.fs.find({ 'mix.exs' }, { upward = true, limit = 2, path = fname })
	--   local child_or_root_path, maybe_umbrella_path = unpack(matches)
	--   local root_dir = vim.fs.dirname(maybe_umbrella_path or child_or_root_path)

	--   on_dir(root_dir)
	-- end,
})

vim.lsp.config("omnisharp", {
	cmd = {
		vim.fn.executable("OmniSharp") == 1 and "OmniSharp" or "omnisharp",
		"-z", -- https://github.com/OmniSharp/omnisharp-vscode/pull/4300
		"--hostPID",
		tostring(vim.fn.getpid()),
		"DotNet:enablePackageRestore=false",
		"--encoding",
		"utf-8",
		"--languageserver",
	},
	filetypes = { "cs", "vb" },
	root_markers = { ".sln", ".csproj", "omnisharp.json", "function.json" },
	init_options = {},
	capabilities = {
		workspace = {
			workspaceFolders = false, -- https://github.com/OmniSharp/omnisharp-roslyn/issues/909
		},
	},
	settings = {
		FormattingOptions = {
			-- Enables support for reading code style, naming convention and analyzer
			-- settings from .editorconfig.
			EnableEditorConfigSupport = true,
			-- Specifies whether 'using' directives should be grouped and sorted during
			-- document formatting.
			OrganizeImports = true,
		},
		MsBuild = {
			-- If true, MSBuild project system will only load projects for files that
			-- were opened in the editor. This setting is useful for big C# codebases
			-- and allows for faster initialization of code navigation features only
			-- for projects that are relevant to code that is being edited. With this
			-- setting enabled OmniSharp may load fewer projects and may thus display
			-- incomplete reference lists for symbols.
			LoadProjectsOnDemand = nil,
		},
		RoslynExtensionsOptions = {
			-- Enables support for roslyn analyzers, code fixes and rulesets.
			EnableAnalyzersSupport = nil,
			-- Enables support for showing unimported types and unimported extension
			-- methods in completion lists. When committed, the appropriate using
			-- directive will be added at the top of the current file. This option can
			-- have a negative impact on initial completion responsiveness,
			-- particularly for the first few completion sessions after opening a
			-- solution.
			EnableImportCompletion = nil,
			-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
			-- true
			AnalyzeOpenDocumentsOnly = nil,
			-- Enables the possibility to see the code in external nuget dependencies
			EnableDecompilationSupport = nil,
		},
		RenameOptions = {
			RenameInComments = nil,
			RenameOverloads = nil,
			RenameInStrings = nil,
		},
		Sdk = {
			-- Specifies whether to include preview versions of the .NET SDK when
			-- determining which version to use for project loading.
			IncludePrereleases = true,
		},
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
		markdown = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		cs = { "csharpier" },
		go = { "gofmt" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
