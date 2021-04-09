" This Source Code Form is subject to the terms of the Mozilla Public
" License, v. 2.0. If a copy of the MPL was not distributed with this
" file, You can obtain one at https://mozilla.org/MPL/2.0/.

if exists("g:darcula")
  finish
endif
let g:darcula = 1
highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name='darcula'

let s:p={
      \ 'null': ['NONE', 'NONE'],
      \ 'bg': ['#2B2B2B', 235],
      \ 'fg': ['#A9B7C6', 145],
      \ 'cursor': ['#BBBBBB', 250],
      \ 'identifierUnderCaret': ['#344134', 237],
      \ 'identifierUnderCaretWrite': ['#40332B', 58],
      \ 'gutter': ['#313335', 236],
      \ 'selection': ['#214283', 24],
      \ 'cursorLine': ['#323232', 236],
      \ 'cursorLineNr': ['#A4A3A3', 248],
      \ 'errorMsg': ['#CC666E', 174],
      \ 'error': ['#BC3F3C', 131],
      \ 'warning': ['#A9B7C6', 145],
      \ 'muted': ['#606060', 241],
      \ 'link': ['#287BDE', 32],
      \ 'stdOutput': ['#BBBBBB', 250],
      \ 'lineNumber': ['#606366', 241],
      \ 'matchBraceFg': ['#FFEF28', 220],
      \ 'matchBraceBg': ['#3B514D', 59],
      \ 'todo': ['#A8C023', 142],
      \ 'search': ['#32593D', 23],
      \ 'incSearch': ['#155221', 22],
      \ 'foldedFg': ['#8C8C8C', 245],
      \ 'foldedBg': ['#3A3A3A', 237],
      \ 'constant': ['#9876AA', 103],
      \ 'keyword': ['#CC7832', 172],
      \ 'comment': ['#808080', 244],
      \ 'docComment': ['#629755', 65],
      \ 'string': ['#6A8759', 101],
      \ 'number': ['#6897BB', 103],
      \ 'delimiter': ['#CC7832', 172],
      \ 'specialComment': ['#8A653B', 95],
      \ 'function': ['#FFC66D', 216],
      \ 'diffAdd': ['#294436', 23],
      \ 'diffText': ['#385570', 60],
      \ 'diffDelete': ['#484A4A', 239],
      \ 'diffChange': ['#303C47', 23],
      \ 'addStripe': ['#384C38', 66],
      \ 'stripeWhiteSpace': ['#4C4638', 59],
      \ 'changeStripe': ['#374752', 60],
      \ 'deleteStripe': ['#656E76', 242],
      \ 'typo': ['#659C6B', 72],
      \ 'metaData': ['#BBB529', 142],
      \ 'macroName': ['#908B25', 100],
      \ 'cDataStructure': ['#B5B6E3', 146],
      \ 'cStructField': ['#9373A5', 103],
      \ 'debug': ['#666D75', 102],
      \ 'codeError': ['#532B2E', 52],
      \ 'codeWarning': ['#52503A', 59],
      \ 'errorStripe': ['#9E2927', 124],
      \ 'warnStripe': ['#BE9117', 136],
      \ 'infoStripe': ['#756D56', 101],
      \ 'hintStripe': ['#6c7176', 242],
      \ 'typeDef': ['#B9BCD1', 146],
      \ 'menu': ['#46484A', 238],
      \ 'menuFg': ['#BBBBBB', 250],
      \ 'menuSel': ['#113A5C', 23],
      \ 'menuSBar': ['#616263', 241],
      \ 'tag': ['#E8BF6A', 180],
      \ 'entity': ['#6D9CBE', 109],
      \ 'htmlAttribute': ['#BABABA', 250],
      \ 'htmlString': ['#A5C261', 143],
      \ 'tsObject': ['#507874', 66],
      \ 'statusLine': ['#3C3F41', 237],
      \ 'statusLineFg': ['#BBBBBB', 250],
      \ 'statusLineNC': ['#787878', 243],
      \ 'tabLineSel': ['#4E5254', 239],
      \ 'shCommand': ['#C57633', 137],
      \ 'templateLanguage': ['#232525', 235],
      \ 'rustMacro': ['#4EADE5', 74],
      \ 'rustLifetime': ['#20999D', 37],
      \ 'duplicateFromServer': ['#5E5339', 59],
      \ 'hintBg': ['#3B3B3B', 237],
      \ 'hintFg': ['#787878', 243],
      \ 'wrapGuide': ['#2F2F2F', 236],
      \ 'UIBorder': ['#616161', 241],
      \ 'UISelection': ['#0D293E', 17],
      \ 'ANSIBlack': ['#FFFFFF', 231],
      \ 'ANSIRed': ['#FF6B68', 210],
      \ 'ANSIGreen': ['#A8C023', 142],
      \ 'ANSIYellow': ['#D6BF55', 179],
      \ 'ANSIBlue': ['#5394EC', 68],
      \ 'ANSIMagenta': ['#AE8ABE', 139],
      \ 'ANSICyan': ['#299999', 37],
      \ 'ANSIGray': ['#999999', 247],
      \ 'ANSIDarkGray': ['#555555', 240],
      \ 'ANSIBrightRed': ['#FF8785', 210],
      \ 'ANSIBrightGreen': ['#A8C023', 142],
      \ 'ANSIBrightYellow': ['#FFFF00', 226],
      \ 'ANSIBrightBlue': ['#7EAEF1', 110],
      \ 'ANSIBrightMagenta': ['#FF99FF', 219],
      \ 'ANSIBrightCyan': ['#6CDADA', 116],
      \ 'ANSIWhite': ['#1F1F1F', 234],
      \ 'UIBlue': ['#3592C4', 67],
      \ 'UIGreen': ['#499C54', 71],
      \ 'UIRed': ['#C75450', 131],
      \ 'UIBrown': ['#93896C', 102]
      \ }

