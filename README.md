Personal dotfile direcotory.

Use [thoughtbot/rcm](https://github.com/thoughtbot/rcm) for easy dotfile management:

Clone into $HOME:
```
git clone git@github.com:denisalevi/.dotfiles.git
```

Create symlinks for all not host-specific dotfiles in `~/.dotfiles`:
```
rcup -v
```

Create symlink for specific dotfiles (e.g. `.rcrc`):
```
rcup -v rcrc
```

Add already existing dotfile to `~/.dotfiles` directory (eg. `.rcrc`)
```
mkrc -v .rcrc
```

Add dotfile as host-specific dotfile to `~/dotfiles` directorye:
```
mkrc -o .rcrc
```
