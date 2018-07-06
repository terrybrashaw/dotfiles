set background=dark

if version > 580
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let g:colors_name = "minilux"

" set t_Co=16

" Basic settings
hi CursorLine           ctermfg=NONE            ctermbg=NONE    cterm=underline guifg=NONE      guibg=#fffbdd   gui=NONE
hi CursorLineNr         ctermfg=NONE            ctermbg=NONE    cterm=NONE      guifg=#aaaaaa   guibg=#f0f0f0   gui=bold
hi LineNr               ctermfg=NONE            ctermbg=NONE    cterm=NONE      guifg=#aaaaaa   guibg=#f0f0f0   gui=NONE
hi MatchParen           ctermfg=NONE            ctermbg=NONE    cterm=underline
hi ColorColumn                                  ctermbg=darkgrey

" Syntax highlightings
hi Character            ctermfg=red             ctermbg=NONE    cterm=NONE      guifg=#A31515   guibg=NONE      gui=NONE
hi String               ctermfg=red             ctermbg=NONE    cterm=NONE      guifg=#A31515   guibg=NONE      gui=NONE
hi Special              ctermfg=red             ctermbg=NONE    cterm=bold      guifg=#A31515   guibg=NONE      gui=bold

hi Boolean              ctermfg=red             ctermbg=NONE    cterm=NONE      guifg=#A31515   guibg=NONE      gui=NONE
hi Constant             ctermfg=red             ctermbg=NONE    cterm=NONE      guifg=#A31515   guibg=NONE      gui=NONE
hi Float                ctermfg=red             ctermbg=NONE    cterm=NONE      guifg=#A31515   guibg=NONE      gui=NONE
hi Number               ctermfg=red             ctermbg=NONE    cterm=NONE      guifg=#A31515   guibg=NONE      gui=NONE

hi Comment              ctermfg=darkgrey        ctermbg=NONE    cterm=NONE      guifg=#aaaaaa   guibg=NONE      gui=NONE
hi SpecialComment       ctermfg=darkgreen       ctermbg=NONE    cterm=NONE      guifg=#008000   guibg=NONE      gui=NONE

hi Conditional          ctermfg=magenta         ctermbg=NONE    cterm=NONE      guifg=#AF00DB   guibg=NONE      gui=NONE
hi Repeat               ctermfg=magenta         ctermbg=NONE    cterm=NONE      guifg=#AF00DB   guibg=NONE      gui=NONE

hi Function             ctermfg=NONE            ctermbg=NONE    cterm=NONE      guifg=#795E26   guibg=NONE      gui=NONE
hi Type                 ctermfg=NONE            ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi Operator             ctermfg=NONE            ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi PreProc              ctermfg=NONE            ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi Delimiter            ctermfg=NONE            ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE

hi Statement            ctermfg=blue            ctermbg=NONE    cterm=NONE      guifg=#0000ff   guibg=NONE      gui=NONE
hi Keyword              ctermfg=blue            ctermbg=NONE    cterm=NONE      guifg=#0000ff   guibg=NONE      gui=NONE
hi StorageClass         ctermfg=cyan            ctermbg=NONE    cterm=NONE      guifg=#09885a   guibg=NONE      gui=NONE

hi Identifier           ctermfg=NONE            ctermbg=NONE    cterm=NONE      guifg=#267f99   guibg=NONE      gui=NONE

hi Error                ctermfg=white           ctermbg=darkred cterm=NONE      guifg=#ff0000   guibg=NONE      gui=undercurl

" Unknown
hi PreCondit            ctermfg=NONE            ctermbg=green   cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi Tag                  ctermfg=NONE            ctermbg=green   cterm=NONE      guifg=#00ff00   guibg=NONE      gui=NONE
hi SpecialKey           ctermfg=NONE            ctermbg=green   cterm=NONE      guifg=#00ff00   guibg=NONE      gui=NONE
hi Label                ctermfg=NONE            ctermbg=green   cterm=NONE      guifg=#00ff00   guibg=NONE      gui=NONE
hi Define               ctermfg=NONE            ctermbg=green   cterm=NONE      guifg=#00ff00   guibg=NONE      gui=NONE

" Rust syntax definitions
hi rustSelf             ctermfg=NONE            ctermbg=NONE    cterm=bold      guifg=NONE      guibg=NONE      gui=bold
hi rustFuncCall         ctermfg=NONE            ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi rustQuestionMark     ctermfg=NONE            ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE

" CSS syntax
hi cssSelectorOp        ctermfg=NONE            ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi cssSelectorOp2       ctermfg=NONE            ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi cssAttrComma         ctermfg=NONE            ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi cssProp              ctermfg=NONE            ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi cssClassName         ctermfg=magenta         ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi cssClassNameDot      ctermfg=magenta         ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi cssIdentifier        ctermfg=yellow          ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi cssPseudoClass       ctermfg=blue            ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi cssPseudoClassId     ctermfg=blue            ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi cssPseudoClassFn     ctermfg=blue            ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE

" Lua
hi luaFunction          ctermfg=blue            ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi luaLoopBlock         ctermfg=magenta         ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi luaRepeat            ctermfg=magenta         ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi luaBlock             ctermfg=magenta         ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
hi luaCond              ctermfg=magenta         ctermbg=NONE    cterm=NONE      guifg=NONE      guibg=NONE      gui=NONE
