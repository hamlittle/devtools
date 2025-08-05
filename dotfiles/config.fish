if status is-interactive
    set -gx EDITOR code
    theme_gruvbox dark hard
    fish_vi_key_bindings
end

fish_add_path "$HOME/devtools/bin"
fish_add_path "$HOME/devtools/scripts"

alias lgi='lazygit'

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

source "$HOME/.cargo/env.fish"
zoxide init fish | source
