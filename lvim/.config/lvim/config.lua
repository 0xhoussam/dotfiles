vim.opt.cmdheight = 2                         -- more space in the neovim command line for displaying messages
vim.opt.guifont = "SFMono Nerd Font Mono:h13" -- the font used in graphical neovim applications
vim.opt.relativenumber = true                 -- relative line numbers

lvim.colorscheme = "oxocarbon"
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
  { 'nyoom-engineering/oxocarbon.nvim' },
  {
    'vermdeep/darcula_dark.nvim',
    lazy = false,
    priority = 1002,
    config = function(_, opts)
      -- enable colorscheme
      vim.cmd 'set termguicolors'
      vim.cmd([[colorscheme darcula_dark]])
    end
  },
  {
    'rktjmp/lush.nvim',
    lazy = false,
    priority = 1000,
    dependencies = {
      'vermdeep/darcula_dark.nvim'
    },
  },
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
