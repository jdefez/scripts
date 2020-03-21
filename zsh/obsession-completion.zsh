export vim_sessions=$HOME/.config/nvim/sessions

compdef '_files -W ${vim_sessions}' vs

vs() {
  mkdir -p ${vim_sessions}

  # use session.vim if no param given
  if [ "$#" -ne 1 ]; then
    SESSION_NAME=session.vim
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

