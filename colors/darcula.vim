" This Source Code Form is subject to the terms of the Mozilla Public
" License, v. 2.0. If a copy of the MPL was not distributed with this
" file, You can obtain one at https://mozilla.org/MPL/2.0/.

if exists("g:darcula")
  finish
endif
let g:darcula = 1
set termguicolors
highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name='darcula'

let s:p=#{
      \ bg: '#2B2B2B',
      \ fg: '#A9B7C6',
      \ cursor: '#BBBBBB',
      \ gutter: '#313335',
      \ selection: '#214283',
      \ cursorLine: '#323232',
      \ cursorLineNr: '#A4A3A3',
      \ errorMsg: '#CC666E',
      \ error: '#BC3F3C',
      \ warning: '#A9B7C6',
      \ muted: '#72737A',
      \ link: '#287BDE',
      \ stdOutput: '#BBBBBB',
      \ lineNumber: '#606366',
      \ matchBraceFg: '#FFEF28',
      \ matchBraceBg: '#3B514D',
      \ visual: '#10211E',
      \ todo: '#A8C023',
      \ search: '#32593D',
      \ incSearch: '#155221',
      \ foldedFg: '#8C8C8C',
      \ foldedBg: '#3A3A3A',
      \ constant: '#9876AA',
      \ keyword: '#CC7832',
      \ comment: '#808080',
      \ docComment: '#629755',
      \ string: '#6A8759',
      \ number: '#6897BB',
      \ delimiter: '#CC7832',
      \ specialComment: '#8A653B',
      \ function: '#FFC66D',
      \ diffAdd: '#294436',
      \ diffText: '#385570',
      \ diffDelete: '#484A4A',
      \ diffChange: '#303C47',
      \ addStripe: '#384C38',
      \ stripeWhiteSpace: '#4C4638',
      \ changeStripe: '#374752',
      \ deleteStripe: '#656E76',
      \ typo: '#659C6B',
      \ metaData: '#BBB529',
      \ macroName: '#908B25',
      \ cDataStructure: '#B5B6E3',
      \ cStructField: '#9373A5',
      \ debug: '#666D75',
      \ codeWarning: '#52503A',
      \ errorStripe: '#9E2927',
      \ warnStripe: '#BE9117',
      \ infoStripe: '#756D56',
      \ typeDef: '#B9BCD1',
      \ menu: '#46484A',
      \ menuFg: '#AFB1B3',
      \ menuSel: '#103A5C',
      \ menuSBar: '#616263',
      \ tag: '#E8BF6A',
      \ entity: '#6D9CBE',
      \ htmlAttribute: '#BABABA',
      \ htmlString: '#A5C261',
      \ tsObject: '#507874',
      \ statusLine: '#3C3F41',
      \ statusLineFg: '#AEB0B2',
      \ statusLineNC: '#88898B',
      \ tabLineSel: '#4E5254',
      \ shCommand: '#C57633',
      \ templateLanguage: '#232525',
      \ rustMacro: '#4EADE5',
      \ rustLifetime: '#20999D',
      \ ANSIBlack: '#FFFFFF',
      \ ANSIRed: '#FF6B68',
      \ ANSIGreen: '#A8C023',
      \ ANSIYellow: '#D6BF55',
      \ ANSIBlue: '#5394EC',
      \ ANSIMagenta: '#AE8ABE',
      \ ANSICyan: '#299999',
      \ ANSIGray: '#999999',
      \ ANSIDarkGray: '#555555',
      \ ANSIBrightRed: '#FF8785',
      \ ANSIBrightGreen: '#A8C023',
      \ ANSIBrightYellow: '#FFFF00',
      \ ANSIBrightBlue: '#7EAEF1',
      \ ANSIBrightMagenta: '#FF99FF',
      \ ANSIBrightCyan: '#6CDADA',
      \ ANSIWhite: '#1F1F1F',
      \ UIBlue: '#3591C3',
      \ UIGreen: '#499B54',
      \ UIRed: '#C65450',
      \ }

