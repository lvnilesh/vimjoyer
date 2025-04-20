{ lib, config, pkgs, ...}:

let
  cfg = config.main-user;
in
{
  options.main-user = {
    enable = lib.mkEnableOption "enable user module";
    userName = lib.mkOption {
      default = "mainuser";
      description = ''
        username
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      initialPassword = "cdcd";
      description = "main user";
      extraGroups = [ "wheel" ];
      packages = with pkgs; [
        tree
        # firefox
        # thunderbird
      ];
#     shell = pkgs.zsh;
    };
  };
}
