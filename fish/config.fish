if status is-interactive
    # Commands to run in interactive sessions can go here
end
if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end

alias vim=nvim
alias vi=nvim

# pnpm
set -gx PNPM_HOME /Users/zoonyoung/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

fish_config theme choose "Rosé Pine"

#tmxu setting
