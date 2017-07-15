plug-open.vim
===

Augments [vim-plug](https://github.com/junegunn/vim-plug) to easily interact with the source of installed plugins.

Usage
---

plug-open defines `PlugOpen` and `PlugOpenRemote` and `PlugHome` commands.

```viml
" Opens vim in the rails-vim directory (e.g. ~/.vim/plugged/rails-vim)
:PlugOpen rails-vim

" Opens the uri specified for the plugin (if it has one) in your browser of choice (via [`netrw#BrowseX`](https://github.com/eiginn/netrw/blob/master/autoload/netrw.vim#L5035))
:PlugOpenRemote rails-vim

" Opens your plug_home directory
:PlugHome
```

Both commands support tab completion, so you could, type `PlugOpen r` and hit `<tab>` and get a list of matching plugins.

Requirements
---

- Vim 7.4+ (or Neovim)
- [Vim-plug](https://github.com/junegunn/vim-plug)
