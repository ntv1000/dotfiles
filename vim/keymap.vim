" Open denite for file recursive search
nnoremap <leader>f :w<CR>:Denite file/rec -smartcase -immediately-1<CR>
" Open denite for grepping
nnoremap <leader>g :w<CR>:Denite grep -no-empty -mode=normal -smartcase -immediately-1<CR>
" Open denite for grepping for the word under cursor
nnoremap <M-*> :w<CR>:DeniteCursorWord grep -no-empty -mode=normal -smartcase -immediately-1<CR>
" Open denite for searching for tag under cursor
nnoremap <leader>t :w<CR>:DeniteCursorWord tag -no-empty -mode=normal -smartcase -immediately-1<CR>


" Comment line
noremap <leader>d <plug>NERDCommenterComment
" Uncomment line
noremap <leader>D <plug>NERDCommenterUncomment


" Go to next buffer
nnoremap <C-j> :bnext<CR>
" Go to next buffer
nnoremap <C-k> :bprev<CR>
" Switch to last buffer
nnoremap # :e #<CR>
" Close currently active buffer
nnoremap <Backspace> :call CloseBuffer()<CR>

" Close currently active tab
nnoremap <M-Backspace> :tabclose<CR>
" Close currently active window
nnoremap <Esc> :call CloseIfNotLastWindow()<CR>

" Activate window on the left
nnoremap <M-h> :wincmd h<CR>
" Activate window on the right
nnoremap <M-l> :wincmd l<CR>
" Activate window above
nnoremap <M-k> :wincmd k<CR>
" Activate window below
nnoremap <M-j> :wincmd j<CR>


" Save file
nnoremap <CR> :w<CR>
" Save file and quit
nnoremap <M-CR> :wq<CR>
" Save file and quit while typing
inoremap <M-CR> <Esc>:wq<CR>


" Escape the terminal
tnoremap <Esc> <C-\><C-n>


" Shoot a laser
nnoremap <Space> :silent exec "! aplay ~/dotfiles/laser.wav > /tmp/output 2>&1 &"<CR>


" Indent line
xnoremap <Tab> >
" Unindent line
xnoremap <S-Tab> <


" Disable search highlightings
nnoremap <C-M-O> :nohlsearch<CR>

" Don't yank when deleting a character
nnoremap x "_x

" Jump to marks without the shift key
nnoremap ´ `


" Run Make
nnoremap <leader>m :make<CR>
" Open terminal and execute cargo run
nnoremap <leader>x :call OpenSplitTerm("cargo run")<CR>


" Start tab-completion and next item on the completion list
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
" Previous item on the completion list
inoremap <S-Tab> <C-P>


" Toggle tagbar
nnoremap <F8> :call ToggleTagbar()<CR>

" Toggle buffergator
nnoremap <leader>b :BuffergatorToggle<CR>


" Reload all buffers
nnoremap <F5> :call ReloadBuffers()<CR>

" Reload vim config
nnoremap <leader>r :source $MYVIMRC<CR>
