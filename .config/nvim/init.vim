filetype plugin on

lua require ("init")

" Functions
function DateAuthor()
	let var1=strftime('%c')
	:call setline(1,"/*")
	:call setline(2,"Author: PhyTech")
	:call setline(3,var1)
	:call setline(4,"*/")
	:call setline(5,"")
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
	execute "normal! i#!/bin/bash"
	normal! o
	normal! o
endfunction

