nmap <leader>f :w<CR>:Denite file/rec -smartcase -immediately-1<CR>
nmap <leader>g :w<CR>:Denite grep -no-empty -mode=normal -smartcase -immediately-1<CR>
nmap <M-*> :w<CR>:DeniteCursorWord grep -no-empty -mode=normal -smartcase -immediately-1<CR>
nmap <leader>t :w<CR>:DeniteCursorWord tag -no-empty -mode=normal -smartcase -immediately-1<CR>

"map <leader>cc <plug>NERDCommenterToggle
map <leader>d <plug>NERDCommenterComment
map <leader>D <plug>NERDCommenterUncomment

nmap <F8> :call ToggleTagbar()<CR>

nmap <leader>b :BuffergatorToggle<CR>

nmap <C-j> :bnext<CR>
nmap <C-k> :bprev<CR>
nmap # :e #<CR>
nmap <Space> :silent exec "! aplay ~/dotfiles/laser.wav > /tmp/output 2>&1 &"<CR>

xnoremap <Tab> >
xnoremap <S-Tab> <

nnoremap <C-M-O> :nohlsearch<CR>
imap <M-CR> <Esc>:wq<CR>
nnoremap x "_x

" for easier jump to mark
nmap ´ `
" for easier compilation
nmap <leader>m :make<CR>

nmap <leader>x :call OpenSplitTerm("cargo run")<CR>
tnoremap <Esc> <C-\><C-n>
imap <Tab> <C-R>=Tab_Or_Complete()<CR>
imap <S-Tab> <C-P>
" switch buffers easier
nmap <C-L> :bnext<CR>
nmap <C-H> :bprevious<CR>
nmap <Backspace> :call CloseBuffer()<CR>
nmap <M-Backspace> :tabclose<CR>
nmap <CR> :w<CR>
nmap <M-CR> :wq<CR>
nmap <Esc> :call CloseIfNotLastWindow()<CR>
nmap <M-h> :wincmd h<CR>
nmap <M-l> :wincmd l<CR>
nmap <M-k> :wincmd k<CR>
nmap <M-j> :wincmd j<CR>

nmap <F5> :call ReloadBuffers()<CR>
" shortcut to relead vimrc
nmap <leader>r :source $MYVIMRC<CR>
