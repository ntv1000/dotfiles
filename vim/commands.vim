" Search for all TODO comments recursively
command! TODO :w | Denite grep -mode=normal -auto-preview=true -default-action=switch -input=TODO


" Fugitive commit and show diff in commit buffer
command! -nargs=* Gc :Gcommit --verbose <args>

" Add current file to git index
command! Gadd silent exec "!git add %"

" Remove current file from git index
command! Greset silent exec "!git reset"

" Open Time Lapse
command! Ghist :call OpenTimeLapse()