" expose the palette
let darcula#palette=s:p

" helper function
function s:Hi(group, fg, ...)
  " arguments: group, fg, bg, style
  if a:0 >= 1
    let bg=a:1
  else
    let bg=s:p.null
  endif
  if a:0 >= 2 && strlen(a:2)
    let style=a:2
  else
    let style='NONE'
  endif
  let hiList = [
        \ 'hi', a:group,
        \ 'ctermfg=' . a:fg[1],
        \ 'guifg=' . a:fg[0],
        \ 'ctermbg=' . bg[1],
        \ 'guibg=' . bg[0],
        \ 'cterm=' . style,
        \ 'gui=' . style
        \ ]
  execute join(hiList)
endfunction

" expose that function
function darcula#Hi(group, fg, ...)
  if a:0 >= 2
    call s:Hi(a:group, a:fg, a:1, a:2)
  elseif a:0 == 1
    call s:Hi(a:group, a:fg, a:1)
  else
    call s:Hi(a:group, a:fg)
  endif
endfunction

call s:Hi('Normal', s:p.fg, s:p.bg)
call s:Hi('ColorColumn', s:p.null, s:p.wrapGuide)
call s:Hi('Conceal', s:p.muted, s:p.bg)
call s:Hi('Cursor', s:p.cursor)
hi! link lCursor Cursor
hi! link CursorIM Cursor
hi! link CursorColumn CursorLine
call s:Hi('CursorLine', s:p.null, s:p.cursorLine, 'NONE')
call s:Hi('DiffAdd', s:p.null, s:p.diffAdd)
call s:Hi('DiffChange', s:p.null, s:p.diffChange)
call s:Hi('DiffDelete', s:p.null, s:p.diffDelete)
call s:Hi('DiffText', s:p.null, s:p.diffText)
hi! link Directory NormalFg
hi! link EndOfBuffer NonText
call s:Hi('ErrorMsg', s:p.errorMsg)
call s:Hi('Error', s:p.error)
call s:Hi('VertSplit', s:p.muted)
call s:Hi('Folded', s:p.foldedFg, s:p.foldedBg)
hi! link FoldColumn Folded
call s:Hi('SignColumn', s:p.null, s:p.gutter)
call s:Hi('LineNr', s:p.lineNumber, s:p.gutter)
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
call s:Hi('CursorLineNr', s:p.cursorLineNr, s:p.cursorLine)
call s:Hi('MatchParen', s:p.matchBraceFg, s:p.matchBraceBg, 'bold')
call s:Hi('ModeMsg', s:p.stdOutput)
hi! link MoreMsg NormalFg
call s:Hi('NonText', s:p.muted)
call s:Hi('Pmenu', s:p.menuFg, s:p.menu)
call s:Hi('PmenuSel', s:p.menuFg, s:p.menuSel)
call s:Hi('PmenuSbar', s:p.menu, s:p.menu)
call s:Hi('PmenuThumb', s:p.menuSBar, s:p.menuSBar)
hi! link Question NormalFg
hi! link QuickFixLine NormalFg
call s:Hi('Search', s:p.null, s:p.search)
call s:Hi('IncSearch', s:p.null, s:p.incSearch)
hi! link SpecialKey NonText
call s:Hi('SpellBad', s:p.typo, s:p.null, 'underline')
hi! link SpellCap SpellBad
hi! link SpellLocal SpellBad
hi! link SpellRare SpellBad
call s:Hi('StatusLine', s:p.statusLineFg, s:p.statusLine)
call s:Hi('StatusLineNC', s:p.statusLineNC, s:p.statusLine)
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
call s:Hi('TabLine', s:p.statusLineFg, s:p.statusLine)
call s:Hi('TabLineFill', s:p.statusLine, s:p.statusLine)
call s:Hi('TabLineSel', s:p.fg, s:p.tabLineSel)
call s:Hi('Terminal', s:p.stdOutput, s:p.bg)
hi! link Title Special
call s:Hi('Visual', s:p.null, s:p.selection)
hi! link VisualNOS Visual
call s:Hi('WarningMsg', s:p.warning)
hi! link WildMenu PmenuSel
call s:Hi('Comment', s:p.comment)
hi! link Identifier NormalFg
hi! link Type Keyword
call s:Hi('Typedef', s:p.typeDef)
call s:Hi('Todo', s:p.todo, s:p.null, 'italic')
hi! link Special PreProc
call s:Hi('Constant', s:p.constant, s:p.null, 'italic')
call s:Hi('String', s:p.string)
hi! link Character String
call s:Hi('Number', s:p.number)
call s:Hi('Delimiter', s:p.delimiter)
call s:Hi('SpecialComment', s:p.specialComment, s:p.null, 'italic')
hi! link Statement Keyword
call s:Hi('Keyword', s:p.keyword)
call s:Hi('Underlined', s:p.fg, s:p.null, 'underline')
call s:Hi('PreProc', s:p.metaData)
hi! link Tag Keyword
call s:Hi('Debug', s:p.debug, s:p.null, 'italic')
call s:Hi('Function', s:p.function)

