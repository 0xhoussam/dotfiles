-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
local plugins = {
	{
		"~/projects/fleet",
		dev = true,
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
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("pride.config.bufferline")
		end,
	},
	{
		"/hrsh7th/nvim-cmp",
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
		config = function()
			require("pride.config.wilder")
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
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
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"LunarVim/breadcrumbs.nvim",
		dependencies = {
			"SmiteshP/nvim-navic",
		},
		config = function()
			require("pride.config.breadcrumbs")
		end,
	},
	{
		"famiu/bufdelete.nvim",
		config = function()
			require("bufdelete")
		end,
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup()
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
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
		"sainnhe/sonokai",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.sonokai_enable_italic = true
			vim.g.sonokai_style = "andromeda"
			vim.g.sonokai_better_performance = 1
		end,
	},
	{
		"wakatime/vim-wakatime",
	},
}

require("lazy").setup(plugins, {})
