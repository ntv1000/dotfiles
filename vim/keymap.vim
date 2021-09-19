" Open denite for file recursive search, but search entire git repo if there is one
nnoremap <silent><leader>f :Denite file/rec:`finddir('.git', ';') != '' ? fnamemodify(finddir('.git', ';'), ':h') : ''` -start-filter -immediately-1<CR>
" Open denite for grepping
nnoremap <silent><leader>g :Denite grep:`finddir('.git', ';') != '' ? fnamemodify(finddir('.git', ';'), ':h') : ''` -no-empty -immediately-1<CR>
" Open denite for grepping for the word under cursor
nnoremap <silent><M-*> :DeniteCursorWord grep:`finddir('.git', ';') != '' ? fnamemodify(finddir('.git', ';'), ':h') : ''` -no-empty -immediately-1<CR>
" Open denite for searching for tag under cursor
nnoremap <silent><leader>t :DeniteCursorWord tag -no-empty -immediately-1<CR>
" Open denite for switching buffer
nnoremap <silent><Tab> :Denite buffer -no-empty -start-filter -immediately-1<CR>
" Open denite for searching help files
nnoremap <silent><F1> :Denite help -no-empty -start-filter<CR>
" Open denite for searching jumps
nnoremap <silent><leader>j :Denite jump -no-empty -auto-action=highlight<CR>
" Open denite for searching marks
nnoremap <leader>m :Denite mark -no-empty -auto-action=highlight<CR>
" Open denite for searching outline
nnoremap <leader>o :Denite outline -no-empty -auto-action=highlight<CR>
nnoremap <leader>O :Denite outline -no-empty -start-filter -auto-action=highlight<CR>


" Comment line
nmap <leader>c <plug>NERDCommenterComment
xmap <leader>c <plug>NERDCommenterComment

" Uncomment line
nmap <leader>C <plug>NERDCommenterUncomment
xmap <leader>C <plug>NERDCommenterUncomment


" Go to next buffer
nnoremap J :bnext<CR>
" Go to next buffer
nnoremap K :bprev<CR>
" Switch to last buffer
nnoremap # :e #<CR>
" Close currently active buffer
nnoremap <Backspace> :call CloseBuffer()<CR>

" Close currently active tab
nnoremap <M-Backspace> :TabClose<CR>
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
nnoremap <leader><Esc> :nohlsearch<CR>

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
nnoremap <leader>b :call OpenSplitTerm("make build")<CR>
" Open terminal and execute make
nnoremap <leader>x :call OpenSplitTerm("make run")<CR>


" Start tab-completion and next item on the completion list
inoremap <Tab> <C-R>=TabOrComplete()<CR>
" Previous item on the completion list
inoremap <S-Tab> <C-P>


" Toggle mundo
nnoremap <leader>u :MundoToggle<CR>


" Toggle English spellcheck
noremap <leader>l :setlocal spell! spelllang=en_us<CR>


" Reload all buffers
nnoremap <F5> :call ReloadBuffers()<CR>

" Reload vim config
nnoremap <leader>r :source $MYVIMRC<CR>


" Show diff of current file
nnoremap <leader>d :Gdiff<CR>

" Show diff preview of current hunk
nnoremap <leader>hh :GitGutterPreviewHunk<CR>


" Show startify page
nnoremap <leader>s :Startify<CR>


" ALE bindings
nnoremap <leader>ad :ALEGoToDefinition<CR>
nnoremap <leader>ah :ALEHover<CR>
nnoremap <leader>ar :ALEFindReferences<CR>
nnoremap <leader>ax :ALEReset<CR>
