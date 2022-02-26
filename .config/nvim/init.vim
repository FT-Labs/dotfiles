lua require ("init")

filetype plugin on
syntax on


if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' |
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" Functions

function DateAuthor()
	let var1=strftime('%c')
	:call setline(1,"/*")
	:call setline(2,"Author: PhysTech")
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

function CppUsual1()
	:call DateAuthor()
	:5r ~/.config/nvim/templates/usual-1.cpp
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
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction

"Python configs
function! s:insert_py()
	execute "normal! i#!/usr/bin/env python"
	execute "normal! o"
	execute "normal! o"
	"execute "normal! o"
	"execute "normal! o"
	"execute "normal! oif __name__ == \"__main__\":"
endfunction

function! s:insert_sh()
	execute "normal! i#!/bin/bash"
	normal! kk
endfunction

"Java configs
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd Filetype java set makeprg=javac\ -d\ %:~:h:s?src?bin?\ %
autocmd BufNewFile *.java exe "normal opublic class " . expand('%:t:r') . "\n{\n}\<Esc>1Go\<CR>\<CR>\<Esc>1G"
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()
autocmd BufNewFile *.{py} call <SID>insert_py()
autocmd BufNewFile *.{sh} call <SID>insert_sh()
"For auto shell change user permission
autocmd BufWritePost *.{sh} !chmod +x <afile>
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.cpp :%s/\s\+$//e
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e
"Lua set tabspace to 2
autocmd FileType lua setlocal tabstop=2 softtabstop=2 shiftwidth=2
