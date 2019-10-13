" Algorithm is from https://stackoverflow.com/a/41978310/3332676

function! darcula#convert#Hex2Rgb(hex)
    let l:hex = substitute(a:hex, '#', '', '')
    if strlen(l:hex) == 3
        let l:hex = strpart(l:hex, 0, 1) . strpart(l:hex, 0, 1)
            \ . strpart(l:hex, 1, 1) . strpart(l:hex, 1, 1)
            \ . strpart(l:hex, 2, 1) . strpart(l:hex, 2, 1)
    endif

    return {
        \ 'r': str2nr('0x' . strpart(l:hex, 0, 2), 16),
        \ 'g': str2nr('0x' . strpart(l:hex, 2, 2), 16),
        \ 'b': str2nr('0x' . strpart(l:hex, 4, 2), 16),
        \ }
endfunction

function! darcula#convert#V2ci (v)
    if a:v < 48
        return 0
    elseif a:v < 115
        return 1
    endif

    return (a:v - 35) / 40
endfunction

function! darcula#convert#DistSquare(A,B,C, a,b,c)
    return (a:A-a:a)*(a:A-a:a) + (a:B-a:b)*(a:B-a:b) + (a:C-a:c)*(a:C-a:c)
endfunction

function! darcula#convert#Rgb2X256(r, g, b)
    let l:ir = darcula#convert#V2ci(a:r)
    let l:ig = darcula#convert#V2ci(a:g)
    let l:ib = darcula#convert#V2ci(a:b)

    let l:color_index = l:ir * 36 + l:ig * 6 + l:ib
    let l:average = (a:r + a:g + a:b) / 3

    let l:gray_index = v:null
    if l:average > 238
        let l:gray_index = 23
    else
        let l:gray_index = (l:average - 3) / 10
    endif

    let l:i2cv = [0x00, 0x5f, 0x87, 0xaf, 0xd7, 0xff]
    let l:cr = i2cv[l:ir]
    let l:cg = i2cv[l:ig]
    let l:cb = i2cv[l:ib]
    let l:gv = l:gray_index * 10 + 8

    let l:color_err = darcula#convert#DistSquare(l:cr, l:cg, l:cb, a:r, a:g, a:b)
    let l:gray_err = darcula#convert#DistSquare(l:gv, l:gv, l:gv, a:r, a:g, a:b)

    if l:color_err <= l:gray_err
        return l:color_index + 16
    endif

    return l:gray_index + 232
endfunction

function! darcula#convert#Hex2X256(hex)
    if a:hex == 'NONE'
        return a:hex
    endif

    let l:color = darcula#convert#Hex2Rgb(a:hex)
    return darcula#convert#Rgb2X256(l:color['r'], l:color['g'], l:color['b'])
endfunction
