apply:
	git add .
	nix build --show-trace .#darwinConfigurations.Ariss-MacBook-Pro.system
	./result/sw/bin/darwin-rebuild switch --flake .

