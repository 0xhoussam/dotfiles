local plugins = {
	{
		dir = "~/projects/fleet",
		dev = true,
		lazy = false,
		priority = 1000,
	},
	"HiPhish/rainbow-delimiters.nvim",
	"nvim-tree/nvim-web-devicons",
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("pride.config.treesitter")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("pride.config.lualine")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("pride.config.nvim-tree-lua")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("pride.config.auto-pairs")
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("pride.config.mason")
		end,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("pride.config.telescope")
		end,
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	{
		"akinsho/bufferline.nvim",
		event = "BufRead",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("pride.config.bufferline")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},
		config = function()
			require("pride.config.nvim-cmp")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			require("pride.config.lspconfig")
		end,
	},
	{
		"gelguy/wilder.nvim",
		event = "CmdlineEnter",
		config = function()
			require("pride.config.wilder")
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("pride.config.todo-comments")
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("pride.config.conform")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("pride.config.lint")
		end,
	},
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("pride.config.project")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"utilyre/barbecue.nvim",
		event = "LspAttach",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		config = function()
			require("barbecue").setup()
		end,
	},
	{
		"famiu/bufdelete.nvim",
		config = function()
			require("bufdelete")
		end,
	},
	-- {
	-- 	"MeanderingProgrammer/dashboard.nvim",
	-- 	event = "VimEnter",
	-- 	dependencies = {
	-- 		{ "MaximilianLloyd/ascii.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
	-- 	},
	-- 	config = function()
	-- 		require("pride.config.dashboard")
	-- 	end,
	-- },
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		config = function()
			require("bqf")
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify")
		end,
	},
	{
		"wakatime/vim-wakatime",
	},
	{
		"chentoast/marks.nvim",
		event = "BufRead",
		config = function()
			require("marks").setup()
		end,
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("pride.config.dashboard")
		end,
		dependencies = { "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons", "MaximilianLloyd/ascii.nvim" },
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-treesitter/playground",
		config = function()
			require("nvim-treesitter.configs").setup({
				playground = {
					enable = true,
					disable = {},
					updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
					persist_queries = false, -- Whether the query persists across vim sessions
					keybindings = {
						toggle_query_editor = "o",
						toggle_hl_groups = "i",
						toggle_injected_languages = "t",
						toggle_anonymous_nodes = "a",
						toggle_language_display = "I",
						focus_language = "f",
						unfocus_language = "F",
						update = "R",
						goto_node = "<cr>",
						show_help = "?",
					},
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({ enabled = false })
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("pride.config.toggleterm")
		end,
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = false, -- Recommended
		-- ft = "markdown" -- If you decide to lazy-load anyway

		dependencies = {
			-- You will not need this if you installed the
			-- parsers manually
			-- Or if the parsers are in your $RUNTIMEPATH
			"nvim-treesitter/nvim-treesitter",

			"nvim-tree/nvim-web-devicons",
		},
	},
}

require("lazy").setup(plugins, {})
