" Add onedark customization of git-gutter signs
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
	let s:diff_green = { "gui": "#009900", "cterm": "2", "cterm16" : "" }
	let s:diff_orange = { "gui": "#bbbb00", "cterm": "3", "cterm16" : "" }
	let s:diff_red = { "gui": "#ff2222", "cterm": "1", "cterm16" : "" }

	autocmd ColorScheme * call onedark#set_highlight("GitGutterAdd", { "fg": s:diff_green })
	autocmd ColorScheme * call onedark#set_highlight("GitGutterChange", { "fg": s:diff_orange })
	autocmd ColorScheme * call onedark#set_highlight("GitGutterDelete", { "fg": s:diff_red })
  augroup END
endif

" Set theme
colorscheme onedark

" Set visual selection color
autocmd ColorScheme * highlight Visual ctermbg=240
