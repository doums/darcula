## darcula

![darcula](https://image.petitmur.beer/darcula.png)

:smiling_imp: A [Vim](https://www.vim.org/) color scheme reproduction of the official [JetBrains](https://www.jetbrains.com/) IDE Darcula theme

#### install
Follow the traditional way of your plugin manager

For example with [vim-plug](https://github.com/junegunn/vim-plug) add this in `.vimrc`
```
Plug 'doums/darcula'
```

then run in vim
```
:source $MYVIMRC
:PlugInstall
```

#### usage
put this in your `.vimrc`
```
colorscheme darcula
```

if you use [lightline](https://github.com/itchyny/lightline.vim)
```
let g:lightline = { 'colorscheme': 'darculaOriginal' }
```
NOTE: lightline already provides a "darcula" color scheme that I find simply bad. I strongly recommend to use mine instead (using `darculaOriginal` instead of `darcula` in the above config).

#### need to change some highlight groups?
the color palette is exposed through the dictionary `darcula#palette`
```
echo darcula#palette.comment
```

#### todo
256color palette support

#### credits
[JetBrains](https://www.jetbrains.com/) for the original and awsome Darcula color scheme!

#### license
Mozilla Public License 2.0

