" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

lua require("basic")
lua require("keybindings")
lua require("plugins")
