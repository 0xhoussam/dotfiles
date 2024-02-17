vim.opt.cmdheight = 2         -- more space in the neovim command line for displaying messages
-- vim.opt.guifont = "FiraMono Nerd Font:h13" -- the font used in graphical neovim applications
vim.opt.relativenumber = true -- relative line numbers

lvim.colorscheme = "fleet"
-- lvim.colorscheme = "monokai-pro-spectrum"
vim.cmd('set termguicolors')
vim.opt.background = "dark" -- set this to dark or light
lvim.format_on_save.enabled = false

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- use treesitter folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

lvim.plugins = {
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({
        input = { enabled = false },
      })
    end,
  },
  { 'felipeagc/fleet-theme-nvim' },
  { 'wakatime/vim-wakatime',     lazy = false },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          html = rainbow_delimiters.strategy["local"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          -- lua = "rainbow-blocks",
        },
      }
    end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup()
    end
  },
  {
    "nyoom-engineering/oxocarbon.nvim"
  },
  -- {
  --   -- enabled = false,
  --   "shellRaining/hlchunk.nvim",
  --   event = { "UIEnter" },
  --   config = function()
  --     require("hlchunk").setup({
  --       line_num = {
  --         style = "#a390f0",
  --       },
  --       chunk = {
  --         chars = {
  --           horizontal_line = "─",
  --           vertical_line = "│",
  --           left_top = "┌",
  --           left_bottom = "└",
  --           right_arrow = "─",
  --         },
  --         style = "#a390f0",
  --         use_treesitter = true
  --       },

  --       blank = {
  --         enable = false
  --       },

  --       indent = {
  --         enable = false
  --       }
  --     })
  --   end
  -- },
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
if vim.g.neovide == true then
  vim.o.guifont = 'Liga SFMono Nerd Font:h13'
  -- vim.o.guifont = 'Ibm Plex Mono:h14'
  vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end

-- vim.api.nvim_set_option("clipboard", "unnamed")
vim.cmd('setlocal spell spelllang=en_us')

vim.cmd('set clipboard=unnamedplus');

lvim.builtin.indentlines.active = false;