" helper groups
call s:Hi('docComment', s:p.docComment, s:p.null, 'italic')
call s:Hi('NormalFg', s:p.fg)
call s:Hi('GitAddStripe', s:p.addStripe, s:p.addStripe)
call s:Hi('GitChangeStripe', s:p.changeStripe, s:p.changeStripe)
call s:Hi('GitDeleteStripe', s:p.deleteStripe, s:p.gutter)
call s:Hi('CodeError', s:p.null, s:p.codeError)
call s:Hi('CodeWarning', s:p.null, s:p.codeWarning)
call s:Hi('CodeInfo', s:p.null, s:p.infoStripe)
call s:Hi('CodeHint', s:p.hintFg, s:p.hintBg)
call s:Hi('ErrorSign', s:p.errorStripe, s:p.gutter)
call s:Hi('WarningSign', s:p.warnStripe, s:p.gutter)
call s:Hi('InfoSign', s:p.infoStripe, s:p.gutter)
call s:Hi('HintSign', s:p.hintStripe, s:p.gutter)
call s:Hi('IdentifierUnderCaret', s:p.null, s:p.identifierUnderCaret)
call s:Hi('IdentifierUnderCaretWrite', s:p.null, s:p.identifierUnderCaretWrite)
call s:Hi('InstanceField', s:p.constant)
call s:Hi('UIDialog', s:p.fg, s:p.statusLine)
call s:Hi('UIBorder', s:p.UIBorder, s:p.statusLine)
call s:Hi('UISelection', s:p.null, s:p.UISelection)

