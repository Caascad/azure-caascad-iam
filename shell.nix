# Generated by: toolbox make-shell (terraform_0_13.withPlugins (p: with p; [azurerm]))
let
  toolboxSrc = builtins.fromJSON (builtins.readFile ./toolbox.json);
  toolbox = import (builtins.fetchTarball {
    url = "https://github.com/Caascad/toolbox/archive/${toolboxSrc.commit}.tar.gz";
    sha256 = toolboxSrc.sha256;
  }) {};
in with toolbox; pkgs.runCommand "deps" {
  buildInputs = [
    (terraform_0_13.withPlugins (p: with p; [azurerm]))
    terraform_0_13 pre-commit terraform-docs tflint
  ];
} ""