apply:
	git add .
	nix build .#darwinConfigurations.Ariss-MacBook-Pro.system
	./result/sw/bin/darwin-rebuild switch --flake .

