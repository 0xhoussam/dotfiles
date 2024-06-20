augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver20
augroup END

syntax on
set number
set relativenumber
filetype on
nnoremap <silent> <S-h> :tabprev<Cr>
nnoremap <silent> <S-l> :tabnext<Cr>

call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'arzg/vim-colors-xcode'

call plug#end()

colorscheme xcodedarkhc
