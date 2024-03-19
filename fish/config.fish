if status is-interactive
    set fish_greeting
end
starship init fish | source
alias neofetch='neofetch --ascii /home/gagan/.config/neofetch/arch'

# opam configuration
source /home/gagan/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $PATH /home/gagan/.ghcup/bin # ghcup-env
fish_add_path /home/gagan/.spicetify

alias soot='java -cp /opt/soot/target/sootclasses-trunk-jar-with-dependencies.jar soot.Main -pp'
