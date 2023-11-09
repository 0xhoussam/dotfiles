require("pride.plugins")
require("pride.base")

require("ibl").setup()

vim.cmd([[
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver20
augroup END
]])
