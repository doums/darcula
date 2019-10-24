syn clear cPreCondit cPreProc cDefine
syn keyword cPreProc define undef error if elif else endif include import using ifdef ifndef line pragma contained
syn region cPreProcRegion oneline contains=ALL matchgroup=PreProc keepend start="^\s\{-}#\s\{-}" end="$"
syn match cMacroName "\(^\s\{-}#\s\{-}\<\(ifdef\|ifndef\|define\|undef\)\>\)\@<=\s\{-}\<\I\i*" contained
syn clear cStructure
syn match cDataStructure "\<\(typedef\_s\{-}struct\|struct\|class\|enum\_s\{-}class\|enum\|union\|namespace\)\>\_s\{-}\zs\<\I\i*\>" contained
syn match cDataStructureKeyword contains=cDataStructure "^\s\{-}\<\(typedef\_s\{-}struct\|struct\|class\|enum\_s\{-}class\|enum\|union\|namespace\)\>\_s\{-}\<\I\i*\>"
syn match cFunction "\(\(\.\|->\)\_s\{-}\)\@<!\<\I\i*\>\ze\_s\{-}(\_.*)"
syn match cppDestructor "\~\_s\{-}\<\I\i*\>\ze\_s\{-}(\_.*)"
syn match cSemicolon ";"
syn match cComma ","
syn match cppAfterColon "::\zs\_s\{-}\<\I\i*\>\(\_s\{-}(\_.*)\|\_s\{-}::\)\@!"
syn match cppBeforeColon "\<\I\i*\>\_s\{-}\ze::"
