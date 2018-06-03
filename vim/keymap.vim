" Open denite for file recursive search
nnoremap <leader>f :Denite file/rec -smartcase -immediately-1<CR>
" Open denite for grepping
nnoremap <leader>g :Denite grep -no-empty -mode=normal -smartcase -immediately-1<CR>
" Open denite for grepping for the word under cursor
nnoremap <M-*> :DeniteCursorWord grep -no-empty -mode=normal -smartcase -immediately-1<CR>
" Open denite for searching for tag under cursor
nnoremap <leader>t :DeniteCursorWord tag -no-empty -mode=normal -smartcase -immediately-1<CR>
" Open denite for switching buffer
nnoremap <Tab> :Denite buffer -no-empty -mode=normal -smartcase -immediately-1<CR>
" Open denite for searching help files
nnoremap <F1> :Denite help -no-empty -mode=insert -smartcase<CR>
" Open denite for searching jumps
nnoremap <leader>j :Denite jump -no-empty -mode=normal -auto-highlight -smartcase<CR>


" Comment line
nmap <leader>d <plug>NERDCommenterComment
xmap <leader>d <plug>NERDCommenterComment

" Uncomment line
nmap <leader>D <plug>NERDCommenterUncomment
xmap <leader>D <plug>NERDCommenterUncomment


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
nnoremap <Esc> :call MagicWindowClose()<CR>

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


" Easymotion prefix
map <Space> <Plug>(easymotion-prefix)


" Indent line
xnoremap <Tab> >
" Unindent line
xnoremap <S-Tab> <


" Insert blank line
nnoremap <C-O> o<Esc>

" Disable search highlightings
nnoremap <C-M-O> :nohlsearch<CR>

" Don't yank when deleting a character
nnoremap x "_x

" Paste system clipboard
nnoremap <leader>p o<Esc>"+p
xnoremap <leader>p "+p
" Yank into system clipboard
nnoremap <leader>y "+y
xnoremap <leader>y "+y


" Jump to marks without the shift key
nnoremap ´ `

" Don't jump to first result when using '*', but don't clutter the jump list
nnoremap <silent> * :keepjumps normal! mp*`p<CR>:delmarks p<CR>


" Run Make
nnoremap <leader>m :make<CR>
" Open terminal and execute cargo run
nnoremap <leader>x :call OpenSplitTerm("cargo run")<CR>


" Start tab-completion and next item on the completion list
inoremap <Tab> <C-R>=TabOrComplete()<CR>
" Previous item on the completion list
inoremap <S-Tab> <C-P>


" Toggle tagbar
nnoremap <F8> :call ToggleTagbar()<CR>

" Toggle buffergator
nnoremap <leader>b :BuffergatorToggle<CR>

" Toggle mundo
nnoremap <leader>u :MundoToggle<CR>

" Toggle English spellcheck
noremap <leader>s :setlocal spell! spelllang=en_us<CR>


" Reload all buffers
nnoremap <F5> :call ReloadBuffers()<CR>

" Reload vim config
nnoremap <leader>r :source $MYVIMRC<CR>
