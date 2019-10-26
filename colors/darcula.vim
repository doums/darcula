" This Source Code Form is subject to the terms of the Mozilla Public
" License, v. 2.0. If a copy of the MPL was not distributed with this
" file, You can obtain one at https://mozilla.org/MPL/2.0/.

if exists("g:darcula")
  finish
endif
let g:darcula = 1
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
let s:link='#287BDE'
let s:stdOutput='#BBBBBB'
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
let s:docComment='#629755'
let s:string='#6A8759'
let s:number='#6897BB'
let s:delimiter='#CC7832'
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
let s:macroName='#908B25'
let s:cDataStructure='#B5B6E3'
let s:cStructField='#9373A5'
let s:debug='#666D75'
let s:codeWarning='#52503A'
let s:errorStripe='#9E2927'
let s:warnStripe='#BE9117'
let s:infoStripe='#756D56'
let s:typeDef='#B9BCD1'
let s:menu='#46484A'
let s:menuFg='#AFB1B3'
let s:menuSel='#103A5C'
let s:menuSBar='#616263'
let s:tag='#E8BF6A'
let s:entity='#6D9CBE'
let s:htmlAttribute='#BABABA'
let s:htmlString='#A5C261'
let s:tsObject='#507874'
let s:statusLine='#3C3F41'
let s:statusLineFg='#AEB0B2'
let s:statusLineNC='#88898B'
let s:tabLineSel='#4E5254'
let s:shCommand='#C57633'
let s:templateLanguage='#232525'
let s:rustMacro='#4EADE5'
let s:rustLifetime='#20999D'

" helper function
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
hi! link CursorColumn CursorLine
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
call s:Hi('ModeMsg', s:stdOutput)
hi! link MoreMsg Normal
call s:Hi('NonText', s:muted)
call s:Hi('Pmenu', s:menuFg, s:menu)
call s:Hi('PmenuSel', s:menuFg, s:menuSel)
call s:Hi('PmenuSbar', s:menu, s:menu)
call s:Hi('PmenuThumb', s:menuSBar, s:menuSBar)
hi! link Question Normal
hi! link QuickFixLine Normal
call s:Hi('Search', 'NONE', s:search)
call s:Hi('IncSearch', 'NONE', s:incSearch)
hi! link SpecialKey NonText
call s:Hi('SpellBad', s:typo, 'NONE', 'underline')
hi! link SpellCap SpellBad
hi! link SpellLocal SpellBad
hi! link SpellRare SpellBad
call s:Hi('StatusLine', s:statusLineFg, s:statusLine)
call s:Hi('StatusLineNC', s:statusLineNC, s:statusLine)
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
call s:Hi('TabLine', s:statusLineFg, s:statusLine)
call s:Hi('TabLineFill', s:statusLine, s:statusLine)
call s:Hi('TabLineSel', s:fg, s:tabLineSel)
call s:Hi('Terminal', s:stdOutput, s:bg)
hi! link Title Special
call s:Hi('Visual', 'NONE', s:selection)
hi! link VisualNOS Visual
call s:Hi('WarningMsg', s:warning)
hi! link WildMenu Normal
call s:Hi('Comment', s:comment)
hi! link Identifier Normal
hi! link Type Keyword
call s:Hi('Typedef', s:typeDef, s:bg)
call s:Hi('Todo', s:todo, s:bg, 'italic')
hi! link Special PreProc
call s:Hi('Constant', s:constant)
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

" helper groups
call s:Hi('docComment', s:docComment, s:bg, 'italic')

" Terminal colors (for :terminal)
let s:ANSIBlack='#FFFFFF'
let s:ANSIRed='#FF6B68'
let s:ANSIGreen='#A8C023'
let s:ANSIYellow='#D6BF55'
let s:ANSIBlue='#5394EC'
let s:ANSIMagenta='#AE8ABE'
let s:ANSICyan='#299999'
let s:ANSIGray='#999999'
let s:ANSIDarkGray='#555555'
let s:ANSIBrightRed='#FF8785'
let s:ANSIBrightGreen='#A8C023'
let s:ANSIBrightYellow='#FFFF00'
let s:ANSIBrightBlue='#7EAEF1'
let s:ANSIBrightMagenta='#FF99FF'
let s:ANSIBrightCyan='#6CDADA'
let s:ANSIWhite='#1F1F1F'
let g:terminal_ansi_colors=[
      \ s:ANSIBlack,
      \ s:ANSIRed,
      \ s:ANSIGreen,
      \ s:ANSIYellow,
      \ s:ANSIBlue,
      \ s:ANSIMagenta,
      \ s:ANSICyan,
      \ s:ANSIGray,
      \ s:ANSIDarkGray,
      \ s:ANSIBrightRed,
      \ s:ANSIBrightGreen,
      \ s:ANSIBrightYellow,
      \ s:ANSIBrightBlue,
      \ s:ANSIBrightMagenta,
      \ s:ANSIBrightCyan,
      \ s:ANSIWhite
      \ ]

