{ ... }:
{
  programs = {
    zoxide.enable = true;
    fish = {

      enable = true;
      interactiveShellInit = # fish
        ''
          				set fish_greeting
          				if status --is-interactive
          						source ("starship" init fish --print-full-init | psub)
          				end
          				fish_vi_key_bindings
          			'';
      functions = {
        getVitePID = # fish
          ''
            pgrep -a node | rg internship | sed 's/ .*//' $argv
          '';
        tmux_fzf = # fish
          ''
            set prev (pwd)
            zi
            set name (basename (pwd))
            if test "$name" != mhiri
                if tmux has-session -t $name
                    tmux attach -t $name
                else
                    tmux new -s (basename (pwd))
                end
                cd $prev
            end
            starship prompt
          '';
      };
			shellAbbrs = {
				t = "tmux";
				tks = "tmux kill-session";
				tls = "tmux list-sessions";
				tlc = "tmux list-clients";
				tns = "tmux new -s";

				dc = "docker-compose";
				dcp = "docker-compose --profile";
				dcf = "docker-compose --file";

				lzd = "lazydocker";
				lg = "lazygit";

				v = "nvim";
			};
    };
    starship = {
      enable = true;
      settings = {
        username = {
          style_user = "blue bold";
          style_root = "red bold";
          format = "[$user]($style) ";
          disabled = false;
          show_always = true;
        };
        hostname = {
          ssh_only = true;
          format = "on [$hostname](bold red) ";
          trim_at = ".local";
          disabled = false;
        };
      };
    };
  };
}
