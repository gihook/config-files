return {
	-- essentials
	{ "tpope/vim-surround" },
	{ "tpope/vim-commentary" },
	{ "easymotion/vim-easymotion" },
	{ "tpope/vim-fugitive" },
	{ "Raimondi/delimitMate" },
	{ "tpope/vim-unimpaired" },
	{ "mattn/emmet-vim" },
	{ "SirVer/ultisnips" },
	{ "honza/vim-snippets" },

	-- file explorer
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional
	},

	-- plantuml
	{ "aklt/plantuml-syntax" },
	{ "weirongxu/plantuml-previewer.vim" },
	{ "tyru/open-browser.vim" },

	-- colorscheme
	{ "morhetz/gruvbox" },

	-- LSP
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},

	{
		"mason-org/mason.nvim",
		opts = {},
	},

	{
		"nvimdev/lspsaga.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("lspsaga").setup({})
		end,
	},

	{ "nvim-neotest/nvim-nio" },

	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },

	{ "nvim-lua/plenary.nvim" },

	-- status line
	{ "nvim-lualine/lualine.nvim" },
	{ "kyazdani42/nvim-web-devicons" },

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},

	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	},
	{
		"olimorris/codecompanion.nvim",
		opts = {},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		opts = {
			preview = {
				filetypes = { "markdown", "codecompanion" },
				ignore_buftypes = {},
			},
		},
	},
	{
		"echasnovski/mini.diff",
		config = function()
			local diff = require("mini.diff")
			diff.setup({
				-- Disabled by default
				source = diff.gen_source.none(),
			})
		end,
	},
	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},
}
