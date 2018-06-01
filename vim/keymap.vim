" Open denite for file recursive search
nmap <leader>f :w<CR>:Denite file/rec -smartcase -immediately-1<CR>
" Open denite for grepping
nmap <leader>g :w<CR>:Denite grep -no-empty -mode=normal -smartcase -immediately-1<CR>
" Open denite for grepping for the word under cursor
nmap <M-*> :w<CR>:DeniteCursorWord grep -no-empty -mode=normal -smartcase -immediately-1<CR>
" Open denite for searching for tag under cursor
nmap <leader>t :w<CR>:DeniteCursorWord tag -no-empty -mode=normal -smartcase -immediately-1<CR>


" Comment line
map <leader>d <plug>NERDCommenterComment
" Uncomment line
map <leader>D <plug>NERDCommenterUncomment


" Go to next buffer
nmap <C-j> :bnext<CR>
" Go to next buffer
nmap <C-k> :bprev<CR>
" Switch to last buffer
nmap # :e #<CR>
" Close currently active buffer
nmap <Backspace> :call CloseBuffer()<CR>

" Close currently active tab
nmap <M-Backspace> :tabclose<CR>
" Close currently active window
nmap <Esc> :call CloseIfNotLastWindow()<CR>

" Activate window on the left
nmap <M-h> :wincmd h<CR>
" Activate window on the right
nmap <M-l> :wincmd l<CR>
" Activate window above
nmap <M-k> :wincmd k<CR>
" Activate window below
nmap <M-j> :wincmd j<CR>


" Save file
nmap <CR> :w<CR>
" Save file and quit
nmap <M-CR> :wq<CR>
" Save file and quit while typing
imap <M-CR> <Esc>:wq<CR>


" Escape the terminal
tnoremap <Esc> <C-\><C-n>


" Shoot a laser
nmap <Space> :silent exec "! aplay ~/dotfiles/laser.wav > /tmp/output 2>&1 &"<CR>


" Indent line
xnoremap <Tab> >
" Unindent line
xnoremap <S-Tab> <


" Disable search highlightings
nnoremap <C-M-O> :nohlsearch<CR>

" Don't yank when deleting a character
nnoremap x "_x

" Jump to marks without the shift key
nmap ´ `


" Run Make
nmap <leader>m :make<CR>
" Open terminal and execute cargo run
nmap <leader>x :call OpenSplitTerm("cargo run")<CR>


" Start tab-completion and next item on the completion list
imap <Tab> <C-R>=Tab_Or_Complete()<CR>
" Previous item on the completion list
imap <S-Tab> <C-P>


" Toggle tagbar
nmap <F8> :call ToggleTagbar()<CR>

" Toggle buffergator
nmap <leader>b :BuffergatorToggle<CR>


" Reload all buffers
nmap <F5> :call ReloadBuffers()<CR>

" Reload vim config
nmap <leader>r :source $MYVIMRC<CR>
