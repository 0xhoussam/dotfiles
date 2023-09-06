require("pride.plugins")
require("pride.base")


-- augroup RestoreCursorShapeOnExit
--     autocmd!
--     autocmd VimLeave * set guicursor=a:ver20
-- augroup END
vim.cmd([[
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver20
augroup END
]])
