plug-open.vim
===

Easily interact with the sources of your [vim-plug](https://github.com/junegunn/vim-plug) plugins.

Usage
---

plug-open defines `PlugOpen` and `PlugOpenRemote` and `PlugHome` commands:


```viml
" Opens vim in the rails-vim directory (e.g. ~/.vim/plugged/rails-vim)
:PlugOpen rails-vim
" Opens the uri specified for the plugin (if it has one)
:PlugOpenRemote rails-vim
" Opens your plug home directory
:PlugHome
```

Both commands support tab completion, so you could, type `PlugOpen r` and hit `<tab>` and get a list of matching plugins.


Requirements
---

- Vim 7.4+ (or Neovim)
- [Vim-plug](https://github.com/junegunn/vim-plug)
