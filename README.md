Personal dotfile direcotory.

Use [thoughtbot/rcm](https://github.com/thoughtbot/rcm) for easy dotfile management:

Clone into $HOME:
```
git clone git@github.com:denisalevi/.dotfiles.git $HOME
```

Create symlinks for all not host-specific dotfiles in `~/.dotfiles`:
```
rcup -v
```

Create symlink for specific dotfile `.mydotfile`:
```
rcup -v mydotfile
```

Add already existing dotfile `.mydotfile` to `~/.dotfiles` directory:
```
mkrc -v .mydotfile
```

Add dotfile `.mydotfile` as host-specific (`-o` flag) dotfile to `~/dotfiles` directorye:
```
mkrc -vo .mydotfile
```
