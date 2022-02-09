"     __
"    / /___ _________ _      ______ __   _____
"   / / __ `/ ___/ _ \ | /| / / __ `/ | / / _ \
"  / / /_/ / /__/  __/ |/ |/ / /_/ /| |/ /  __/
" /_/\__,_/\___/\___/|__/|__/\__,_/ |___/\___/
"
" File:       lacerwave.vim
" AUTHOR:     averak
" License:    MIT


if !has('gui_running') && &t_Co < 256
  finish
endif

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'lacerwave'

hi Normal ctermbg=8 ctermfg=252
hi ColorColumn cterm=NONE ctermbg=235 ctermfg=NONE
hi CursorColumn cterm=NONE ctermbg=235 ctermfg=NONE
hi CursorLine cterm=NONE ctermbg=235 ctermfg=NONE
hi Comment ctermfg=60
hi Conceal ctermbg=8 ctermfg=242
hi Constant ctermfg=140
hi Cursor ctermbg=252 ctermfg=8
hi CursorLineNr cterm=NONE ctermbg=237 ctermfg=253
hi Delimiter ctermfg=252
hi DiffAdd ctermbg=29 ctermfg=158
hi DiffChange ctermbg=23 ctermfg=159
hi DiffDelete cterm=NONE ctermbg=95 ctermfg=224
hi DiffText cterm=NONE ctermbg=30 ctermfg=195
hi Directory ctermfg=109
hi Error ctermbg=8 ctermfg=203
hi ErrorMsg ctermbg=8 ctermfg=203
hi WarningMsg ctermbg=8 ctermfg=203
hi EndOfBuffer ctermfg=236
hi NonText ctermfg=236
hi Whitespace ctermfg=236
hi Folded ctermbg=235 ctermfg=245
hi FoldColumn ctermbg=235 ctermfg=239
hi Function ctermfg=108
hi Identifier cterm=NONE ctermfg=185
hi Ignore ctermbg=NONE ctermfg=NONE
hi Include ctermfg=38
hi IncSearch cterm=reverse ctermfg=NONE
hi LineNr ctermbg=235 ctermfg=239
hi MatchParen ctermbg=237 ctermfg=255
hi ModeMsg ctermfg=242
hi MoreMsg ctermfg=150
hi Operator ctermfg=79
hi Pmenu ctermbg=236 ctermfg=251
hi PmenuSbar ctermbg=236 ctermfg=NONE
hi PmenuSel ctermbg=60 ctermfg=255
hi PmenuThumb ctermbg=251 ctermfg=NONE
hi PreProc ctermfg=78
hi Question ctermfg=150
hi QuickFixLine ctermbg=236 ctermfg=252
hi Search ctermbg=24 ctermfg=252
hi SignColumn ctermbg=235 ctermfg=239
hi Special ctermfg=150
hi SpecialKey ctermfg=240
hi SpellBad cterm=underline ctermbg=NONE ctermfg=NONE
hi SpellCap cterm=underline ctermbg=NONE ctermfg=NONE
hi SpellLocal cterm=underline ctermbg=NONE ctermfg=NONE
hi SpellRare cterm=underline ctermbg=NONE ctermfg=NONE
hi Statement ctermfg=134
hi StorageClass ctermfg=38
hi String ctermfg=110
hi Structure ctermfg=38
hi TabLine cterm=NONE ctermbg=233 ctermfg=238
hi TabLineFill cterm=reverse ctermbg=238 ctermfg=233
hi TabLineSel cterm=NONE ctermbg=8 ctermfg=252
hi TermCursorNC ctermbg=242 ctermfg=8
hi Title ctermfg=206
hi Todo ctermbg=8 ctermfg=150
hi Type ctermfg=134
hi Underlined cterm=underline ctermfg=110 term=underline
hi VertSplit cterm=NONE ctermbg=233 ctermfg=233
hi Visual ctermbg=236 ctermfg=NONE
hi VisualNOS ctermbg=236 ctermfg=NONE
hi WildMenu ctermbg=255 ctermfg=8
hi diffAdded ctermfg=150
hi diffRemoved ctermfg=203
hi ALEErrorSign ctermbg=235 ctermfg=203
hi ALEWarningSign ctermbg=235 ctermfg=222
hi ALEVirtualTextError ctermfg=203
hi ALEVirtualTextWarning ctermfg=216
hi CtrlPMode1 ctermbg=236 ctermfg=242
hi EasyMotionShade ctermfg=239
hi EasyMotionTarget ctermfg=150
hi EasyMotionTarget2First ctermfg=216
hi EasyMotionTarget2Second ctermfg=216
hi GitGutterAdd ctermbg=235 ctermfg=150
hi GitGutterChange ctermbg=235 ctermfg=109
hi GitGutterChangeDelete ctermbg=235 ctermfg=109
hi GitGutterDelete ctermbg=235 ctermfg=203
hi gitmessengerEndOfBuffer ctermbg=235 ctermfg=239
hi gitmessengerPopupNormal ctermbg=235 ctermfg=252
hi Sneak ctermbg=140 ctermfg=8
hi SneakScope ctermbg=236 ctermfg=242
hi SpelunkerSpellBad cterm=underline ctermbg=NONE ctermfg=NONE
hi SyntasticErrorSign ctermbg=235 ctermfg=203
hi SyntasticStyleErrorSign ctermbg=235 ctermfg=203
hi SyntasticStyleWarningSign ctermbg=235 ctermfg=222
hi SyntasticWarningSign ctermbg=235 ctermfg=222
hi ZenSpace ctermbg=203

