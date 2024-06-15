{ pkgs, ... }: {
  home.packages = with pkgs; [
    awscli2
    aws-sam-cli
  ];
}
