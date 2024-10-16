" remap leader key to space
nnoremap <Space> <Nop>
let mapleader = " "

" main plugin repository file
lua require('plugins')

" external plugin configuration files, under lua/
lua require('imports')

" include settings
source ~/.config/nvim/vim/settings.vim

" include key remaps
source ~/.config/nvim/vim/keymaps.vim

" external vimscript configuration files
source ~/.config/nvim/vim/markdown_preview.vim

" load colorscheme
colorscheme everforest
