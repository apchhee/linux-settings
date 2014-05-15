# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/scripts" ] ; then
    PATH="$HOME/scripts:$PATH"
fi


if [[ -z $MY_SSH_SOCK ]]; then
    export MY_SSH_SOCK="$HOME/.ssh-agent-$USER-screen"
    test $SSH_AUTH_SOCK && rm -f $MY_SSH_SOCK && ln -sf $SSH_AUTH_SOCK $MY_SSH_SOCK
fi

export SVN_EDITOR=vim
export PAGER=less
export LANG=en_US.UTF-8
