{ pkgs, ... }: {
  home.packages = with pkgs; [
    conftest
    kubernetes-helm
    kubectl
    jsonnet-bundler # jb
    go-jsonnet
    kustomize
    open-policy-agent # opa
    pluto
    tanka # tk
    yq-go # mikefarah/yq; nixpkgs `yq` is the python jq wrapper
    jfrog-cli
    terraform
    terraform-docs
    tflint
  ];
}
