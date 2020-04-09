" Disable auto-comment-insertion (add "cr" to disable it completely)
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" XML filetype for ROS launch files
autocmd BufNewFile,BufRead *.launch set syntax=xml
