#
# ~/.bashrc
#

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# makepkg looks up openssl.cnf file in build dir of anaconda... use install dir instead
if [ -f /opt/anaconda/ssl/openssl.cnf ]
then
  export OPENSSL_CONF=/opt/anaconda/ssl/openssl.cnf
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# activate double star wildcard
shopt -s globstar

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
  #eval "`dircolors -b`"
  #eval `dircolors /usr/src/dircolors/dircolors-solarized/dircolors.256dark`
  TERM='xterm-256color'
  eval `dircolors /usr/src/dircolors/dircolors-solarized/dircolors.ansi-dark`
  alias ls='ls --color=auto'
fi

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#xterm-color)
#    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#    ;;
#*)
#    PS1='\u@\h:\w\$ '
#    ;;
#esac

# TODO doesn't work with powerline, check powerline settings for custom promt...
# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]@\[\033[01;35m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#
## If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac
#
#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
# Use system python for Powerline
SYS_PYTHON_SITE=`/usr/bin/python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`
if [ -f $SYS_PYTHON_SITE/powerline/bindings/bash/powerline.sh ]; then
  . $SYS_PYTHON_SITE/powerline/bindings/bash/powerline.sh
  #. ~/.vim/bundle/powerline/powerline/bindings/bash/powerline.sh
fi
#. /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

# this destroys dir colors
#[ -f "/opt/csw/bin/gls" ] && alias ls='/opt/csw/bin/gls --color=auto'
#if [ -f "/opt/csw/bin/gdircolors" ] ; then
# eval "`/opt/csw/bin/gdircolors 2>/dev/null`"
#else
# eval "`dircolors 2>/dev/null`"
#fi

# some more ls aliases
alias ll='ls -al'
alias la='ls -A'
alias l='ls -l'
alias lll='ls -latr'
alias dir='ls --format=vertical'
alias vdir='ls --format=long'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profiles
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi

[ -f ~/.bashrc_$HOSTNAME ] && . ~/.bashrc_$HOSTNAME

# set editing mode to vi
#set -o vi

vman() {
  vim -c "SuperMan $*"

  if [ "$?" != "0" ]; then
    echo "No manual entry for $*"
  fi
}

# if exists, source tmuxinator completion file
[ -f ~/.tmuxinator.bash ] && . ~/.tmuxinator.bash

#export PATH=$PATH:~/.local/bin
# add anaconda to path (without activate env, use system python)
# (for default anaconda root python: set PATH=/opt/ana...:$PATH, but that
# breaks powerline)
#export PATH=$PATH:/opt/anaconda/bin
# set alias to use anaconda root env python
#alias condapython='/opt/anaconda/bin/python'
. /opt/anaconda/etc/profile.d/conda.sh

alias reset_caps="setxkbmap -option 'caps:ctrl_modifier' && xcape -e 'Caps_Lock=Escape'"
alias make_all_non_executabe='for f in **/*; do if [[ -f "$f" && -x "$f" ]]; then chmod -x "$f"; ll "$f"; fi; done'
alias print_ni="lp -d Kyocera_FS-4200DN"
alias print_ni_color="lp -d Lexmark_CS310_Series"
#alias dock_ni="xrandr --output eDP1 --auto --pos 1280x1200 --output DP2-2 --auto --pos 0x700 --output DP2-3 --auto --pos 1280x0"
alias dock_ni="xrandr --output DP2-2 --right-of eDP1 --auto --output DP2-3 --right-of DP2-2 --auto"
alias dock_ni_old="xrandr --output eDP1 --auto --pos 1280x900 --output DP2-2 --auto --pos 0x200 --output DP2-3 --auto --pos 1280x0"
#alias dock_mkp="xrandr --output DP2-1 --primary --pos 1920x540 --mode 2560x1440 --output DP2-2 --pos 4480x0 --rotate left --mode 2560x1440 --output eDP1 --pos 0x1700 --mode 1920x1080"
alias dock_mkp="xrandr --output DP2-2 --primary --pos 1920x540 --mode 2560x1440 --output eDP1 --pos 0x1700 --mode 1920x1080"
alias dock_mkp_rotate="xrandr --output DP2-2 --primary --pos 1920x540 --mode 2560x1440 --rotate left --output eDP1 --pos 0x1700 --mode 1920x1080"
alias dock_mkp_rotate_resolution="xrandr --output DP2-2 --primary --pos 1920x540 --auto --rotate left --output eDP1 --pos 0x1700 --mode 1920x1080"
#alias dock_mkp_old="xrandr --output DP2-1 --primary --pos 1920x540 --mode 2560x1440 --output eDP1 --pos 0x1700 --mode 1920x1080"
#alias dock_home="xrandr --output eDP1 --auto --pos 1280x900 --output DP1 --auto --pos 0x200 --output DP2 --auto --pos 1280x0"

