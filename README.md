My dotfiles are currently managed according to [this Hacker News post](https://news.ycombinator.com/item?id=11070797).

To create a new dotfiles repo:
```
git init --bare $HOME/.dotfiles
# This alias is copied into my fish config.
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config status.showUntrackedFiles no
```

To clone the dotfiles onto a new machine:
```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/terrybrashaw/dotfiles $HOME/.dotfiles-tmp
cp ~/.dotfiles-tmp/.gitmodules ~
rm -r ~/.dotfiles-tmp/
```
