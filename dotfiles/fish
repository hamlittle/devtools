## Interactive login settings ##################################################
if status is-interactive
    set -gx EDITOR code
    theme_gruvbox dark hard
    fish_vi_key_bindings
end


## PATH stuff ##################################################################
# local
fish_add_path "$HOME/devtools/bin"
fish_add_path "$HOME/devtools/scripts"

# go
fish_add_path "/usr/local/go/bin"
fish_add_path "$HOME/go/bin"

# rust
source "$HOME/.cargo/env.fish"

# other
zoxide init fish | source


## Aliases #####################################################################
alias lgi='lazygit'

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
