set background=dark
hi clear

let g:colors_name = "monochrome"

hi Added gui=NONE term=NONE cterm=NONE guifg=#b3f6c0 guibg=NONE ctermfg=157 ctermbg=NONE
hi link Boolean TSBoolean
hi Changed gui=NONE term=NONE cterm=NONE guifg=#8cf8f7 guibg=NONE ctermfg=123 ctermbg=NONE
hi link Character TSCharacter
hi ColorColumn gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#191919 ctermfg=NONE ctermbg=234
hi link Comment TSComment
hi Conceal gui=NONE term=NONE cterm=NONE guifg=#353535 guibg=NONE ctermfg=236 ctermbg=NONE
hi link Conditional TSConditional
hi link Constant TSConstant
hi CurSearch gui=NONE term=NONE cterm=NONE guifg=#07080d guibg=#fce094 ctermfg=232 ctermbg=222
hi Cursor gui=NONE term=NONE cterm=NONE guifg=#0e0e0e guibg=#eeeeee ctermfg=233 ctermbg=255
hi CursorColumn gui=NONE term=NONE cterm=NONE guifg=#eeeeee guibg=NONE ctermfg=255 ctermbg=NONE
hi CursorIM gui=NONE term=NONE cterm=NONE guifg=#0e0e0e guibg=#eeeeee ctermfg=233 ctermbg=255
hi CursorLine gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#191919 ctermfg=NONE ctermbg=234
hi link CursorLineFold FoldColumn
hi CursorLineNr gui=NONE term=NONE cterm=NONE guifg=#bbbbbb guibg=#191919 ctermfg=250 ctermbg=234
hi link CursorLineSign SignColumn
hi clear Debug
hi link Define TSConstBuiltin
hi link Delimiter TSPunctDelimiter
hi DiffAdd gui=NONE term=NONE cterm=NONE guifg=#ccd389 guibg=NONE ctermfg=186 ctermbg=NONE
hi DiffChange gui=NONE term=NONE cterm=NONE guifg=#a5c6e1 guibg=NONE ctermfg=7 ctermbg=NONE
hi DiffDelete gui=NONE term=NONE cterm=NONE guifg=#eca8a8 guibg=NONE ctermfg=217 ctermbg=NONE
hi DiffText gui=NONE term=NONE cterm=NONE guifg=#a5c6e1 guibg=NONE ctermfg=7 ctermbg=NONE
hi clear Directory
hi clear EndOfBuffer
hi link Error TSError
hi ErrorMsg gui=reverse,inverse term=NONE cterm=reverse,inverse guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi link Exception TSException
hi link Float TSFloat
hi clear FoldColumn
hi clear Folded
hi link Function TSFunction
hi link Identifier TSVariable
hi clear Ignore
hi IncSearch gui=bold term=NONE cterm=bold guifg=#0e0e0e guibg=#c9e6fd ctermfg=233 ctermbg=254
hi link Include TSInclude
hi link Keyword TSKeyword
hi link Label TSLabel
hi LineNr gui=NONE term=NONE cterm=NONE guifg=#494949 guibg=NONE ctermfg=238 ctermbg=NONE
hi link LineNrAbove LineNr
hi link LineNrBelow LineNr
hi link Macro TSFuncMacro
hi MatchParen gui=bold term=underline,bold cterm=bold guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi clear ModeMsg
hi clear MoreMsg
hi NonText gui=NONE term=NONE cterm=NONE guifg=#719e07 guibg=NONE ctermfg=70 ctermbg=NONE
hi Normal gui=NONE term=NONE cterm=NONE guifg=#eeeeee guibg=#0e0e0e ctermfg=255 ctermbg=233
hi link Number TSNumber
hi link Operator TSOperator
hi Pmenu gui=NONE term=NONE cterm=NONE guifg=#eeeeee guibg=#222222 ctermfg=255 ctermbg=235
hi link PmenuExtra Pmenu
hi link PmenuExtraSel PmenuSel
hi link PmenuKind Pmenu
hi link PmenuKindSel PmenuSel
hi PmenuMatch gui=bold term=bold cterm=bold guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi PmenuMatchSel gui=bold term=bold cterm=bold guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi PmenuSbar gui=NONE term=NONE cterm=NONE guifg=#eeeeee guibg=#222222 ctermfg=255 ctermbg=235
hi PmenuSel gui=NONE term=NONE cterm=NONE guifg=#222222 guibg=#eeeeee ctermfg=235 ctermbg=255
hi PmenuThumb gui=NONE term=NONE cterm=NONE guifg=#0e0e0e guibg=#bbbbbb ctermfg=233 ctermbg=250
hi clear PreCondit
hi clear PreProc
hi clear Question
hi clear QuickFixLine
hi Removed gui=NONE term=NONE cterm=NONE guifg=#ffc0b9 guibg=NONE ctermfg=217 ctermbg=NONE
hi link Repeat TSRepeat
hi Search gui=NONE term=NONE cterm=NONE guifg=#0e0e0e guibg=#8abae1 ctermfg=233 ctermbg=110
hi clear SignColumn
hi clear Special
hi link SpecialChar TSStringEscape
hi SpecialComment gui=italic,bold term=NONE cterm=italic,bold guifg=#8b8b8b guibg=NONE ctermfg=245 ctermbg=NONE
hi clear SpecialKey
hi SpellBad gui=underline term=undercurl cterm=underline guifg=#cb4b16 guibg=NONE ctermfg=166 ctermbg=NONE
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare
hi link Statement TSFunction
hi clear StatusLine
hi clear StatusLineNC
hi link StatusLineTerm StatusLine
hi link StatusLineTermNC StatusLineNC
hi link StorageClass TSType
hi link String TSString
hi link Structure TSAnnotation
hi clear TabLine
hi clear TabLineFill
hi TabLineSel gui=reverse,inverse term=NONE cterm=reverse,inverse guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi link Tag TSTag
hi Terminal gui=NONE term=NONE cterm=NONE guifg=#eeeeee guibg=#0e0e0e ctermfg=255 ctermbg=233
hi link Title TSTitle
hi Todo gui=bold term=bold cterm=bold guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi ToolbarButton gui=bold term=NONE cterm=bold guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi ToolbarLine gui=NONE term=NONE cterm=NONE guifg=NONE guibg=#0e0e0e ctermfg=NONE ctermbg=233
hi link Type TSType
hi Typedef gui=NONE term=NONE cterm=NONE guifg=#a3a3a3 guibg=NONE ctermfg=247 ctermbg=NONE
hi link Underlined TSUnderline
hi VertSplit gui=NONE term=NONE cterm=NONE guifg=#0e0e0e guibg=#0e0e0e ctermfg=233 ctermbg=233
hi Visual gui=NONE term=NONE cterm=NONE guifg=#0e0e0e guibg=#eeeeee ctermfg=233 ctermbg=255
hi VisualNOS gui=NONE term=NONE cterm=NONE guifg=#0e0e0e guibg=#eeeeee ctermfg=233 ctermbg=255
hi clear WarningMsg
hi WildMenu gui=reverse,inverse term=NONE cterm=reverse,inverse guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi lCursor gui=NONE term=NONE cterm=NONE guifg=#0e0e0e guibg=#eeeeee ctermfg=233 ctermbg=255
hi TSBoolean gui=bold term=NONE cterm=bold guifg=#eeeeee guibg=NONE ctermfg=255 ctermbg=NONE
hi TSCharacter gui=NONE term=NONE cterm=NONE guifg=#eeeeee guibg=NONE ctermfg=255 ctermbg=NONE
hi TSComment gui=italic term=NONE cterm=italic guifg=#494949 guibg=NONE ctermfg=238 ctermbg=NONE
hi TSConditional gui=NONE term=NONE cterm=NONE guifg=#5e5e5e guibg=NONE ctermfg=59 ctermbg=NONE
hi TSConstant gui=NONE term=NONE cterm=NONE guifg=#eeeeee guibg=NONE ctermfg=255 ctermbg=NONE
hi TSConstBuiltin gui=NONE term=NONE cterm=NONE guifg=#494949 guibg=NONE ctermfg=238 ctermbg=NONE
hi TSPunctDelimiter gui=NONE term=NONE cterm=NONE guifg=#eeeeee guibg=NONE ctermfg=255 ctermbg=NONE
hi TSError gui=underline,italic term=NONE cterm=underline,italic guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi TSException gui=underline,bold term=NONE cterm=underline,bold guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
hi TSFloat gui=bold term=NONE cterm=bold guifg=#eeeeee guibg=NONE ctermfg=255 ctermbg=NONE
hi TSFunction gui=NONE term=NONE cterm=NONE guifg=#8b8b8b guibg=NONE ctermfg=245 ctermbg=NONE
hi TSVariable gui=NONE term=NONE cterm=NONE guifg=#bbbbbb guibg=NONE ctermfg=250 ctermbg=NONE
hi TSInclude gui=NONE term=NONE cterm=NONE guifg=#a3a3a3 guibg=NONE ctermfg=247 ctermbg=NONE
hi TSKeyword gui=NONE term=NONE cterm=NONE guifg=#5e5e5e guibg=NONE ctermfg=59 ctermbg=NONE
hi TSLabel gui=NONE term=NONE cterm=NONE guifg=#eeeeee guibg=NONE ctermfg=255 ctermbg=NONE
hi TSFuncMacro gui=NONE term=NONE cterm=NONE guifg=#8b8b8b guibg=NONE ctermfg=245 ctermbg=NONE
hi TSNumber gui=bold term=NONE cterm=bold guifg=#eeeeee guibg=NONE ctermfg=255 ctermbg=NONE
hi TSOperator gui=NONE term=NONE cterm=NONE guifg=#eeeeee guibg=NONE ctermfg=255 ctermbg=NONE
hi TSRepeat gui=NONE term=NONE cterm=NONE guifg=#5e5e5e guibg=NONE ctermfg=59 ctermbg=NONE
hi TSStringEscape gui=NONE term=NONE cterm=NONE guifg=#d4d4d4 guibg=NONE ctermfg=188 ctermbg=NONE
hi TSType gui=NONE term=NONE cterm=NONE guifg=#5e5e5e guibg=NONE ctermfg=59 ctermbg=NONE
hi TSString gui=NONE term=NONE cterm=NONE guifg=#d4d4d4 guibg=NONE ctermfg=188 ctermbg=NONE
hi clear TSAnnotation
hi TSTag gui=NONE term=NONE cterm=NONE guifg=#eeeeee guibg=NONE ctermfg=255 ctermbg=NONE
hi clear TSTitle
hi TSUnderline gui=underline term=NONE cterm=underline guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
