apply:
	git add .
	nix build --show-trace .#darwinConfigurations.Ariss-MacBook-Pro.system
	sudo ./result/sw/bin/darwin-rebuild switch --flake .