" neovim
if has('nvim')
  " the following code snippet fix an issue with CursorLine hi group
  " see https://github.com/neovim/neovim/issues/9019
  if has('termguicolors') && &termguicolors
    hi CursorLine ctermfg=white
  else
    hi CursorLine guifg=white
  endif
  hi! link NormalFloat Pmenu
  hi! link NormalNC NormalFg
  hi! link MsgArea NormalFg
  hi! link MsgSeparator StatusLine
  hi! link QuickFixLine NormalFg
  hi! link Substitute Search
  " TermCursor
  " TermCursorNC
  hi! link Whitespace NonText
  hi! link healthSuccess IncSearch
  call s:Hi('NvimInternalError', s:p.error, s:p.error)
  call s:Hi('RedrawDebugClear', s:p.fg, s:p.duplicateFromServer)
  call s:Hi('RedrawDebugComposed', s:p.fg, s:p.search)
  call s:Hi('RedrawDebugRecompose', s:p.fg, s:p.codeError)
  " Terminal colors
  let g:terminal_color_0 = s:p.ANSIBlack[0]
  let g:terminal_color_1 = s:p.ANSIRed[0]
  let g:terminal_color_2 = s:p.ANSIGreen[0]
  let g:terminal_color_3 = s:p.ANSIYellow[0]
  let g:terminal_color_4 = s:p.ANSIBlue[0]
  let g:terminal_color_5 = s:p.ANSIMagenta[0]
  let g:terminal_color_6 = s:p.ANSICyan[0]
  let g:terminal_color_7 = s:p.ANSIGray[0]
  let g:terminal_color_8 = s:p.ANSIDarkGray[0]
  let g:terminal_color_9 = s:p.ANSIBrightRed[0]
  let g:terminal_color_10 = s:p.ANSIBrightGreen[0]
  let g:terminal_color_11 = s:p.ANSIBrightYellow[0]
  let g:terminal_color_12 = s:p.ANSIBrightBlue[0]
  let g:terminal_color_13 = s:p.ANSIBrightMagenta[0]
  let g:terminal_color_14 = s:p.ANSIBrightCyan[0]
  let g:terminal_color_15 = s:p.ANSIWhite[0]

  " nvim-treesitter
  hi! link TSAnnotation PreProc
  hi! link TSAttribute PreProc
  hi! link TSBoolean Keyword
  hi! link TSCharacter Character
  hi! link TSComment Comment
  hi! link TSConstructor Function
  hi! link TSConditional Keyword
  hi! link TSConstant Constant
  hi! link TSConstBuiltin Keyword
  hi! link TSConstMacro cMacroName
  hi! link TSError codeError
  hi! link TSException Keyword
  hi! link TSField InstanceField
  hi! link TSFloat Number
  hi! link TSFunction Function
  hi! link TSFuncBuiltin Normal
  hi! link TSFuncMacro cMacroName
  hi! link TSInclude Keyword
  hi! link TSKeyword Keyword
  hi! link TSKeywordFunction Keyword
  hi! link TSLabel Normal
  hi! link TSMethod Function
  hi! link TSNamespace cDataStructure
  hi! link TSNone Normal
  hi! link TSNumber Number
  hi! link TSOperator Normal
  hi! link TSParameter Normal
  hi! link TSParameterReference Normal
  hi! link TSProperty TSField
  hi! link TSPunctDelimiter Normal
  hi! link TSPunctBracket Normal
  hi! link TSPunctSpecial Keyword
  hi! link TSRepeat Keyword
  hi! link TSString String
  hi! link TSStringRegex Number
  hi! link TSStringEscape Keyword
  hi! link TSTag htmlTag
  hi! link TSTagDelimiter htmlTag
  hi! link TSText Normal
  call s:Hi('TSStrong', s:p.fg, s:p.null, 'bold')
  call s:Hi('TSEmphasis', s:p.fg, s:p.null, 'italic')
  call s:Hi('TSUnderline', s:p.fg, s:p.null, 'underline')
  call s:Hi('TSStrike', s:p.fg, s:p.null, 'strikethrough')
  call s:Hi('TSTitle', s:p.fg, s:p.null, 'bold,underline')
  hi! link TSLiteral Normal
  hi! link TSURI markdownLinkText
  hi! link TSNote CodeInfo
  hi! link TSWarning CodeWarning
  hi! link TSDanger CodeError
  hi! link TSType Normal
  hi! link TSTypeBuiltin Keyword
  hi! link TSVariable Normal
  hi! link TSVariableBuiltin Keyword

  " LSP
  hi! link LspDiagnosticsDefaultError CodeError
  hi! link LspDiagnosticsDefaultWarning CodeWarning
  hi! link LspDiagnosticsDefaultInformation CodeInfo
  hi! link LspDiagnosticsDefaultHint CodeHint
  hi! link LspDiagnosticsSignError ErrorSign
  hi! link LspDiagnosticsSignWarning WarningSign
  hi! link LspDiagnosticsSignInformation InfoSign
  hi! link LspDiagnosticsSignHint HintSign
  hi! link LspReferenceText IdentifierUnderCaret
  hi! link LspReferenceRead IdentifierUnderCaret
  hi! link LspReferenceWrite IdentifierUnderCaretWrite
  hi! link LspDiagnosticsUnderlineError CodeError
  hi! link LspDiagnosticsUnderlineWarning CodeWarning
  hi! link LspDiagnosticsUnderlineInformation CodeInfo
  hi! link LspDiagnosticsUnderlineHint CodeHint
  hi! link LspDiagnosticsFloatingError NormalFloat
  hi! link LspDiagnosticsFloatingWarning NormalFloat
  hi! link LspDiagnosticsFloatingInformation NormalFloat
  hi! link LspDiagnosticsFloatingHint NormalFloat
