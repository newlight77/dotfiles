#############################################
# github.com/newlight77/bash_custom

if [ -f $HOME/.bash_custom/profile/.bashrc_natelandau ]; then
    source $HOME/.bash_custom/profile/.bashrc_natelandau
fi

if [ -f $HOME/.bash_custom/profile/.bashrc_alias ]; then
    source $HOME/.bash_custom/profile/.bashrc_alias
fi

if [ -f $HOME/.bash_custom/profile/.bashrc_ps12 ]; then
    source $HOME/.bash_custom/profile/.bashrc_ps12
fi

if [ -f $HOME/.bash_custom/profile/.bashrc_vars ]; then
    source $HOME/.bash_custom/profile/.bashrc_vars
fi

# if [ -f $HOME/.bash_custom/profile/.bashrc_vars-* ]; then
#     source $HOME/.bash_custom/profile/.bashrc_vars-*
# fi

if [ -f $HOME/.bash_custom/profile/bashrc_docker_cleanup ]; then
    source $HOME/.bash_custom/profile/.bashrc_docker_cleanup
fi

if [ -f $HOME/.bash_custom/profile/.poetry.env ]; then
    source $HOME/.bash_custom/profile/.poetry.env
fi

if [ -f $HOME/.bash_custom/profile/.profile ]; then
    source $HOME/.bash_custom/profile/.profile
fi

# github.com/newlight77/bash_custom
#############################################
