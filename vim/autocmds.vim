" Automatically open buffergator on startup
autocmd vimenter * BuffergatorOpen

" Unfocus buffergator window if it is focused at startup
autocmd vimenter * if (BuffergatorIsActive()) | wincmd p | endif

" Automatically close buffergator if it is the last remaining window
autocmd bufenter * if (winnr("$") == 1 && BuffergatorIsOpen()) | q | endif


" Disable auto-comment-insertion (add "cr" to disable it completely)
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
