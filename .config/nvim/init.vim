filetype plugin on

lua require ("init")

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Functions
function DateAuthor()
	let var1=strftime('%c')
	:call setline(1,"/*")
	:call setline(2,"Author: FTL")
	:call setline(3,var1)
	:call setline(4,"*/")
	:call setline(5,"")
endfunction

" Next fold
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

" Java project maker
function JavaRun()
	let l:name=split(getline(1))
	let l:tmp=get(name,1)
	let l:sze=strchars(tmp)
	let l:projName=strcharpart(tmp,0,sze-1)
	let l:fileName=expand('%:r')
	let l:binDir=expand('cd %:~:h:h:h:h:h/bin')
	let l:curDir = getcwd()
	execute (binDir) | execute ("terminal java ". projName. ".".fileName)
	execute ("cd " . curDir)
endfunction

function CppComp()
	:call DateAuthor()
	:4r ~/.config/nvim/templates/competitive-2.cpp
endfunction

function CppComp1()
	:call DateAuthor()
	:5r ~/.config/nvim/templates/competitive-1.cpp
endfunction

function JavaCompRead()
	exe "normal dG"
	let name = expand('%:r')
	let nm = "public class " . name
	:r~/.config/nvim/templates/Read.java
	:call setline(8,nm)
endfunction

"For C/C++ header files
function Insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction

function Insert_glsl()
    execute "normal! 7o"
    :call setline(1, "#version 330 core")
    :call setline(5, "void main() {")
    :call setline(7, "}")
endfunction

"Python configs
function Insert_py()
	execute "normal! i#!/usr/bin/env python"
	execute "normal! o"
	execute "normal! o"
	" Uncomment below if you need main
	"execute "normal! o"
	"execute "normal! o"
	"execute "normal! oif __name__ == \"__main__\":"
endfunction

function Insert_sh()
	execute "normal! i#!/usr/bin/env sh"
	normal! o
	normal! o
endfunction

function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

function GenerateFlags()
	:lua require("notify")("Compile flags generated",nil,{title="Clangd Flags",timeout=500})
	:LspRestart
	:NvimTreeRefresh
endfunction

" Makefile and run respect to $PROG
function MakeRun()
	:let var = system("grep PROG Makefile | awk '{print $3}'")
	:!make
	execute "normal! :vsp | terminal ./" . var
endfunction
