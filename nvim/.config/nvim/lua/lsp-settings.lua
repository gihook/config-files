local util = require("lspconfig.util")
local saga = require("lspsaga")
saga.init_lsp_saga()

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
	local opts = {}

	if server.name == "sumneko_lua" then
		opts = {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "use" },
					},
					--workspace = {
					-- Make the server aware of Neovim runtime files
					--library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
					--}
				},
			},
		}
	end

	if server.name == "tsserver" then
		opts = {
			on_attach = function(client)
				client.server_capabilities.documentFormattingProvider = false
			end,
		}
	end

	if server.name == "angularls" then
		opts = {
			root_dir = util.root_pattern("project.json", "angular.json"),
		}
	end

	if server.name == "jsonls" then
		opts = {
			on_attach = function(client)
				client.server_capabilities.documentFormattingProvider = false
			end,
		}
	end

	if server.name == "omnisharp" then
		opts = {
			on_attach = function(client)
				client.server_capabilities.semanticTokensProvider = {
					full = vim.empty_dict(),
					legend = {
						tokenModifiers = { "static_symbol" },
						tokenTypes = {
							"comment",
							"excluded_code",
							"identifier",
							"keyword",
							"keyword_control",
							"number",
							"operator",
							"operator_overloaded",
							"preprocessor_keyword",
							"string",
							"whitespace",
							"text",
							"static_symbol",
							"preprocessor_text",
							"punctuation",
							"string_verbatim",
							"string_escape_character",
							"class_name",
							"delegate_name",
							"enum_name",
							"interface_name",
							"module_name",
							"struct_name",
							"type_parameter_name",
							"field_name",
							"enum_member_name",
							"constant_name",
							"local_name",
							"parameter_name",
							"method_name",
							"extension_method_name",
							"property_name",
							"event_name",
							"namespace_name",
							"label_name",
							"xml_doc_comment_attribute_name",
							"xml_doc_comment_attribute_quotes",
							"xml_doc_comment_attribute_value",
							"xml_doc_comment_cdata_section",
							"xml_doc_comment_comment",
							"xml_doc_comment_delimiter",
							"xml_doc_comment_entity_reference",
							"xml_doc_comment_name",
							"xml_doc_comment_processing_instruction",
							"xml_doc_comment_text",
							"xml_literal_attribute_name",
							"xml_literal_attribute_quotes",
							"xml_literal_attribute_value",
							"xml_literal_cdata_section",
							"xml_literal_comment",
							"xml_literal_delimiter",
							"xml_literal_embedded_expression",
							"xml_literal_entity_reference",
							"xml_literal_name",
							"xml_literal_processing_instruction",
							"xml_literal_text",
							"regex_comment",
							"regex_character_class",
							"regex_anchor",
							"regex_quantifier",
							"regex_grouping",
							"regex_alternation",
							"regex_text",
							"regex_self_escaped_character",
							"regex_other_escape",
						},
					},
					range = true,
				}
			end,
		}
	end

	server:setup(opts)
end)

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
require("lspconfig")["lua_ls"].setup({
	capabilities = capabilities,
})

-- null-ls setup

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.csharpier,
		require("null-ls").builtins.diagnostics.eslint,
		require("null-ls").builtins.formatting.prettierd.with({
			filetypes = { "html", "json", "yaml", "markdown", "typescript", "javascript" },
		}),
	},
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
