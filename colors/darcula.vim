" This Source Code Form is subject to the terms of the Mozilla Public
" License, v. 2.0. If a copy of the MPL was not distributed with this
" file, You can obtain one at https://mozilla.org/MPL/2.0/.

set termguicolors
set background=dark
set cursorline
highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name='darcula'

let s:bg='#2B2B2B'
let s:fg='#A9B7C6'
let s:cursor='#BBBBBB'
let s:gutter='#313335'
let s:selection='#214283'
let s:cursorLine='#323232'
let s:cursorLineNr='#A4A3A3'
let s:errorMsg='#CC666E'
let s:error='#BC3F3C'
let s:warning=s:fg
let s:muted='#72737A'
let s:lineNumber='#606366'
let s:matchBraceFg='#FFEF28'
let s:matchBraceBg='#3B514D'
let s:visual='#10211e'
let s:todo='#A8C023'
let s:search='#32593D'
let s:incSearch='#155221'
let s:foldedFg='#8C8C8C'
let s:foldedBg='#3A3A3A'
let s:constant='#9876AA'
let s:keyword='#CC7832'
let s:comment='#808080'
let s:string='#6A8759'
let s:number='#6897BB'
let s:delimiter='#CC7832'
let s:constant='#9876AA'
let s:specialComment='#8A653B'
let s:function='#FFC66D'
let s:diffAdd='#294436'
let s:diffText='#385570'
let s:diffDelete='#484A4A'
let s:diffChange='#303C47'
let s:addStripe='#384C38'
let s:stripeWhiteSpace='#4C4638'
let s:changeStripe='#374752'
let s:deleteStripe='#656E76'
let s:typo='#659C6B'
let s:metaData='#BBB529'
let s:debug='#666D75'
let s:codeWarning='#52503A'
let s:errorStripe='#9E2927'
let s:warnStripe='#BE9117'
let s:infoStripe='#756D56'

function s:Hi(group, fg, ...)
  " arguments: group, guifg, guibg, gui, guisp
  if a:0 >= 1
    let bg=a:1
  else
    let bg='NONE'
  endif
  if a:0 >= 2 && strlen(a:2)
    let style=a:2
  else
    let style='NONE'
  endif
  let hiList = [
        \ 'hi', a:group,
        \ 'guifg=' . a:fg,
        \ 'guibg=' . bg,
        \ 'gui=' . style,
        \ 'cterm=' . style
        \ ]
  execute join(hiList)
endfunction

call s:Hi('Normal', s:fg, s:bg)
call s:Hi('ColorColumn', s:lineNumber)
hi! link Conceal Normal
call s:Hi('Cursor', s:cursor)
hi! link lCursor Cursor
hi! link CursorIM Cursor
" hi CursorColumn
call s:Hi('CursorLine', 'NONE', s:cursorLine, 'NONE')
call s:Hi('DiffAdd', 'NONE', s:diffAdd)
call s:Hi('DiffChange', 'NONE', s:diffChange)
call s:Hi('DiffDelete', 'NONE', s:diffDelete)
call s:Hi('DiffText', 'NONE', s:diffText)
hi! link Directory Normal
hi! link EndOfBuffer NonText
call s:Hi('ErrorMsg', s:errorMsg)
call s:Hi('Error', s:error)
call s:Hi('VertSplit', s:muted)
call s:Hi('Folded', s:foldedFg, s:foldedBg)
hi! link FoldColumn Folded
call s:Hi('SignColumn', 'NONE', s:gutter)
call s:Hi('LineNr', s:lineNumber, s:gutter)
call s:Hi('CursorLineNr', s:cursorLineNr, s:cursorLine)
call s:Hi('MatchParen', s:matchBraceFg, s:matchBraceBg, 'bold')
" hi ModeMsg
hi! link MoreMsg Normal
call s:Hi('NonText', s:muted)
" hi Pmenu
" hi PmenuSel
" hi PmenuSbar
" hi PmenuThumb
hi! link Question Normal
hi! link QuickFixLine Normal
call s:Hi('Search', 'NONE', s:search)
call s:Hi('IncSearch', 'NONE', s:incSearch)
hi! link SpecialKey NonText
call s:Hi('SpellBad', s:typo, 'NONE', 'underline')
hi! link SpellCap SpellBad
hi! link SpellLocal SpellBad
hi! link SpellRare SpellBad
" StatusLine
" StatusLineNC
" StatusLineTerm
" StatusLineTermNC
" call s:Hi('TabLine', s:fg)
" call s:Hi('TabLineFill', 'NONE')
" call s:Hi('TabLineSel', s:fg, s:darkGrey)
" Terminal
hi! link Title Special
call s:Hi('Visual', 'NONE', s:selection)
hi! link VisualNOS Visual
call s:Hi('WarningMsg', s:warning)
" WildMenu
call s:Hi('Comment', s:comment, s:bg, 'italic')
hi! link Identifier Normal
hi! link Type Keyword
call s:Hi('Todo', s:todo, s:bg, 'italic,bold')
hi! link Special PreProc
call s:Hi('Constant', '#9876AA')
call s:Hi('String', s:string)
hi! link Character String
call s:Hi('Number', s:number)
call s:Hi('Delimiter', s:delimiter)
call s:Hi('SpecialComment', s:specialComment, 'NONE', 'italic')
hi! link Statement Keyword
call s:Hi('Keyword', s:keyword)
call s:Hi('Underlined', s:fg, s:bg, 'underline')
call s:Hi('PreProc', s:metaData)
hi! link Tag Keyword
call s:Hi('Debug', s:debug, 'NONE', 'italic')
call s:Hi('Function', s:function)

" GitGutter
call s:Hi('GitGutterAdd', s:addStripe, s:addStripe)
call s:Hi('GitGutterChange', s:changeStripe, s:changeStripe)
call s:Hi('GitGutterDelete', s:deleteStripe, s:gutter)
call s:Hi('GitGutterChangeDelete', s:stripeWhiteSpace, s:stripeWhiteSpace)

" Ale
call s:Hi('ALEInfo', 'NONE', 'NONE', 'underline')
call s:Hi('ALEWarning', 'NONE', s:codeWarning)
hi! link ALEError Error
call s:Hi('ALEErrorSign', s:errorStripe, s:gutter)
call s:Hi('ALEWarningSign', s:warnStripe, s:gutter)
call s:Hi('ALEInfoSign', s:infoStripe, s:gutter)

