" This Source Code Form is subject to the terms of the Mozilla Public
" License, v. 2.0. If a copy of the MPL was not distributed with this
" file, You can obtain one at https://mozilla.org/MPL/2.0/.

syn match rustComma ","
syn match rustSemicolon ";"
syn match rustTypeParameter "\<\u\>"
syn keyword rustAs as
syn match rustConst "\<\(\u\|_\)\+\(\u\|_\|\d\)\+\>"
syn match rustVarField "\.\_s\{-}\zs\<\I\i*\>\(\_s\{-}(\)\@!"
