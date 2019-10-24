" This Source Code Form is subject to the terms of the Mozilla Public
" License, v. 2.0. If a copy of the MPL was not distributed with this
" file, You can obtain one at https://mozilla.org/MPL/2.0/.

syn clear cppStructure
syn keyword cppNullptr nullptr
syn keyword cppTemplate template
syn keyword cppTypeName typename
syn match cppDestructor "\~\_s\{-}\<\I\i*\>\ze\_s\{-}("
syn match cppAfterColon "::\zs\_s\{-}\<\I\i*\>\(\_s\{-}(\|\_s\{-}::\)\@!"
syn match cppBeforeColon "\<\I\i*\>\_s\{-}\ze::"