function xrandr_above {
    COMMAND="xrandr --output "$1" --above eDP1 --auto"
    echo $COMMAND
    `$COMMAND`
}

#alias tmux="TERM=screen-256color-bce tmux"
alias lmake='latexmk -pdflatex=xelatex -pdf main.tex'
alias lmakep='latexmk -pdflatex=xelated -pdf -pvc main.tex'
alias lc='latexmk -c'
alias lC='latexmk -C'
alias lpmake='latexmk -pdflatex=xelatex -pdf presentation.tex'
alias jpy='jupyter notebook'
alias tunnelMEROPE='ssh -f -N -T -L 1111:merope:22 -L 2345:merope:2345 denisalevi@alioth.ni.tu-berlin.de'
alias tunnelELNATH='ssh -f -N -T -L 1111:elnath:22 -L 2345:merope:2345 denisalevi@alioth.ni.tu-berlin.de'
alias tunnelMKP='ssh -f -N -L localhost:16006:localhost:6006 mkp'
alias mountantares='sudo sshfs -o allow_other,IdentityFile=~/.ssh/id_rsa denisalevi@antares.ni.tu-berlin.de:/home/denisalevi/ /mnt/antares'
alias mountantares_alioth='sudo sshfs -o allow_other,IdentityFile=~/.ssh/id_rsa denisalevi@alioth.ni.tu-berlin.de:/home/denisalevi/ /mnt/antares'
alias mountantares_no_cache='sudo sshfs -o allow_other,IdentityFile=~/.ssh/id_rsa,cache=no denisalevi@alioth.ni.tu-berlin.de:/home/denisalevi/ /mnt/antares'
alias mountantares_tunnel='sudo sshfs -o allow_other,IdentityFile=~/.ssh/id_rsa,port=1111 denisalevi@localhost:/home/denisalevi/ /mnt/antares'
alias mountmkp='sudo sshfs -o allow_other,IdentityFile=~/.ssh/id_rsa denis@mkp126.cognition.tu-berlin.de:/home/denis/ /mnt/mkp'
alias sync_b2c="rsync -avzhe ssh merope:/home/denisalevi/projects/dev_brian2cuda/brian2cuda_repo/ ~/projects/dev_brian2cuda/brian2cuda_repo/ --delete --exclude 'benchmarks' --exclude 'brian2cuda/tools' --exclude 'examples'"
alias sync_b2c_tunnel="rsync -avzhe ssh meropetunnel:/home/denisalevi/projects/dev_brian2cuda/brian2cuda_repo/ ~/projects/dev_brian2cuda/brian2cuda_repo/ --delete --exclude 'benchmarks' --exclude 'brian2cuda/tools' --exclude 'examples'"
alias sync_tests='rsync -avzhe ssh merope:/home/denisalevi/projects/dev_brian2cuda/python_test_networks/test_brian2_test_suite_tests/*.py ~/projects/dev_brian2cuda/python_test_networks/test_brian2_test_suite_tests/ && rsync -avzhe ssh merope:/home/denisalevi/projects/dev_brian2cuda/python_test_networks/test_feature_tests/*.py ~/projects/dev_brian2cuda/python_test_networks/test_feature_tests/ --delete'
alias sync_tests_tunnel='rsync -avzhe ssh meropetunnel:/home/denisalevi/projects/dev_brian2cuda/python_test_networks/test_brian2_test_suite_tests/*.py ~/projects/dev_brian2cuda/python_test_networks/test_brian2_test_suite_tests/ && rsync -avzhe ssh meropetunnel:/home/denisalevi/projects/dev_brian2cuda/python_test_networks/test_feature_tests/*.py ~/projects/dev_brian2cuda/python_test_networks/test_feature_tests/ --delete'
alias sync_mkp_pwd='scp -r mkp:$PWD/* $PWD'
alias grip_tunnel='ssh -Y -N -f -L localhost:6419:localhost:6419 alioth'
alias grip_tunnel_kill='grip_pid=$(pgrep -f "ssh -Y -N -f -L localhost:6419:localhost:6419 alioth") \
                            && if [ ! -z "$grip_pid" ]; then kill -s 9 $grip_pid; fi'
