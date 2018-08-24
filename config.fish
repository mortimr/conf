set -gx GOPATH $HOME/go
set -gx PATH $PATH /Users/irotaru/Library/Python/2.7/bin $GOPATH/bin $HOME/.cargo/bin 
set -gx LC_ALL en_US.UTF-8

source ~/.config/fish/nvm-wrapper/nvm.fish

if not command -s node > /dev/null
  nvm use 8
end
