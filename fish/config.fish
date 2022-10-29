if status is-interactive
    set fish_greeting
end
starship init fish | source
alias neofetch='neofetch --ascii /home/gagan/.config/neofetch/arch'

# opam configuration
source /home/gagan/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
