vim.cmd([[ let @r="\y:%s/\<C-r>\"//g\<Left>\<Left>" ]])
vim.cmd([[ let @h=":ProjectRoot \<CR> :w\<CR> :vsp | terminal  go run *.go \<CR>i" ]])
vim.cmd([[ let @1=":call CppComp() \<CR>G:66\<CR>" ]])
vim.cmd([[ let @c=":cd %:h \<CR>" ]])

-- All previous macros have been changed to autocmd, @g macro will run current file
vim.cmd [[
	augroup run_file
		autocmd BufEnter *.java let @g=":w\<CR>:vsp | terminal java %\<CR>i"
		autocmd BufEnter *.py let @g=":w\<CR>:vsp |terminal python %\<CR>i" 
		autocmd BufEnter *.asm let @g=":w\<CR> :!nasm -f elf64 -o out.o % && ld out.o -o a.out \<CR> | :vsp |terminal ./a.out\<CR>i" 
		autocmd BufEnter *.cpp let @g=":w\<CR> :!g++ %\<CR> | :vsp |terminal ./a.out\<CR>i" 
		autocmd BufEnter *.c let @g=":w\<CR> :!gcc %\<CR> | :vsp |terminal ./a.out\<CR>i" 
		autocmd BufEnter *.go let @g=":w\<CR> :vsp | terminal go run % \<CR>i" 
		autocmd BufEnter *.js let @g=":w\<CR> :vsp | terminal node % \<CR>i" 
		autocmd BufEnter *.html let @g=":w\<CR> :silent !chromium % \<CR>"
	augroup end
]]
