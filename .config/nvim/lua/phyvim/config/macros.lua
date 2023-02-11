vim.cmd [[ let @r="\y:%s/\<C-r>\"//g\<Left>\<Left>" ]] -- replace all occurrences (replaced with treesitter)
--vim.cmd [[ command GoBuildTest execute "ProjectRoot \<CR> :w\<CR> :vsp | terminal  go run $(ls -1 *.go | grep -v _test.go) \<CR>i" ]] -- run a go project without building
vim.cmd [[ let @1=":call CppComp() \<CR>G:66\<CR>" ]] -- C++ competitive programming template
vim.cmd [[ let @c=":cd %:h \<CR>" ]] -- change dir to current file
vim.cmd [[ let @p=":ProjectRoot \<CR>:lua require('notify')('Project root setted.',0,{title='EXPLORER',0,timeout=300})\<cr>" ]] -- cd to root project
vim.cmd [[ let @m=":call MakeRun()\<CR>" ]] -- make and run
vim.cmd [[ let @t=":ProjectRoot \<CR>:! go test ./... -coverprofile=coverage.out && go tool cover -html=coverage.out\<cr>" ]]

-- All previous macros have been changed to autocmd, @g macro will run current file
vim.cmd [[
	augroup run_file
		autocmd BufEnter *.java let @g=":w\<CR>:vsp | terminal java %\<CR>i"
		autocmd BufEnter *.py let @g=":w\<CR>:vsp |terminal python %\<CR>i"
		autocmd BufEnter *.asm let @g=":w\<CR> :!nasm -f elf64 -o out.o % && ld out.o -o a.out \<CR> | :vsp |terminal ./a.out\<CR>i"
		autocmd BufEnter *.cpp let @g=":w\<CR> :!g++ -std=c++17 -O3 % -o %.out\<CR> | :vsp |terminal ./%.out\<CR>i"
		autocmd BufEnter *.c let @g=":w\<CR> :!gcc -O3 -std=gnu99 -Wno-deprecated-declarations -pedantic -Wall -Wextra % -o %.out\<CR> | :vsp |terminal ./%.out\<CR>i"
		autocmd BufEnter *.go let @g=":w\<CR> :vsp | terminal go run % \<CR>i"
		autocmd BufEnter *.js let @g=":w\<CR> :vsp | terminal node % \<CR>i"
		autocmd BufEnter *.html let @g=":w\<CR> :silent !chromium % \<CR>"
	augroup end
]]
