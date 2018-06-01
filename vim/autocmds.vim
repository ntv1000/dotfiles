autocmd vimenter * BuffergatorOpen " automatically open buffergator on startup
autocmd vimenter * if (BuffergatorIsActive()) | wincmd p | endif " unfocus buffergator window if it is focused at startup
autocmd bufenter * if (winnr("$") == 1 && BuffergatorIsOpen()) | q | endif " automatically close buffergator if it is the last remaining window
" disable auto-comment-insertion (add "cr" to disable it completely)
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
