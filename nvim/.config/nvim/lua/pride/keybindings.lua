local map = vim.keymap

-- tab navigation
map.set("n", "<C-h>", "<cmd>tabprev<Cr>", {}) -- Open a horizontal split.
map.set("n", "<C-l>", "<cmd>tabnext<Cr>", {}) -- Open a horizontal split.

-- neovim full screen
if vim.g.neovide == true then
  vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end

