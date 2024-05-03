local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp_window = require("cmp.config.window")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	window = {
		completion = cmp_window.bordered(),
		documentation = cmp_window.bordered(),
	},
	completion = {
		completopt = "menu.menuone,preview,noselect",
		winhighlight = "Normal:Pmenu",
	},
	snippet = {
		expand = function(arg)
			luasnip.lsp_expand(arg.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),
	view = {
		entries = { name = "custom", selection_order = "near_cursor" },
	},
	formatting = {
		format = lspkind.cmp_format(),
	},
})
