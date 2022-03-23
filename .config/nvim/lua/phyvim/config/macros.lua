vim.cmd([[ let @r="\y:%s/\<C-r>\"//g\<Left>\<Left>" ]])
-- vim.cmd([[ let @j=":w\<CR>:vsp | terminal java %\<CR>i" ]])
-- vim.cmd([[ let @k=":call JavaRun()\<CR>i" ]])
-- vim.cmd([[ let @p=":w\<CR>:vsp |terminal python %\<CR>i" ]])
-- vim.cmd([[ let @a=":w\<CR> :!nasm -f elf64 -o out.o % && ld out.o -o a.out \<CR> | :vsp |terminal ./a.out\<CR>i" ]])
--vim.cmd([[ let @n=":w\<CR> :vsp | terminal node % \<CR>i" ]])
-- vim.cmd([[ let @c=":w\<CR> :!g++ %\<CR> | :vsp |terminal ./a.out\<CR>i" ]])
-- vim.cmd([[ let @g=":w\<CR> :vsp | terminal go run % \<CR>i" ]])
vim.cmd([[ let @h=":ProjectRoot \<CR> :w\<CR> :vsp | terminal  go run *.go \<CR>i" ]])
vim.cmd([[ let @1=":call CppComp() \<CR>G:66\<CR>" ]])

-- All previous macros have been changed to autocmd, @g macro will run current file
vim.cmd [[
	augroup run_file
		autocmd FileType java let @g=":w\<CR>:vsp | terminal java %\<CR>i"
		autocmd FileType python let @g=":w\<CR>:vsp |terminal python %\<CR>i" 
		autocmd FileType asm let @g=":w\<CR> :!nasm -f elf64 -o out.o % && ld out.o -o a.out \<CR> | :vsp |terminal ./a.out\<CR>i" 
		autocmd FileType cpp let @g=":w\<CR> :!g++ %\<CR> | :vsp |terminal ./a.out\<CR>i" 
		autocmd FileType c let @g=":w\<CR> :!gcc %\<CR> | :vsp |terminal ./a.out\<CR>i" 
		autocmd FileType go let @g=":w\<CR> :vsp | terminal go run % \<CR>i" 
		autocmd FileType javascript let @g=":w\<CR> :vsp | terminal node % \<CR>i" 
		autocmd FileType html let @g=":w\<CR> :silent !chromium % \<CR>"
	augroup end
]]
