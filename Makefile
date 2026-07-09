apply:
	git add .
	nix build --show-trace .#darwinConfigurations.Ariss-MacBook-Pro.system
	sudo ./result/sw/bin/darwin-rebuild switch --flake .

# Deliberate world-upgrade: brew, flake inputs, then re-apply.
upgrade:
	brew update && brew upgrade
	nix flake update
	$(MAKE) apply

