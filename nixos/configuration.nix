{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/doas.nix
      ./modules/NetworkManager.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Power and bluetooth 
  services.power-profiles-daemon.enable = true;
  hardware.bluetooth.enable = true;
  services.upower.enable = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.

#Enable x11
 services.xserver = {
   enable = false;
    desktopManager = {
	xterm.enable = false;
	xfce = {
	enable = false;
	noDesktop = true;
	enableXfwm = false;

    };
   };
 };

  # Set your time zone.
  time.timeZone = "Asia/Riyadh";
  
  nix.settings.experimental-features = [
     "nix-command"
     "flakes"
  ];

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.logind.lidSwitchExternalPower = "ignore";

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.lenny = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
   };
  
  programs.firefox.enable = false;

# Allow Unfree Software  
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
	neovim
	wget
	git
	chromium
	foot
	wl-clipboard
	grim
	slurp
	alsa-utils
	btop
	nwg-look
	nautilus
	gcc
	clang
	clang-tools
	nodejs
	fd
	ripgrep
	btop
	cava
	fastfetch
	localsend
  	gnomeExtensions.gsconnect
  	gnomeExtensions.blur-my-shell
  	gnomeExtensions.dash-to-dock
	protonup-qt
];
  #Enable gnome keyring
  services.gnome.gnome-keyring.enable = true;
#Enable Flatpak
  services.flatpak.enable = true;
#-------------------------------------------------Gaming
  programs.gamemode.enable = true;

 programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
   localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
 };

#---------------------------------Desktop



services.desktopManager.gnome.enable = true;

  # To disable installing GNOME's suite of applications
  # and only be left with GNOME shell.
  services.gnome.core-apps.enable = true;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];

# Login Manager
   services.displayManager.ly.enable = true;
# Enable niri   
   programs.niri.enable = true;
   xdg.portal.enable = true;


services.avahi = {
  enable = true;
  nssmdns4 = true;
  openFirewall = true;
};

services.printing = {
  enable = true;
  drivers = with pkgs; [
    cups-filters
    cups-browsed
    pkgs.samsung-unified-linux-driver
    pkgs.splix
  ];
};


#Enable noctalia
  services.noctalia-shell.enable = true;

#Enable file manager extras
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  #Enable gnome disks
  programs.gnome-disks.enable = true;
  services.udisks2.enable = true;

  system.stateVersion = "25.11";
}

