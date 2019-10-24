syn clear cppStructure
syn keyword cppNullptr nullptr
syn keyword cppTemplate template
syn keyword cppTypeName typename
syn match cppDestructor "\~\_s\{-}\<\I\i*\>\ze\_s\{-}("
syn match cppAfterColon "::\zs\_s\{-}\<\I\i*\>\(\_s\{-}(\|\_s\{-}::\)\@!"
syn match cppBeforeColon "\<\I\i*\>\_s\{-}\ze::"

