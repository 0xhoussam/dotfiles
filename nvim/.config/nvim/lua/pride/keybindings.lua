local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- neovim full screen
if vim.g.neovide == true then
  vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end

-- Jumping Between Buffers
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-h>', '<C-w>h', opts)

-- BufferLine
-- Move to previous/next
map('n', '<S-h>', '<Cmd>BufferLineCyclePrev<CR>', opts)
map('n', '<S-l>', '<Cmd>BufferLineCycleNext<CR>', opts)

-- Close Buffer
map('n', '<leader>c', '<Cmd>:bdelete<CR>', opts)

-- NvimTreeLua
map('n', '<leader>e', '<Cmd>NvimTreeToggle<CR>', opts)

-- Telescope
map('n', '<leader>f', '<Cmd>Telescope find_files<CR>', opts)
map('n', '<leader>g', '<Cmd>Telescope grep_string<CR>', opts)
map('n', '<leader>b', '<Cmd>Telescope buffers<CR>', opts)
