vim.cmd [[
	augroup ft_insert
		autocmd!
		autocmd BufNewFile *.java exe "normal opublic class " . expand('%:t:r') . "\n{\n}\<Esc>1Go\<CR>\<CR>\<Esc>1G"
		autocmd BufNewFile *.{h,hpp} call Insert_gates()
		autocmd BufNewFile *.{py} call Insert_py()
		autocmd BufNewFile *.{sh} call Insert_sh()
    autocmd BufNewFile *.{glsl} call Insert_glsl()
	augroup end
]]

vim.cmd [[
	augroup file_configs
    autocmd!
		autocmd FileType * setlocal formatoptions-=c formatoptions-=o formatoptions-=r
		autocmd Filetype java set makeprg=javac\ -d\ %:~:h:s?src?bin?\ %
		autocmd FileType lua setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufEnter *.h set filetype=c
    autocmd FileType c setlocal tabstop=8 softtabstop=8 shiftwidth=8 tw=0 noet
	augroup end
]]

vim.cmd [[
	augroup sh_auto_exe
		autocmd BufWritePost *.{sh} !chmod +x <afile>
		autocmd BufWritePost * silent! !echo %:p >> /tmp/file-changes.txt
	augroup end
]]

vim.cmd [[
	augroup make_file
		autocmd BufWritePost Makefile,makefile AsyncRun -post=call\ GenerateFlags() -mode=term -pos=hide compiledb make
	augroup end
]]

-- Automatically delete trailing newlines on file write
vim.cmd [[
 	autocmd BufWritePre * let currPos = getpos(".")
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
 	autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
]]

-- Remember foldings
vim.cmd [[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview
  augroup end
]]
