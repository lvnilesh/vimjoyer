{ config, lib, inputs, pkgs, ... }:
{
  imports = [ 
      ./hardware-configuration.nix
      ./main-user.nix
      inputs.home-manager.nixosModules.default
  ];

  main-user.enable = true;
  main-user.userName = "nilesh";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  networking.hostName = "vm";
  networking.networkmanager.enable = true;
  time.timeZone = "America/LosAngeles";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  
  users.users.cloudgenius= {
    isNormalUser = true;
    initialPassword = "cdcd";
    description = "Nilesh";
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
      # firefox
      # thunderbird
    ];
  };

	home-manager = {
		extraSpecialArgs = { inherit inputs;};
		users = {
		  "cloudgenius" = import ./home.nix;
		};
	};
	
  environment.systemPackages = with pkgs; [
    vim
    git
    htop
    btop
    curl
    wget
  ];
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.nix-ld.enable = true;
  programs.nix-ld.package = pkgs.nix-ld-rs;
  services.openssh.enable = true;
  system.stateVersion = "24.11";
}