" Search for all TODO comments recursively
command! TODO Denite grep -mode=normal -auto-preview=true -default-action=switch -input=TODO


" Fugitive commit and show diff in commit buffer
command! -nargs=* Gc :exec "Gcommit --verbose " . <q-args> | exec "resize " . string(winheight(winnr("$"))*4/5) | startinsert

" Fugitive status with 50% height
command! -nargs=* Gs :Gstatus | exec "resize " . string(winheight(winnr("$"))*1/2)

" Reset git index
command! Greset !git reset

" Open Time Lapse
command! Ghist :call OpenTimeLapse()

" Fugitive commit and show diff in commit buffer
command! -nargs=* Gchanges :exec "Git! diff " . <q-args>


" Save file as root
command! W :w !sudo tee %<CR>

" Go to root directory of current git repository
command! Gitroot :call GoToGitRoot()
