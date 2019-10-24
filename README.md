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
let g:lightline = { 'colorscheme': 'darcula' }
```
NOTE: lightline already provides a "darcula" color scheme that I find simply bad. Unfortunately, by default this one is used. If you want to use mine instead and I strongly recommend it, just go inside `your_package_manager_path/lightline.vim/autoload/lightline/colorscheme` directory and remove `darcula.vim`.

#### license
Mozilla Public License 2.0