" GitGutter
call s:Hi('GitGutterAdd', s:addStripe, s:addStripe)
call s:Hi('GitGutterChange', s:changeStripe, s:changeStripe)
call s:Hi('GitGutterDelete', s:deleteStripe, s:gutter)
call s:Hi('GitGutterChangeDelete', s:stripeWhiteSpace, s:stripeWhiteSpace)
if &encoding == 'utf-8'
  let g:gitgutter_sign_removed = '▶'
endif

" ALE
call s:Hi('ALEInfo', 'NONE', 'NONE', 'underline')
call s:Hi('ALEWarning', 'NONE', s:codeWarning)
hi! link ALEError Error
call s:Hi('ALEErrorSign', s:errorStripe, s:gutter)
call s:Hi('ALEWarningSign', s:warnStripe, s:gutter)
call s:Hi('ALEInfoSign', s:infoStripe, s:gutter)

" C/C++
call s:Hi('cMacroName', s:macroName)
hi! link cConstant cMacroName
hi! link cPreInclude String
hi! link cPreProcRegion Normal
hi! link cUserLabel Normal
hi! link cDataStructureKeyword Keyword
call s:Hi('cDataStructure', s:cDataStructure)
call s:Hi('cFunction', s:function)
hi! link cppDestructor cFunction
hi! link cSemicolon Keyword
hi! link cComma Keyword
call s:Hi('cppAfterColon', s:cStructField)
hi! link cppBeforeColon cDataStructure
call s:Hi('cStructField', s:cStructField)
hi! link cppNullptr Keyword
hi! link cppTemplate Keyword
hi! link cTypedef Keyword
hi! link cppTypeName Keyword
hi! link cSpecial Keyword
hi! link cEnum Keyword
call s:Hi('cSomeMacro', s:macroName)

" Rust
call s:Hi('rustDeriveTrait', s:metaData)
hi! link rustQuestionMark PreProc
hi! link rustComma Keyword
hi! link rustSemicolon Keyword
hi! link rustOperator Normal
call s:Hi('rustCommentLineDoc', s:docComment, s:bg, 'italic')
hi! link rustMacro PreProc
hi! link rustEscape Keyword
hi! link rustSigil Normal
hi! link rustSelf Keyword
call s:Hi('rustLifetime', s:macroName, s:bg, 'italic')
call s:Hi('rustTypeParameter', s:macroName, s:bg, 'bold')
call s:Hi('rustEnumVariant', s:constant, s:bg, 'italic')
hi! link rustModPath Normal
hi! link rustModPathSep Normal
hi! link rustAs Keyword
hi! link rustConst Keyword
call s:Hi('rustConst', s:constant, s:bg, 'italic')
hi! link rustVarField Constant

" Vim
hi! link vimOption Constant
hi! link vimFunction Function
hi! link vimContinue NonText
hi! link vimParenSep Normal
hi! link vimBracket PreProc
hi! link vimOper Normal
hi! link vimSep Normal
hi! link vimCommentString Comment

" JavaScript
hi! link jsNoise Keyword
hi! link JsImport Keyword
hi! link JsFrom Keyword
hi! link JsOperator Normal
hi! link jsArrowFunction Normal
hi! link jsFuncArgCommas Delimiter
hi! link jsObjectKey Constant
hi! link jsTernaryIfOperator Normal
hi! link jsObjectSeparator Keyword
hi! link jsSpreadOperator Normal
hi! link jsModuleComma Keyword
hi! link jsClassDefinition Normal
hi! link jsSuper Keyword
hi! link jsThis Keyword
hi! link jsObjectProp Constant
hi! link jsDestructuringNoise Keyword
hi! link jsClassProperty Function
hi! link jsBooleanTrue Keyword
hi! link jsBooleanFalse Keyword
hi! link jsObjectShorthandProp Normal
hi! link jsObjectColon Normal
hi! link jsExport Keyword
hi! link jsModuleAs Keyword

" TypeScript
hi! link typescriptBraces Normal
hi! link typescriptDocComment docComment
hi! link typescriptDocParam docComment
hi! link typescriptParens Normal
hi! link typescriptOpSymbols Constant
hi! link typescriptRegexpString Number
hi! link typescriptSpecial Keyword
hi! link typescriptLogicSymbols Constant
hi! link typescriptExceptions Keyword
call s:Hi('typescriptDocTags', s:docComment, s:bg, 'bold,italic,underline')
call s:Hi('typescriptGlobalObjects', s:tsObject)

" JSON
hi! link jsonBraces Normal
hi! link jsonKeyword Constant
hi! link jsonNoise Keyword
hi! link jsonKeywordMatch Keyword
hi! link jsonBoolean Keyword
hi! link jsonNull Keyword
hi! link jsonEscape Keyword
hi! link jsonStringMatch String

