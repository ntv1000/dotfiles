" Search for all TODO comments recursively
command! TODO :w | Denite grep -mode=normal -auto-preview=true -default-action=switch -input=TODO


" Fugitive commit and show diff in commit buffer
command! -nargs=* Gc :exec "Gcommit --verbose " . <q-args> | resize 40

" Reset git index
command! Greset silent exec "!git reset"

" Open Time Lapse
command! Ghist :call OpenTimeLapse()
