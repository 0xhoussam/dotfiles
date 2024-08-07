-- Hyprlang LSP
vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "hyprlang",
	callback = function()
		vim.lsp.start({
			name = "hyprlang",
			cmd = { "hyprls" },
			root_dir = vim.fn.getcwd(),
		})
	end,
})

-- fish LSP
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "fish",
-- 	callback = function()
-- 		vim.lsp.start({
-- 			name = "fish",
-- 			cmd = { "fish-lsp", "start" },
-- 			root_dir = vim.fn.getcwd(),
-- 		})
-- 	end,
-- })
