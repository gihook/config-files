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

	use("mhinz/vim-mix-format")

	-- file explorer
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- debugging
	use("puremourning/vimspector")

	use("aklt/plantuml-syntax")
	use("weirongxu/plantuml-previewer.vim")
	use("tyru/open-browser.vim")

	-- colorscheme
	use("morhetz/gruvbox")

	use({ "nvim-treesitter/nvim-treesitter" })

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		"williamboman/nvim-lsp-installer",
		"tami5/lspsaga.nvim",
	})

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")

	use("nvim-lua/plenary.nvim")
	use("jose-elias-alvarez/null-ls.nvim")

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
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("lervag/vimtex")
end)
