#############################################
# github.com/newlight77/bash_custom

if [ -f ~/.bash_custom/profile/.bashrc_natelandau ]; then
    source ~/.bash_custom/profile/.bashrc_natelandau
fi

if [ -f ~/.bash_custom/profile/.bashrc_alias ]; then
    source ~/.bash_custom/profile/.bashrc_alias
fi

if [ -f ~/.bash_custom/profile/.bashrc_ps12 ]; then
    source ~/.bash_custom/profile/.bashrc_ps12
fi

if [ -f ~/.bash_custom/profile/.profile ]; then
    source ~/.bash_custom/profile/.profile
fi

if [ -f ~/.bash_custom/profile/.docker_cleanup.sh ]; then
    source ~/.bash_custom/profile/.docker_cleanup.sh
fi

if [ -f ~/.bash_custom/profile/.poetry.env ]; then
    source ~/.bash_custom/profile/.poetry.env
fi

if [ -f ~/.bash_custom/profile/.bashrc_vars ]; then
    source ~/.bash_custom/profile/.bashrc_vars
fi

# if [ -f ~/.bash_custom/profile/.bashrc_vars-* ]; then
#     source ~/.bash_custom/profile/.bashrc_vars-*
# fi

# if [ -f ~/.bash_custom/profile/.bashrc_ssh-agent ]; then
#     source ~/.bash_custom/profile/.bashrc_ssh-agent
# fi

# github.com/newlight77/bash_custom
#############################################