alias grip_tunnel_reset='grip_tunnel_kill && grip_tunnel'
alias jupyter_tunnel'=ssh -N -f -L localhost:8889:localhost:8889 alioth'
alias fix_caps="python -c 'from ctypes import *; X11 = cdll.LoadLibrary("libX11.so.6"); display = X11.XOpenDisplay(None); X11.XkbLockModifiers(display, c_uint(0x0100), c_uint(2), c_uint(0)); X11.XCloseDisplay(display)'' && source ~/.bash_profile"
#alias bccn_proxy="ssh -D 1234 denis@deighton.bccn-berlin.de"
alias bccn_proxy="ssh -f -N -T -D 3124 denis@deighton.bccn-berlin.de"

alias vim_b2c_mnt='cd /mnt/antares/projects/dev_brian2cuda/brian2cuda_repo \
    && vim -c "set path+=frozen_repos/brian2" \
    brian2cuda/**/*.py brian2cuda/templates/*.cu brian2cuda/brianlib/*.h'
alias vim_b2c='cd ~/projects/dev_brian2cuda/brian2cuda_repo \
    && vim -c "set path+=frozen_repos/brian2" \
    brian2cuda/**/*.py brian2cuda/templates/*.cu brian2cuda/brianlib/*.h'
alias vim_brian='cd \
    ~/projects/dev_brian2cuda/brian2cuda_repo/frozen_repos/brian2 \
    && vim brian2/devices/**/*.py \
    brian2/devices/cpp_standalone/templates/*.cpp \
    brian2/devices/cpp_standalone/brianlib/*.h'
alias py3='conda activate py3'
alias tfa='conda activate tf'
alias touchpadOff='synclient TouchpadOff=1'
alias touchpadOn='synclient TouchpadOff=0'
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
alias dp='dptrp1 --client-id ~/.dptrp1/client_id --key ~/.dptrp1/key'

function dp_to_mendeley {
    if [ "$#" -ne 1 ]; then
        echo "ERROR: dp_to_mendeley takes exactly one argument (file name), got $# instead"
    else
        echo "Uploading $1 ..."
        dp upload "$1" "Document/Mendeley/$1"
        echo "... done"
    fi
}

function dp_del_from_mendeley {
    if [ "$#" -ne 1 ]; then
        echo "ERROR: dp_del_from_mendeley takes exactly one argument (file name), got $# instead"
    else
        echo "Deleting $1 ..."
        dp delete "Document/Mendeley/$1"
        echo "... done"
    fi
}

#alias vim='vim --servername vim'


#stty stop undef # to unmap ctrl-s for vim-ipython

# local custom binaries
#export PATH=$PATH:"/.local/bin"
