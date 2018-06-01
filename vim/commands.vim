command! TODO :w | Denite grep -mode=normal -auto-preview=true -default-action=switch -input=TODO

command! -nargs=* Gc :Gcommit --verbose <args>
command! Gadd silent exec "!git add %"
command! Greset silent exec "!git reset"

command! Ghist :call OpenTimeLapse()
