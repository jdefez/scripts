# Nvim sessions
export vim_sessions=$HOME/.config/nvim/sessions

_vim_sessions() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(ls ${vim_sessions})" -- $cur) )
}

complete -F _vim_sessions vs

vs() {
    # open nvim and source session Session.vim or parameter1.vim

    mkdir -p ${vim_sessions}

    # use Session.vim if no param given
    if [ "$#" -ne 1 ]; then
        SESSION_NAME=session
    else
        SESSION_NAME=$1
    fi

    SESSION_PATH=${vim_sessions}/$SESSION_NAME

    if [[ ! -f $SESSION_PATH ]]; then
        # make session file if it does not exist
        nvim -c "Obsession $SESSION_PATH"
    else
        # source session file if it exists
        nvim -S $SESSION_PATH
    fi
}
