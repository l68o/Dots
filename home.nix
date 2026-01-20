[ config. pkgs, ... }


{
	home-username = "lenny"
	home.homeDirectory = "/home/lenny";
	programs.git.enable = true;
	home.stateVersion = "25.05";
	programs.bash = { 
		enable = true;
		shellAliases ={
			btw = "echo i use nix os btw";

		};
	};
	

}
