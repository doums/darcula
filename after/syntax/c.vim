" This Source Code Form is subject to the terms of the Mozilla Public
" License, v. 2.0. If a copy of the MPL was not distributed with this
" file, You can obtain one at https://mozilla.org/MPL/2.0/.

syn clear cInclude cIncluded cPreCondit cPreProc cDefine cPreConditMatch
syn keyword cPreProc define undef error if elif else endif include import using ifdef ifndef line pragma contained
syn region cPreProcRegion oneline contains=ALLBUT,cFunction,cCommentStartError,@cPreProcGroup,@Spell matchgroup=PreProc keepend start="^\s\{-}#" end="$"
syn match cMacroName "\(\<\(ifdef\|ifndef\|define\|undef\)\>\s\{-}\)\@42<=\<\I\i*\>" contained
syn match cPreInclude +\(\<include\>\s\{-}\)\@42<=["<][^<>"]*[>"]+ contained
syn clear cStructure
syn match cDataStructure "\<\(struct\|class\|enum\_s\{-}class\|enum\|union\|namespace\)\>\_s\{-}\zs\<\I\i*\>" contained
syn match cDataStructureKeyword contains=cDataStructure "\<\(struct\|class\|enum\_s\{-}class\|enum\|union\|namespace\)\>\_s\{-}\<\I\i*\>"
syn match cFunction "\(\(\.\|->\|[(){};=!,]\|\<new\>.*\|&&\)\_s\{-}\)\@42<!\<\I\i*\>\ze\_s\{-}("
syn match cSemicolon ";"
syn match cComma ","
syn match cStructField "\.\zs\_s\{-}\<\I\i*\>"
syn keyword cTypedef typedef
syn keyword cSomeMacro NULL FALSE TRUE
syn match cEnum "\<enum\>\ze\_s\{-}{"
