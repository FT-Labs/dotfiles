vim.cmd [[
	augroup ft_insert
		autocmd!
		autocmd BufNewFile *.java exe "normal opublic class " . expand('%:t:r') . "\n{\n}\<Esc>1Go\<CR>\<CR>\<Esc>1G"
		autocmd BufNewFile *.{h,hpp} call Insert_gates()
		autocmd BufNewFile *.{py} call Insert_py()
		autocmd BufNewFile *.{sh} call Insert_sh()
	augroup end
]]

vim.cmd [[
	augroup file_configs
		autocmd FileType * setlocal formatoptions-=c formatoptions-=o formatoptions-=r
		autocmd Filetype java set makeprg=javac\ -d\ %:~:h:s?src?bin?\ %
		autocmd FileType lua setlocal tabstop=2 softtabstop=2 shiftwidth=2
	augroup end
]]

vim.cmd [[
	augroup sh_auto_exe
		autocmd BufWritePost *.{sh} !chmod +x <afile>
	augroup end
]]
