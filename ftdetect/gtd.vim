" Vim filetype plugin file
" Language:	GTD (pyGTD)
" Version:      1.0
" Maintainer:	Michael M. Tung <mtung@mat.upv.es>
" Last Change:  Mon Oct 30 17:36:50 CET 2006

" A fast syntax hack for pyGTD todo and context files by Keith Martin.
" Check the webpage http://96db.com/pyGTD/ for the program and documentation.
" This plugin file is still in development. Please send suggestions
" to the maintainer.

" make gtd filetype and todo.gtd define $PWD
augroup filetypedetect
  au! BufRead,BufNewFile *.gtd	set filetype=gtd
  au! BufEnter todo.gtd lcd %:p:h
augroup END

" define function to open gtd file
function! OpenGTDFile()
   let line = getline('.')
   let line = matchstr(line, "\[.*$") 
   let line = substitute(line, "gtd\]", "gtd", "") 
   let line = substitute(line, "\ *\[", "", "") 
   exec ":e ".line
endfunction

" bind open function to mouse event 
nmap <2-LeftMouse> :call OpenGTDFile()<CR>