endif

" Vim terminal colors (for :terminal)
if !has('nvim')
  let g:terminal_ansi_colors=[
        \ s:p.ANSIBlack[0],
        \ s:p.ANSIRed[0],
        \ s:p.ANSIGreen[0],
        \ s:p.ANSIYellow[0],
        \ s:p.ANSIBlue[0],
        \ s:p.ANSIMagenta[0],
        \ s:p.ANSICyan[0],
        \ s:p.ANSIGray[0],
        \ s:p.ANSIDarkGray[0],
        \ s:p.ANSIBrightRed[0],
        \ s:p.ANSIBrightGreen[0],
        \ s:p.ANSIBrightYellow[0],
        \ s:p.ANSIBrightBlue[0],
        \ s:p.ANSIBrightMagenta[0],
        \ s:p.ANSIBrightCyan[0],
        \ s:p.ANSIWhite[0]
        \ ]
endif

" C/C++
call s:Hi('cMacroName', s:p.macroName)
hi! link cConstant cMacroName
hi! link cPreInclude String
hi! link cPreProcRegion NormalFg
hi! link cUserLabel NormalFg
hi! link cDataStructureKeyword Keyword
call s:Hi('cDataStructure', s:p.cDataStructure)
hi! link cFunction Function
hi! link cppDestructor cFunction
hi! link cSemicolon Keyword
hi! link cComma Keyword
call s:Hi('cppAfterColon', s:p.cStructField)
hi! link cppBeforeColon cDataStructure
call s:Hi('cStructField', s:p.cStructField)
hi! link cppNullptr Keyword
hi! link cppTemplate Keyword
hi! link cTypedef Keyword
hi! link cppTypeName Keyword
hi! link cSpecial Keyword
hi! link cEnum Keyword
call s:Hi('cSomeMacro', s:p.macroName)

