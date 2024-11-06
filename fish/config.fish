if status is-interactive
    set fish_greeting
end
starship init fish | source
alias neofetch='neofetch --ascii /home/gagan/.config/neofetch/arch'

# opam configuration
# source /home/gagan/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $PATH /home/gagan/.ghcup/bin # ghcup-env
fish_add_path /home/gagan/.spicetify

alias soot='java -cp /opt/soot/target/sootclasses-trunk-jar-with-dependencies.jar soot.Main -pp'

zoxide init --cmd cd fish | source


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/gagan/.opam/opam-init/init.fish' && source '/home/gagan/.opam/opam-init/init.fish' >/dev/null 2>/dev/null; or true
# END opam configuration

# >>> coursier install directory >>>
set -gx PATH "$PATH:/home/gagan/.local/share/coursier/bin"
# <<< coursier install directory <<<
