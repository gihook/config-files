local packer = require("packer")

packer.startup(function()
	-- essentials
	use("tpope/vim-surround")
	use("tpope/vim-commentary")
	use("easymotion/vim-easymotion")
	use("tpope/vim-fugitive")
	use("Raimondi/delimitMate")
	use("tpope/vim-unimpaired")
	use("mattn/emmet-vim")
	use("SirVer/ultisnips")
	use("honza/vim-snippets")

	-- file explorer
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- plantuml
	use("aklt/plantuml-syntax")
	use("weirongxu/plantuml-previewer.vim")
	use("tyru/open-browser.vim")

	-- colorscheme
	use("morhetz/gruvbox")

	use({ "nvim-treesitter/nvim-treesitter" })

	use("williamboman/mason.nvim")

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
	})

	use({
		"nvimdev/lspsaga.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("lspsaga").setup({})
		end,
	})

	use({ "nvim-neotest/nvim-nio" })

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")

	use("nvim-lua/plenary.nvim")

	-- status line
	use("nvim-lualine/lualine.nvim")
	use("kyazdani42/nvim-web-devicons")

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})
end)