" XML
call s:Hi('xmlTagName', s:tag)
hi! link xmlEndTag xmlTagName
hi! link xmlAttrib Normal
hi! link xmlProcessingDelim xmlTagName
hi! link xmlDocTypeKeyword xmlTagName
hi! link xmlComment Comment
hi! link xmlCommentStart xmlComment
hi! link xmlCommentPart xmlComment
call s:Hi('xmlEntity', s:entity)
hi! link xmlEntityPunct xmlEntity
hi! link xmlCdata Normal
hi! link xmlCdataCdata xmlCdata
hi! link xmlCdataStart xmlCdata
hi! link xmlCdataEnd xmlCdata
hi! link xmlNamespace Constant
hi! link xmlAttribPunct Normal
hi! link xmlEqual xmlString

" GraphQL
hi! link graphqlTaggedTemplate Normal

" YAML
hi! link yamlDocumentStart Normal
hi! link yamlDocumentEnd Normal
hi! link yamlComment docComment
hi! link yamlBlockMappingKey Keyword
hi! link yamlKeyValueDelimiter Normal
hi! link yamlInteger Normal
hi! link yamlFloat Normal
hi! link yamlBlockCollectionItemStart Normal
call s:Hi('yamlAnchor', s:tag)
hi! link yamlAlias yamlAnchor
hi! link yamlBool Normal
hi! link yamlNodeTag Normal
hi! link yamlNull Normal

" Markdown
call s:Hi('markdownH1', s:constant, 'NONE', 'italic')
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownHeadingRule markdownH1
hi! link markdownHeadingDelimiter markdownH1
call s:Hi('markdownAutomaticLink', s:link, 'NONE', 'underline')
hi! link markdownBlockquote String
hi! link markdownBoldDelimiter Keyword
hi! link markdownBold Normal
hi! link markdownItalicDelimiter Keyword
hi! link markdownItalic Normal
hi! link markdownCode Comment
hi! link markdownCodeDelimiter markdownCode
hi! link markdownCodeBlock markdownCode
call s:Hi('markdownLinkText', s:link, 'NONE', 'underline')
hi! link markdownLinkTextDelimiter markdownLinkText
hi! link markdownUrlDelimiter markdownLinkText
call s:Hi('markdownUrl', s:function, 'NONE', 'italic')
hi! link markdownIdDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownIdDeclaration Keyword
hi! link markdownLinkDelimiter Normal
hi! link markdownUrlTitleDelimiter Comment
hi! link markdownRule Comment

" HTML
let html_no_rendering=1
call s:Hi('htmlTag', s:tag)
hi! link htmlTagName htmlTag
hi! link htmlEndTag htmlTag
call s:Hi('htmlArg', s:htmlAttribute)
call s:Hi('htmlString', s:htmlString)
hi! link htmlValue htmlString
hi! link htmlComment Comment
hi! link htmlCommentError Comment
hi! link htmlCommentPart Comment
call s:Hi('htmlSpecialChar', s:entity)
hi! link htmlSpecialTagName htmlTag

" CSS
hi! link cssAtKeyword Keyword
hi! link cssBraces Normal
hi! link cssAttributeSelector htmlTag
hi! link cssSelectorOp Normal
hi! link cssClassName htmlTag
hi! link cssNoise Keyword
hi! link cssAttrComma Keyword
hi! link cssFunctionComma Keyword
hi! link cssMediaComma Keyword
hi! link cssComment Comment
hi! link cssClassNameDot Normal
call s:Hi('cssFunctionName', s:tag)
call s:Hi('cssColor', s:number)
call s:Hi('cssIdentifier', s:tag)
call s:Hi('cssPseudoClassId', s:tag)
call s:Hi('cssImportant', s:keyword, s:bg, 'bold')
call s:Hi('cssProp', s:htmlAttribute)
call s:Hi('cssAttr', s:htmlString)
call s:Hi('cssAttrRegion', s:htmlString)
call s:Hi('cssURL', s:link)

" Shell Script
call s:Hi('sheBang', s:fg, s:bg, 'bold')
hi! link shRange Normal
hi! link shFunctionKey Keyword
call s:Hi('shStatement', s:shCommand)
hi! link bashStatement shStatement
hi! link shDerefVar Normal
hi! link shQuote String
call s:Hi('shHereDoc', 'NONE', s:templateLanguage)
call s:Hi('shRedir', s:fg, s:bg, 'bold')
hi! link shDerefSimple Normal
hi! link shCommandSubBQ Constant
hi! link shOption Normal
hi! link shCmdSubRegion shStatement
hi! link shCommandSub Normal
hi! link shLoop Keyword
hi! link shCommandSub Keyword
hi! link shSet shStatement
hi! link shFunctionTwo shStatement
hi! link shCtrlSeq String
hi! link shSpecial String
hi! link shCommandSub Normal
hi! link shDerefSpecial Normal
hi! link shOperator Normal

" help
hi! link helpHyperTextJump Number
