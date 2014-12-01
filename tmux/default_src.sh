tmx () {
  # Check to see if we already have a default session running.
  tmux has-session -t default

  if [[ $? == 1 ]]; then
    # Create and name the default session and window.
    tmux new-session -d -s default -n local

    # Create and name additional windows.
    tmux new-window -t default -n vagrant
    tmux new-window -t default # Misc. window. Not named to show running process.
    tmux new-window -t default -n logs

    # Create any splits we want.
    tmux split-window -t default:logs -p 50

    # Set up all our window/pane defaults.
    tmux send-keys -t default:local "cd ~/development/sites" enter
    tmux send-keys -t default:vagrant "cd ~/development/vagrant; ssh-add; ssh vagrant" enter
    tmux send-keys -t default:2 "cd ~" enter
    tmux send-keys -t default:logs.0 "ssh vagrant -t 'sudo tail -f /var/log/httpd/error_log'" enter

    # Freshen up all our windows.
    tmux send-keys -t default:local "clear" enter
    tmux send-keys -t default:vagrant "clear" enter
    tmux send-keys -t default:2 "clear" enter
  fi

  # Whether we created it or not, attach to the default session.
  tmux attach -t default:local
}
