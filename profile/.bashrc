#############################################
# github.com/newlight77/bash_custom

if [ -f ~/.bash_custom/.bashrc_natelandau ]; then
    source ~/.bash_custom/.bashrc_natelandau
fi

if [ -f ~/.bash_custom/.bashrc_alias ]; then
    source ~/.bash_custom/.bashrc_alias
fi

if [ -f ~/.bash_custom/.bashrc_ps12 ]; then
    source ~/.bash_custom/.bashrc_ps12
fi
#
# if [ -f ~/.bash_custom/.bashrc_path ]; then
#     source ~/.bash_custom/.bashrc_path
# fi

if [ -f ~/.bash_custom/.profile ]; then
    source ~/.bash_custom/.profile
fi

if [ -f ~/.bash_custom/.bashrc_vars ]; then
    source ~/.bash_custom/.bashrc_vars
fi

if [ -f ~/.bash_custom/.bashrc_vars-* ]; then
    source ~/.bash_custom/.bashrc_vars-*
fi

if [ -f ~/.bash_custom/.docker_cleanup.sh ]; then
    source ~/.bash_custom/.docker_cleanup.sh
fi

# if [ -f ~/.bash_custom/.bash-git-prompt/gitprompt.sh ]; then
#     source ~/.bash_custom/.bash-git-prompt/gitprompt.sh
# fi
#
# if [ -f ~/.bash_custom/.git-completion.bash ]; then
#     source ~/.bash_custom/.git-completion.bash
# fi
#
# if [ -f ~/.bash_custom/.bash-completion ]; then
#     source ~/.bash_custom/.bash-completion
# fi

if [ -f ~/.bash_custom/.bashrc_ssh-agent ]; then
    source ~/.bash_custom/.bashrc_ssh-agent
fi

if [ -f ~/.bash_custom/.bashrc_bash-it ]; then
    source ~/.bash_custom/.bashrc_bash-it
fi

# Set config variables first
GIT_PROMPT_ONLY_IN_REPO=1

# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status

GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
# GIT_PROMPT_SHOW_UNTRACKED_FILES=all # can be no, normal or all; determines counting of untracked files

# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

# GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
# GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

# as last entry source the gitprompt script
# GIT_PROMPT_THEME=Custom # use custom .git-prompt-colors.sh
# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme

# github.com/newlight77/bash_custom
#############################################