if has('nvim')
  let g:terminal_color_0 = '#1e2132'
  let g:terminal_color_1 = '#e27878'
  let g:terminal_color_2 = '#b4be82'
  let g:terminal_color_3 = '#e2a478'
  let g:terminal_color_4 = '#84a0c6'
  let g:terminal_color_5 = '#a093c7'
  let g:terminal_color_6 = '#89b8c2'
  let g:terminal_color_7 = '#c6c8d1'
  let g:terminal_color_8 = '#6b7089'
  let g:terminal_color_9 = '#e98989'
  let g:terminal_color_10 = '#c0ca8e'
  let g:terminal_color_11 = '#e9b189'
  let g:terminal_color_12 = '#91acd1'
  let g:terminal_color_13 = '#ada0d3'
  let g:terminal_color_14 = '#95c4ce'
  let g:terminal_color_15 = '#d2d4de'
else
  let g:terminal_ansi_colors = ['#1e2132', '#e27878', '#b4be82', '#e2a478', '#84a0c6', '#a093c7', '#89b8c2', '#c6c8d1', '#6b7089', '#e98989', '#c0ca8e', '#e9b189', '#91acd1', '#ada0d3', '#95c4ce', '#d2d4de']
endif

hi! link TermCursor Cursor
hi! link ToolbarButton TabLineSel
hi! link ToolbarLine TabLineFill
hi! link cssBraces Delimiter
hi! link cssClassName Special
hi! link cssClassNameDot Normal
hi! link cssPseudoClassId Special
hi! link cssTagName Statement
hi! link helpHyperTextJump Constant
hi! link htmlArg Constant
hi! link htmlEndTag Statement
hi! link htmlTag Statement
hi! link jsonQuote Normal
hi! link phpVarSelector Identifier
hi! link pythonFunction Title
hi! link rubyDefine Statement
hi! link rubyFunction Title
hi! link rubyInterpolationDelimiter String
hi! link rubySharpBang Comment
hi! link rubyStringDelimiter String
hi! link rustFuncCall Normal
hi! link rustFuncName Title
hi! link rustType Constant
hi! link sassClass Special
hi! link shFunction Normal
hi! link vimContinue Comment
hi! link vimFuncSID vimFunction
hi! link vimFuncVar Normal
hi! link vimFunction Title
hi! link vimGroup Statement
hi! link vimHiGroup Statement
hi! link vimHiTerm Identifier
hi! link vimMapModKey Special
hi! link vimOption Identifier
hi! link vimVar Normal
hi! link xmlAttrib Constant
hi! link xmlAttribPunct Statement
hi! link xmlEndTag Statement
hi! link xmlNamespace Statement
hi! link xmlTag Statement
hi! link xmlTagName Statement
hi! link yamlKeyValueDelimiter Delimiter
hi! link CtrlPPrtCursor Cursor
hi! link CtrlPMatch Title
hi! link CtrlPMode2 StatusLine
hi! link deniteMatched Normal
hi! link deniteMatchedChar Title
hi! link elixirBlockDefinition Statement
hi! link elixirDefine Statement
hi! link elixirDocSigilDelimiter String
hi! link elixirDocTest String
hi! link elixirExUnitMacro Statement
hi! link elixirExceptionDefine Statement
hi! link elixirFunctionDeclaration Title
hi! link elixirKeyword Statement
hi! link elixirModuleDeclaration Normal
hi! link elixirModuleDefine Statement
hi! link elixirPrivateDefine Statement
hi! link elixirStringDelimiter String
hi! link jsFlowMaybe Normal
hi! link jsFlowObject Normal
hi! link jsFlowType PreProc
hi! link graphqlName Normal
hi! link graphqlOperator Normal
hi! link gitmessengerHash Comment
hi! link gitmessengerHeader Statement
hi! link gitmessengerHistory Constant
hi! link jsArrowFunction Operator
hi! link jsClassDefinition Normal
hi! link jsClassFuncName Title
hi! link jsExport Statement
hi! link jsFuncName Title
hi! link jsFutureKeys Statement
hi! link jsFuncCall Normal
hi! link jsGlobalObjects Statement
hi! link jsModuleKeywords Statement
hi! link jsModuleOperators Statement
hi! link jsNull Constant
hi! link jsObjectFuncName Title
hi! link jsObjectKey Identifier
hi! link jsSuper Statement
hi! link jsTemplateBraces Special
hi! link jsUndefined Constant
hi! link markdownBold Special
hi! link markdownCode String
hi! link markdownCodeDelimiter String
hi! link markdownHeadingDelimiter Comment
hi! link markdownRule Comment
hi! link ngxDirective Statement
hi! link plug1 Normal
hi! link plug2 Identifier
hi! link plugDash Comment
hi! link plugMessage Special
hi! link SignifySignAdd GitGutterAdd
hi! link SignifySignChange GitGutterChange
hi! link SignifySignChangeDelete GitGutterChangeDelete
hi! link SignifySignDelete GitGutterDelete
hi! link SignifySignDeleteFirstLine SignifySignDelete
hi! link StartifyBracket Comment
hi! link StartifyFile Identifier
hi! link StartifyFooter Constant
hi! link StartifyHeader Constant
hi! link StartifyNumber Special
hi! link StartifyPath Comment
hi! link StartifySection Statement
hi! link StartifySlash Comment
hi! link StartifySpecial Normal
hi! link svssBraces Delimiter
hi! link swiftIdentifier Normal
hi! link typescriptAjaxMethods Normal
hi! link typescriptBraces Normal
hi! link typescriptEndColons Normal
hi! link typescriptFuncKeyword Statement
hi! link typescriptGlobalObjects Statement
hi! link typescriptHtmlElemProperties Normal
hi! link typescriptIdentifier Statement
hi! link typescriptMessage Normal
hi! link typescriptNull Constant
hi! link typescriptParens Normal

if !has('nvim')
  hi! link SpecialKey Whitespace
endif