" Rust
call s:Hi('rustDeriveTrait', s:p.metaData)
hi! link rustQuestionMark Keyword
hi! link rustComma Keyword
hi! link rustSemicolon Keyword
hi! link rustOperator NormalFg
call s:Hi('rustCommentLineDoc', s:p.docComment, s:p.null, 'italic')
call s:Hi('rustMacro', s:p.rustMacro)
hi! link rustAssert rustMacro
hi! link rustPanic rustMacro
hi! link rustEscape Keyword
hi! link rustSigil NormalFg
hi! link rustSelf Keyword
call s:Hi('rustLifetime', s:p.rustLifetime, s:p.null, 'italic')
call s:Hi('rustTypeParameter', s:p.rustLifetime)
hi! link rustEnumVariant Constant
hi! link rustModPath NormalFg
hi! link rustModPathSep NormalFg
hi! link rustAs Keyword
hi! link rustConst Constant
hi! link rustVarField InstanceField

" Vim
hi! link vimOption Constant
hi! link vimFunction Function
hi! link vimContinue NonText
hi! link vimParenSep NormalFg
hi! link vimBracket PreProc
hi! link vimOper NormalFg
hi! link vimSep NormalFg
hi! link vimCommentString Comment

" JavaScript
hi! link jsNoise Keyword
hi! link JsImport Keyword
hi! link JsFrom Keyword
hi! link JsOperator NormalFg
hi! link jsArrowFunction NormalFg
hi! link jsFuncArgCommas Delimiter
hi! link jsObjectKey InstanceField
hi! link jsTernaryIfOperator NormalFg
hi! link jsObjectSeparator Keyword
hi! link jsSpreadOperator NormalFg
hi! link jsModuleComma Keyword
hi! link jsClassDefinition NormalFg
hi! link jsSuper Keyword
hi! link jsThis Keyword
hi! link jsObjectProp InstanceField
hi! link jsDestructuringNoise Keyword
hi! link jsClassProperty Function
hi! link jsBooleanTrue Keyword
hi! link jsBooleanFalse Keyword
hi! link jsObjectShorthandProp NormalFg
hi! link jsObjectColon NormalFg
hi! link jsExport Keyword
hi! link jsModuleAs Keyword

" TypeScript
hi! link typescriptBraces NormalFg
hi! link typescriptDocComment docComment
hi! link typescriptDocParam docComment
hi! link typescriptParens NormalFg
hi! link typescriptOpSymbols InstanceField
hi! link typescriptRegexpString Number
hi! link typescriptSpecial Keyword
hi! link typescriptLogicSymbols InstanceField
hi! link typescriptExceptions Keyword
call s:Hi('typescriptDocTags', s:p.docComment, s:p.null, 'bold,italic,underline')
call s:Hi('typescriptGlobalObjects', s:p.tsObject)

" JSON
hi! link jsonBraces NormalFg
hi! link jsonKeyword InstanceField
hi! link jsonNoise Keyword
hi! link jsonKeywordMatch Keyword
hi! link jsonBoolean Keyword
hi! link jsonNull Keyword
hi! link jsonEscape Keyword
hi! link jsonStringMatch String

" XML
call s:Hi('xmlTagName', s:p.tag)
hi! link xmlEndTag xmlTagName
hi! link xmlAttrib NormalFg
hi! link xmlProcessingDelim xmlTagName
hi! link xmlDocTypeKeyword xmlTagName
hi! link xmlComment Comment
hi! link xmlCommentStart xmlComment
hi! link xmlCommentPart xmlComment
call s:Hi('xmlEntity', s:p.entity)
hi! link xmlEntityPunct xmlEntity
hi! link xmlCdata NormalFg
hi! link xmlCdataCdata xmlCdata
hi! link xmlCdataStart xmlCdata
hi! link xmlCdataEnd xmlCdata
hi! link xmlNamespace InstanceField
hi! link xmlAttribPunct NormalFg
hi! link xmlEqual xmlString

" GraphQL
hi! link graphqlTaggedTemplate NormalFg

