if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'tpope/vim-surround'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'
Plug 'OmniSharp/omnisharp-vim'
Plug 'uiiaoo/java-syntax.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'jreybert/vimagit'
Plug 'ap/vim-css-color'
Plug 'neoclide/coc.nvim',{'branch': 'master'}
Plug 'dense-analysis/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'navarasu/onedark.nvim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

set nohlsearch
set hidden
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set	scrolloff=8
set	sidescrolloff=8
set completeopt=menu,menuone
set conceallevel=0
set concealcursor=vin
set pumheight=20
set cursorline
set cursorlineopt=number

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
" Move text easy
	nnoremap <S-k> :m-2<CR>
	nnoremap <S-j> :m+<CR>
	inoremap <S-k> <Esc>:m-2<CR>
	inoremap <S-j> <Esc>:m+<CR>
	vnoremap <S-k> :m '<-2<CR>gv-gv
	vnoremap <S-j> :m '>+1<CR>gv-gv

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritepre * %s/\n\+\%$//e

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif


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

"Making vim compatible with st
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
if(has("termguicolors"))
	set termguicolors
endif

" SuperTab completion fall-back
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'
let g:clang_c_options = '-std=gnu11'
let g:clangd_cpp_options = '-std=c++17 -stdlib=libc++'


" SuperTab completion fall-back
let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
"let g:cpp_posix_standard = 1
"let g:cpp_concepts_highlight = 1


let mapleader=";"
"Key remappings
map <Leader>d :bd<CR>
map <Leader>s :TagbarOpenAutoClose<CR>
map <Leader>f :FzfPreviewProjectFiles<CR>
map <F1> :<cmd>CHADopen<cr><cr>
map <F2> :tabnew<CR>
noremap <F3> *``:set hls! hls?<CR>
map <F4> :! compwrite && clear && g++ %<CR> \| :vsp \|terminal ./a.out<inp.txt <CR>
map <F5> :tabnew<CR>
noremap <F6> :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<CR>
noremap <F7> :! make && sudo make PREFIX=/usr/local install
noremap <left> :tabp<CR>
noremap <right> :tabn<CR>
"Resizing preview windows
nnoremap <Tab>h :vertical resize -10 <CR>
nnoremap <Tab>l :vertical resize +10 <CR>
nnoremap <Tab>k :resize -5 <CR>
nnoremap <Tab>j :resize +5 <CR>
tnoremap <Esc> <C-\><C-n>:bd!<CR>

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

"Macro remappins
let @r="\y:%s/\<C-r>\"//g\<Left>\<Left>"
let @j=":w\<CR>:vsp | terminal java %\<CR>i"
let @k=":call JavaRun()\<CR>i"
let @f=":CocAction\<CR>"
let @h=":w\<CR>:vsp |terminal go run %\<CR>i"
let @p=":w\<CR>:vsp |terminal python %\<CR>i"
let @c=":w\<CR> :!g++ %\<CR> | :vsp |terminal ./a.out\<CR>i"
let @g=":w\<CR> :vsp | terminal go run % \<CR>i"
let @1=":call CppComp() \<CR>G:66\<CR>"

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
	execute "normal! i#!/usr/bin/python"
	execute "normal! o"
	execute "normal! o"
	execute "normal! o"
	execute "normal! o"
	execute "normal! oif __name__ == \"__main__\":"
endfunction

"Java configs
autocmd Filetype java set makeprg=javac\ -d\ %:~:h:s?src?bin?\ %
autocmd BufNewFile *.java exe "normal opublic class " . expand('%:t:r') . "\n{\n}\<Esc>1Go\<CR>\<CR>\<Esc>1G"
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()
autocmd BufNewFile *.{py} call <SID>insert_py()
autocmd BufNewFile *.{sh} call <SID>insert_sh()
"For auto shell change user permission
autocmd BufWritePost *.{sh} !chmod +x <afile>
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.cpp :%s/\s\+$//e

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

function! s:insert_sh()
	execute "normal! i#!/bin/bash"
	normal! kk
endfunction

"Fzf config
let g:fzf_preview_command = 'bat --color=always --plain {-1}'
let g:fzf_binary_preview_command = 'echo "{} is a binary file"'
let g:fzf_preview_lines_command = 'bat --color=always --plain --number'
let g:fzf_preview_preview_key_bindings = 'ctrl-d:preview-page-down,ctrl-u:preview-page-up,?:toggle-preview'
let g:fzf_preview_use_dev_icons = 1




"Airline config
let g:airline_theme='violet'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 0
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

"Setting colorscheme
set termguicolors
"colorscheme catppuccin
colorscheme molokai
"set bg=dark
highlight normal guibg=#1e1d2d
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#ffffff guibg=#0000ff
hi Comment guifg=#5ff752
hi Conceal guifg=#ffffff guibg=#0000ff ctermfg=black
let g:NERDTreeWinPos = "right"
highlight Visual  guifg=#ffffff guibg=#0000ff
"highlight Error cterm=bold guifg=#ffffff guibg=#000000
"highlight SpellBad cterm=bold guifg=#ffffff guibg=#000000

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Tab>"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent> <CR> <C-r>=<SID>ExpandSnippetOrClosePumOrReturnNewline()<CR>

let g:OmniSharp_server_use_mono=1
let g:bufferline_echo=0
let g:ale_disable_lsp=1
let g:ale_linters ={
\	'cs' : ['OmniSharp'],
\	'python' : ['pylint'],
\   'cpp' : [''],
\}


inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:ale_warn_about_traling_blank_lines=0
let g:ale_warn_about_traling_whitespace=0
let g:coc_global_config="$HOME/.config/nvim/coc-setting.json"


function! s:ExpandSnippetOrClosePumOrReturnNewline()
    if pumvisible()
        if !empty(v:completed_item)
            return "\<C-y>"
        else
            return "\<C-y>\<CR>"
        endif
    else
        return "\<CR>"
    endif
endfunction
