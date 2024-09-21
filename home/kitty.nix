{ ... }:
{
	programs.kitty = {
		enable = true;
		settings = {
			font_family = "MonaspaceNe Nerd Font";
			font_dize = "10";
			enable_audio_bell = "no";
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/kitty";
      shell_integration = "enabled";
		};
    keybindings = {
      "ctrl+shift+u" = "scroll_page_up";
      "ctrl+shift+d" = "scroll_page_down";
    };
    shellIntegration = {
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
    extraConfig =
      ''
        # kitty-scrollback.nvim Kitten alias
        action_alias kitty_scrollback_nvim kitten /home/mhiri/.local/share/nvim/lazy/kitty-scrollback.nvim/python/kitty_scrollback_nvim.py

        # Browse scrollback buffer in nvim
        map kitty_mod+h kitty_scrollback_nvim

        # Browse output of the last shell command in nvim
        map kitty_mod+g kitty_scrollback_nvim --config ksb_builtin_last_cmd_output

        # Show clicked command output in nvim
        mouse_map ctrl+shift+right press ungrabbed combine : mouse_select_command_output : kitty_scrollback_nvim --config ksb_builtin_last_visited_cmd_output
      '';
	};
}
