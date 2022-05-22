#cat $HOME/.ssh/id_rsa.pub | ssh demo@192.168.1.101 "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >>  ~/.ssh/authorized_keys"

# Example
#ssh-copy-id myserver