" expose the palette
let darcula#palette=s:p

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
call s:Hi('ColorColumn', s:p.lineNumber)
hi! link Conceal Normal
call s:Hi('Cursor', s:p.cursor)
hi! link lCursor Cursor
hi! link CursorIM Cursor
hi! link CursorColumn CursorLine
call s:Hi('CursorLine', 'NONE', s:p.cursorLine, 'NONE')
call s:Hi('DiffAdd', 'NONE', s:p.diffAdd)
call s:Hi('DiffChange', 'NONE', s:p.diffChange)
call s:Hi('DiffDelete', 'NONE', s:p.diffDelete)
call s:Hi('DiffText', 'NONE', s:p.diffText)
hi! link Directory Normal
hi! link EndOfBuffer NonText
call s:Hi('ErrorMsg', s:p.errorMsg)
call s:Hi('Error', s:p.error)
call s:Hi('VertSplit', s:p.muted)
call s:Hi('Folded', s:p.foldedFg, s:p.foldedBg)
hi! link FoldColumn Folded
call s:Hi('SignColumn', 'NONE', s:p.gutter)
call s:Hi('LineNr', s:p.lineNumber, s:p.gutter)
call s:Hi('CursorLineNr', s:p.cursorLineNr, s:p.cursorLine)
call s:Hi('MatchParen', s:p.matchBraceFg, s:p.matchBraceBg, 'bold')
call s:Hi('ModeMsg', s:p.stdOutput)
hi! link MoreMsg Normal
call s:Hi('NonText', s:p.muted)
call s:Hi('Pmenu', s:p.menuFg, s:p.menu)
call s:Hi('PmenuSel', s:p.menuFg, s:p.menuSel)
call s:Hi('PmenuSbar', s:p.menu, s:p.menu)
call s:Hi('PmenuThumb', s:p.menuSBar, s:p.menuSBar)
hi! link Question Normal
hi! link QuickFixLine Normal
call s:Hi('Search', 'NONE', s:p.search)
call s:Hi('IncSearch', 'NONE', s:p.incSearch)
hi! link SpecialKey NonText
call s:Hi('SpellBad', s:p.typo, 'NONE', 'underline')
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
call s:Hi('Visual', 'NONE', s:p.selection)
hi! link VisualNOS Visual
call s:Hi('WarningMsg', s:p.warning)
hi! link WildMenu Normal
call s:Hi('Comment', s:p.comment)
hi! link Identifier Normal
hi! link Type Keyword
call s:Hi('Typedef', s:p.typeDef, s:p.bg)
call s:Hi('Todo', s:p.todo, s:p.bg, 'italic')
hi! link Special PreProc
call s:Hi('Constant', s:p.constant)
call s:Hi('String', s:p.string)
hi! link Character String
call s:Hi('Number', s:p.number)
call s:Hi('Delimiter', s:p.delimiter)
call s:Hi('SpecialComment', s:p.specialComment, 'NONE', 'italic')
hi! link Statement Keyword
call s:Hi('Keyword', s:p.keyword)
call s:Hi('Underlined', s:p.fg, s:p.bg, 'underline')
call s:Hi('PreProc', s:p.metaData)
hi! link Tag Keyword
call s:Hi('Debug', s:p.debug, 'NONE', 'italic')
call s:Hi('Function', s:p.function)

" helper groups
call s:Hi('docComment', s:p.docComment, s:p.bg, 'italic')

" Terminal colors (for :terminal)
let g:terminal_ansi_colors=[
      \ s:p.ANSIBlack,
      \ s:p.ANSIRed,
      \ s:p.ANSIGreen,
      \ s:p.ANSIYellow,
      \ s:p.ANSIBlue,
      \ s:p.ANSIMagenta,
      \ s:p.ANSICyan,
      \ s:p.ANSIGray,
      \ s:p.ANSIDarkGray,
      \ s:p.ANSIBrightRed,
      \ s:p.ANSIBrightGreen,
      \ s:p.ANSIBrightYellow,
      \ s:p.ANSIBrightBlue,
      \ s:p.ANSIBrightMagenta,
      \ s:p.ANSIBrightCyan,
      \ s:p.ANSIWhite
      \ ]

" GitGutter
call s:Hi('GitGutterAdd', s:p.addStripe, s:p.addStripe)
call s:Hi('GitGutterChange', s:p.changeStripe, s:p.changeStripe)
call s:Hi('GitGutterDelete', s:p.deleteStripe, s:p.gutter)
call s:Hi('GitGutterChangeDelete', s:p.stripeWhiteSpace, s:p.stripeWhiteSpace)
if &encoding == 'utf-8'
  let g:gitgutter_sign_removed = '▶'
endif

