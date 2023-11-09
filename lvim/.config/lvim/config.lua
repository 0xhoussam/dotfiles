vim.opt.cmdheight = 2         -- more space in the neovim command line for displaying messages
-- vim.opt.guifont = "FiraMono Nerd Font:h13" -- the font used in graphical neovim applications
vim.opt.relativenumber = true -- relative line numbers

lvim.colorscheme = "fleet"
vim.cmd('set termguicolors')
vim.opt.background = "dark" -- set this to dark or light
lvim.format_on_save.enabled = true

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- use treesitter folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

lvim.plugins = {
  { "lunarvim/colorschemes" },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({
        input = { enabled = false },
      })
    end,
  },
  { 'andweeb/presence.nvim' },
  { 'nyoom-engineering/oxocarbon.nvim' },
  { 'felipeagc/fleet-theme-nvim' },
  { 'gmr458/vscode_dark_modern.nvim' },
  { 'martinsione/darkplus.nvim' },
  { "ellisonleao/glow.nvim",               config = true,    cmd = "Glow" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl",     opts = {} },
  { "bluz71/vim-moonfly-colors",           name = "moonfly", lazy = false, priority = 1000 }
}

-- Neovide
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = true

-- revert the cursor
vim.cmd([[
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver20
augroup END
]])

-- neovide bug
vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('fuck', { clear = true }),
  pattern = "*.*",
  callback = function()
    vim.api.nvim_command("TSEnable highlight")
    vim.api.nvim_command("TSEnable illuminate")
  end,
})

if vim.g.neovide == true then
  vim.o.guifont = 'SF Mono:h13'
  vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end