" YAML
hi! link yamlDocumentStart NormalFg
hi! link yamlDocumentEnd NormalFg
hi! link yamlComment docComment
hi! link yamlBlockMappingKey Keyword
hi! link yamlKeyValueDelimiter NormalFg
hi! link yamlInteger NormalFg
hi! link yamlFloat NormalFg
hi! link yamlBlockCollectionItemStart NormalFg
call s:Hi('yamlAnchor', s:p.tag)
hi! link yamlAlias yamlAnchor
hi! link yamlBool NormalFg
hi! link yamlNodeTag NormalFg
hi! link yamlNull NormalFg

" Markdown
hi! link markdownH1 Constant
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownHeadingRule markdownH1
hi! link markdownHeadingDelimiter markdownH1
call s:Hi('markdownAutomaticLink', s:p.link, s:p.null, 'underline')
hi! link markdownBlockquote String
hi! link markdownBoldDelimiter Keyword
hi! link markdownBold NormalFg
hi! link markdownItalicDelimiter Keyword
hi! link markdownItalic NormalFg
hi! link markdownCode Comment
hi! link markdownCodeDelimiter markdownCode
hi! link markdownCodeBlock markdownCode
call s:Hi('markdownLinkText', s:p.link, s:p.null, 'underline')
hi! link markdownLinkTextDelimiter markdownLinkText
hi! link markdownUrlDelimiter markdownLinkText
call s:Hi('markdownUrl', s:p.function, s:p.null, 'italic')
hi! link markdownIdDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownIdDeclaration Keyword
hi! link markdownLinkDelimiter NormalFg
hi! link markdownUrlTitleDelimiter Comment
hi! link markdownRule Comment

" HTML
let html_no_rendering=1
call s:Hi('htmlTag', s:p.tag)
hi! link htmlTagName htmlTag
hi! link htmlEndTag htmlTag
call s:Hi('htmlArg', s:p.htmlAttribute)
call s:Hi('htmlString', s:p.htmlString)
hi! link htmlValue htmlString
hi! link htmlComment Comment
hi! link htmlCommentError Comment
hi! link htmlCommentPart Comment
call s:Hi('htmlSpecialChar', s:p.entity)
hi! link htmlSpecialTagName htmlTag

" CSS
hi! link cssAtKeyword Keyword
hi! link cssBraces NormalFg
hi! link cssAttributeSelector htmlTag
hi! link cssSelectorOp NormalFg
hi! link cssClassName htmlTag
hi! link cssNoise Keyword
hi! link cssAttrComma Keyword
hi! link cssFunctionComma Keyword
hi! link cssMediaComma Keyword
hi! link cssComment Comment
hi! link cssClassNameDot NormalFg
call s:Hi('cssFunctionName', s:p.tag)
call s:Hi('cssColor', s:p.number)
call s:Hi('cssIdentifier', s:p.tag)
call s:Hi('cssPseudoClassId', s:p.tag)
call s:Hi('cssImportant', s:p.keyword, s:p.null, 'bold')
call s:Hi('cssProp', s:p.htmlAttribute)
call s:Hi('cssAttr', s:p.htmlString)
call s:Hi('cssAttrRegion', s:p.htmlString)
call s:Hi('cssURL', s:p.link)

" Shell Script
call s:Hi('sheBang', s:p.fg, s:p.null, 'bold')
hi! link shRange NormalFg
hi! link shFunctionKey Keyword
call s:Hi('shStatement', s:p.shCommand)
hi! link bashStatement shStatement
hi! link shDerefVar NormalFg
hi! link shQuote String
call s:Hi('shHereDoc', s:p.null, s:p.templateLanguage)
call s:Hi('shRedir', s:p.fg, s:p.null, 'bold')
hi! link shDerefSimple NormalFg
hi! link shCommandSubBQ InstanceField
hi! link shOption NormalFg
hi! link shCmdSubRegion shStatement
hi! link shCommandSub NormalFg
hi! link shLoop Keyword
hi! link shCommandSub Keyword
hi! link shSet shStatement
hi! link shFunctionTwo shStatement
hi! link shCtrlSeq String
hi! link shSpecial String
hi! link shCommandSub NormalFg
hi! link shDerefSpecial NormalFg
hi! link shOperator NormalFg

" help
hi! link helpHyperTextJump Number
