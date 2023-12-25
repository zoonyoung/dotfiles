if status is-interactive
    # Commands to run in interactive sessions can go here
end
if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end

alias vim=nvim
alias vi=nvim
