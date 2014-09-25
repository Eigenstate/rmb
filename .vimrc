" ~/.vimrc (configuration file for vim only)
" skeletons
function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_US
	if $USER != ''
	    let login = $USER
	elseif $LOGNAME != ''
	    let login = $LOGNAME
	else
	    let login = 'unknown'
	endif
	let newline = stridx(login, "\n")
	if newline != -1
	    let login = strpart(login, 0, newline)
	endif
	if $HOSTNAME != ''
	    let hostname = $HOSTNAME
	else
	    let hostname = system('hostname -f')
	    if v:shell_error
		let hostname = 'localhost'
	    endif
	endif
	let newline = stridx(hostname, "\n")
	if newline != -1
	    let hostname = strpart(hostname, 0, newline)
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
	setf spec
endfunction
autocmd BufNewFile	*.spec	call SKEL_spec()

" filetypes
filetype plugin on
filetype indent on

" Jump to last position on opening file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Get nice indentations
set ts=2
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Word wrap without line breaks
set wrap
set linebreak
set nolist
"set textwidth=79
set formatoptions+=l
set wrapmargin=0

" Highlight search pattern matches
set hlsearch

" Fortran indentation
let fortran_do_enddo=1
let fortran_more_precise=1

" Make install 
map M :w <Enter> :!make install <Enter>

" Colors
syntax on
set term=xterm-256color
set t_Co=256
" set background=dark

" Convert GUI colors
" if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
" \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))

" Use the guicolorscheme plugin to makes 256-color or 88-color
" terminal use GUI colors rather than cterm colors.

"  runtime! plugin/guicolorscheme.vim
  "GuiColorScheme busybee
  colorscheme busybee
"endif

" ~/.vimrc ends here
