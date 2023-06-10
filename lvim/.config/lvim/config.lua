vim.opt.cmdheight = 2                         -- more space in the neovim command line for displaying messages
vim.opt.guifont = "IosevkaTerm Nerd Font:h20" -- the font used in graphical neovim applications
vim.opt.guifont = "VictorMono Nerd Font:h18"  -- the font used in graphical neovim applications
vim.opt.relativenumber = true                 -- relative line numbers

lvim.colorscheme = "oxocarbon"
-- vim.cmd('set termguicolors')
-- vim.opt.background = "dark" -- set this to dark or light
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
  {
    "nvim-neorg/neorg",
    ft = "norg",   -- lazy-load on filetype
    config = true, -- run require("neorg").setup()
  },
  { 'Mofiqul/vscode.nvim' },
  { 'Yazeed1s/minimal.nvim' },
  { 'andweeb/presence.nvim' },
  { 'isobit/vim-darcula-colors' },
  { "briones-gabriel/darcula-solid.nvim", dependencies = "rktjmp/lush.nvim" },
  {
    "tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { 'nyoom-engineering/oxocarbon.nvim' }
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
