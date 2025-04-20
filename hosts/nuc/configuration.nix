{ config, lib, inputs, pkgs, ... }:
{
  imports = [ 
      ./hardware-configuration.nix
      ./main-user.nix
      inputs.home-manager.nixosModules.default
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "vm";
    networkmanager.enable = true;
  };
  
  time.timeZone = "America/LosAngeles";
  i18n.defaultLocale = "en_US.UTF-8";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  
  main-user.enable = true;
  main-user.userName = "cloudgenius";

	home-manager = {
		extraSpecialArgs = { inherit inputs;};
		users = {
		  "cloudgenius" = import ./home.nix;
		};
	};
	
  environment.systemPackages = with pkgs; [
    vim git htop btop curl wget
  ];

  services.openssh.enable = true;

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    nix-ld = {
      enable = true;
      package = pkgs.nix-ld-rs;
    };
  };

  system.stateVersion = "24.11";
}