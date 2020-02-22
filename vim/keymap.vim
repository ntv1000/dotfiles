" Open denite for file recursive search, but search entire git repo if there is one
nnoremap <silent><leader>f :Denite file/rec:`finddir('.git', ';') != '' ? fnamemodify(finddir('.git', ';'), ':h') : ''` -start-filter -immediately-1<CR>
" Open denite for grepping
nnoremap <silent><leader>g :Denite grep:`finddir('.git', ';') != '' ? fnamemodify(finddir('.git', ';'), ':h') : ''` -no-empty -immediately-1<CR>
" Open denite for grepping for the word under cursor
nnoremap <silent><M-*> :DeniteCursorWord grep:`finddir('.git', ';') != '' ? fnamemodify(finddir('.git', ';'), ':h') : ''` -no-empty -immediately-1<CR>
" Open denite for searching for tag under cursor
nnoremap <silent><leader>t :DeniteCursorWord tag -no-empty -immediately-1<CR>
" Open denite for switching buffer
nnoremap <silent><Tab> :Denite buffer -no-empty -cursor-wrap -start-filter -immediately-1<CR>
" Open denite for searching help files
nnoremap <silent><F1> :Denite help -no-empty -start-filter<CR>
" Open denite for searching jumps
nnoremap <silent><leader>j :Denite jump -no-empty -auto-highlight<CR>


" Comment line
nmap <leader>d <plug>NERDCommenterComment
xmap <leader>d <plug>NERDCommenterComment

" Uncomment line
nmap <leader>D <plug>NERDCommenterUncomment
xmap <leader>D <plug>NERDCommenterUncomment


" Go to next buffer
nnoremap J :bnext<CR>
" Go to next buffer
nnoremap K :bprev<CR>
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


" Reindent file
nnoremap == m`gg=G``


" Easymotion prefix
map <Space> <Plug>(easymotion-prefix)


" Indent line
nnoremap > >>
xnoremap <Tab> >
" Unindent line
nnoremap < <<
xnoremap <S-Tab> <


" Add blank line below/above
nnoremap <silent> <C-j> m`o<Esc>``
nnoremap <silent> <C-k> m`O<Esc>``

" Remove line below/above
nnoremap <silent> <C-M-j> m`jdd``
nnoremap <silent> <C-M-k> m`kdd``

" Add space left/right
nnoremap <silent> <C-h> i<Space><Esc>l
nnoremap <silent> <C-l> li<Space><Esc>h

" Remove space left/right
map <silent> <C-M-h> hx
nmap <silent> <C-M-l> lxh


" Move lines down/up
nnoremap <M-j> :m +1<CR>
nnoremap <M-k> :m -2<CR>


" Resize current window
nnoremap <Up>    :resize +5<CR>
nnoremap <Down>  :resize -5<CR>
nnoremap <Right> :vertical resize +5<CR>
nnoremap <Left>  :vertical resize -5<CR>


" Join line below with current line
nnoremap <C-O> J


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


" Toggle semi-colon at the end of line
nnoremap ; :call ToggleEndChar(';')<CR>


" Increment/Decrement number under cursor
nmap <Leader>+ <C-a>
nmap <Leader>- <C-x>


" Jump to marks without the shift key
nnoremap ´ `

" Don't jump to first result when using '*', but don't clutter the jump list
nnoremap <silent> * :keepjumps normal! mp*`p<CR>:delmarks p<CR>


" Run Make
nnoremap <leader>m :make<CR>
" Open terminal and execute cargo run
nnoremap <leader>x :call OpenSplitTerm("make")<CR>


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
