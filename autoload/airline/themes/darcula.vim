" MIT License. Copyright (c) 2013-2020 Bailey Ling et al.
" vim: et ts=2 sts=2 sw=2 tw=80

scriptencoding utf-8
let g:airline#themes#darcula#palette = {}
" The darcula.vim theme:
let s:airline_a_normal   = [ darcula#palette.statusLineFg[0], darcula#palette.tabLineSel[0],
                           \ darcula#palette.statusLineFg[1], darcula#palette.tabLineSel[1] ]
let s:airline_b_normal   = [ darcula#palette.statusLineFg[0], darcula#palette.foldedBg[0],
                           \ darcula#palette.statusLineFg[1], darcula#palette.foldedBg[1] ]
let s:airline_c_normal   = [ darcula#palette.statusLineFg[0], darcula#palette.statusLine[0],
                           \ darcula#palette.statusLineFg[1], darcula#palette.statusLine[1], 'NONE' ]
let g:airline#themes#darcula#palette.normal = airline#themes#generate_color_map(s:airline_a_normal, s:airline_b_normal, s:airline_c_normal)

let g:airline#themes#darcula#palette.normal_modified =  {
      \ 'airline_c': [ darcula#palette.statusLineFg[0], darcula#palette.statusLine[0],
      \                darcula#palette.statusLineFg[1], darcula#palette.statusLine[1], 'italic'] ,
      \ }


let s:airline_a_insert   = [ darcula#palette.statusLineFg[0], darcula#palette.addStripe[0],
                           \ darcula#palette.statusLineFg[1], darcula#palette.addStripe[1] ]
let s:airline_b_insert   = copy(s:airline_b_normal)
let s:airline_c_insert   = copy(s:airline_c_normal)
let g:airline#themes#darcula#palette.insert = airline#themes#generate_color_map(s:airline_a_insert, s:airline_b_insert, s:airline_c_insert)

let g:airline#themes#darcula#palette.insert_modified =  {
      \ 'airline_c': [ darcula#palette.statusLineFg[0], darcula#palette.statusLine[0],
      \                darcula#palette.statusLineFg[1], darcula#palette.statusLine[1], 'italic'] ,
      \ }

let g:airline#themes#darcula#palette.insert_paste = {
      \ 'airline_a': [ darcula#palette.statusLine[0], darcula#palette.keyword[0],
      \                darcula#palette.statusLine[1], darcula#palette.keyword[1], ''] ,
      \ }

let g:airline#themes#darcula#palette.replace = copy(g:airline#themes#darcula#palette.insert)
let g:airline#themes#darcula#palette.replace.airline_a = [darcula#palette.bg[0], darcula#palette.UIRed[0],
     \                                                    darcula#palette.bg[1], darcula#palette.UIRed[1], '']
let g:airline#themes#darcula#palette.replace.airline_z = copy(g:airline#themes#darcula#palette.replace.airline_a)
let g:airline#themes#darcula#palette.replace_modified = g:airline#themes#darcula#palette.insert_modified


let s:airline_a_visual = [ darcula#palette.fg[0], darcula#palette.selection[0],
                         \ darcula#palette.fg[1], darcula#palette.selection[1] ]
let s:airline_b_visual = copy(s:airline_b_normal)
let s:airline_c_visual = copy(s:airline_c_normal)
let g:airline#themes#darcula#palette.visual = airline#themes#generate_color_map(s:airline_a_visual, s:airline_b_visual, s:airline_c_visual)
let g:airline#themes#darcula#palette.visual_modified = copy(g:airline#themes#darcula#palette.normal_modified)

let s:airline_a_inactive = [ darcula#palette.foldedFg[0], darcula#palette.foldedBg[0], darcula#palette.foldedFg[1], darcula#palette.foldedBg[1], '' ]
let s:airline_b_inactive = [ darcula#palette.foldedFg[0], darcula#palette.foldedBg[0], darcula#palette.foldedFg[1], darcula#palette.foldedBg[1], '' ]
let s:airline_c_inactive = [ darcula#palette.foldedFg[0], darcula#palette.foldedBg[0], darcula#palette.foldedFg[1], darcula#palette.foldedBg[1], '' ]
let g:airline#themes#darcula#palette.inactive = airline#themes#generate_color_map(s:airline_a_inactive, s:airline_b_inactive, s:airline_c_inactive)
let g:airline#themes#darcula#palette.inactive_modified = {
      \ 'airline_c': [ darcula#palette.cStructField[0], '', darcula#palette.cStructField[1], '', 'italic' ] ,
      \ }

let s:airline_a_commandline = [ darcula#palette.bg[0], darcula#palette.todo[0], darcula#palette.bg[1], darcula#palette.todo[1] ]
let s:airline_b_commandline = copy(s:airline_b_normal)
let s:airline_c_commandline = copy(s:airline_c_normal)
let g:airline#themes#darcula#palette.commandline = airline#themes#generate_color_map(s:airline_a_commandline, s:airline_b_commandline, s:airline_c_commandline)

let g:airline#themes#darcula#palette.accents = {
      \ 'red': [ darcula#palette.ANSIRed[0], '' ,darcula#palette.ANSIRed[1], ''  ]
      \ }
