" Search for all TODO comments recursively
command! TODO :w | Denite grep -mode=normal -auto-preview=true -default-action=switch -input=TODO


" Fugitive commit and show diff in commit buffer
command! -nargs=* Gc :exec "Gcommit --verbose " . <q-args> | exec "resize " . string(winheight(winnr("$"))*4/5) | startinsert

" Fugitive status with 50% height
command! -nargs=* Gs :Gstatus | exec "resize " . string(winheight(winnr("$"))*1/2)

" Reset git index
command! Greset silent exec "!git reset"

" Open Time Lapse
command! Ghist :call OpenTimeLapse()


" Save file as root
command! W :w !sudo tee %<CR>