" ALE
call s:Hi('ALEInfo', 'NONE', 'NONE', 'underline')
call s:Hi('ALEWarning', 'NONE', s:p.codeWarning)
hi! link ALEError Error
call s:Hi('ALEErrorSign', s:p.errorStripe, s:p.gutter)
call s:Hi('ALEWarningSign', s:p.warnStripe, s:p.gutter)
call s:Hi('ALEInfoSign', s:p.infoStripe, s:p.gutter)

" C/C++
call s:Hi('cMacroName', s:p.macroName)
hi! link cConstant cMacroName
hi! link cPreInclude String
hi! link cPreProcRegion Normal
hi! link cUserLabel Normal
hi! link cDataStructureKeyword Keyword
call s:Hi('cDataStructure', s:p.cDataStructure)
call s:Hi('cFunction', s:p.function)
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
hi! link rustOperator Normal
call s:Hi('rustCommentLineDoc', s:p.docComment, s:p.bg, 'italic')
call s:Hi('rustMacro', s:p.rustMacro)
hi! link rustAssert rustMacro
hi! link rustPanic rustMacro
hi! link rustEscape Keyword
hi! link rustSigil Normal
hi! link rustSelf Keyword
call s:Hi('rustLifetime', s:p.rustLifetime, s:p.bg, 'italic')
call s:Hi('rustTypeParameter', s:p.rustLifetime, s:p.bg)
call s:Hi('rustEnumVariant', s:p.constant, s:p.bg, 'italic')
hi! link rustModPath Normal
hi! link rustModPathSep Normal
hi! link rustAs Keyword
hi! link rustConst Keyword
call s:Hi('rustConst', s:p.constant, s:p.bg, 'italic')
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
call s:Hi('typescriptDocTags', s:p.docComment, s:p.bg, 'bold,italic,underline')
call s:Hi('typescriptGlobalObjects', s:p.tsObject)

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
call s:Hi('xmlTagName', s:p.tag)
hi! link xmlEndTag xmlTagName
hi! link xmlAttrib Normal
hi! link xmlProcessingDelim xmlTagName
hi! link xmlDocTypeKeyword xmlTagName
hi! link xmlComment Comment
hi! link xmlCommentStart xmlComment
hi! link xmlCommentPart xmlComment
call s:Hi('xmlEntity', s:p.entity)
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
call s:Hi('yamlAnchor', s:p.tag)
hi! link yamlAlias yamlAnchor
hi! link yamlBool Normal
hi! link yamlNodeTag Normal
hi! link yamlNull Normal

" Markdown
call s:Hi('markdownH1', s:p.constant, 'NONE', 'italic')
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownHeadingRule markdownH1
hi! link markdownHeadingDelimiter markdownH1
call s:Hi('markdownAutomaticLink', s:p.link, 'NONE', 'underline')
hi! link markdownBlockquote String
hi! link markdownBoldDelimiter Keyword
hi! link markdownBold Normal
hi! link markdownItalicDelimiter Keyword
hi! link markdownItalic Normal
hi! link markdownCode Comment
hi! link markdownCodeDelimiter markdownCode
hi! link markdownCodeBlock markdownCode
call s:Hi('markdownLinkText', s:p.link, 'NONE', 'underline')
hi! link markdownLinkTextDelimiter markdownLinkText
hi! link markdownUrlDelimiter markdownLinkText
call s:Hi('markdownUrl', s:p.function, 'NONE', 'italic')
hi! link markdownIdDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownIdDeclaration Keyword
hi! link markdownLinkDelimiter Normal
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
call s:Hi('cssFunctionName', s:p.tag)
call s:Hi('cssColor', s:p.number)
call s:Hi('cssIdentifier', s:p.tag)
call s:Hi('cssPseudoClassId', s:p.tag)
call s:Hi('cssImportant', s:p.keyword, s:p.bg, 'bold')
call s:Hi('cssProp', s:p.htmlAttribute)
call s:Hi('cssAttr', s:p.htmlString)
call s:Hi('cssAttrRegion', s:p.htmlString)
call s:Hi('cssURL', s:p.link)

" Shell Script
call s:Hi('sheBang', s:p.fg, s:p.bg, 'bold')
hi! link shRange Normal
hi! link shFunctionKey Keyword
call s:Hi('shStatement', s:p.shCommand)
hi! link bashStatement shStatement
hi! link shDerefVar Normal
hi! link shQuote String
call s:Hi('shHereDoc', 'NONE', s:p.templateLanguage)
call s:Hi('shRedir', s:p.fg, s:p.bg, 'bold')
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
