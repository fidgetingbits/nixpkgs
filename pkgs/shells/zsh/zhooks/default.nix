{ lib, stdenv, fetchgit }:
let
  pname = "zhooks";
  install_path = "share/zsh/${pname}";
in
stdenv.mkDerivation {
  inherit pname;
  version = "e6616b4a2786b45a56a2f591b79439836e678d22";
  src = fetchgit {
    url = "https://github.com/agkozak/zhooks";
    hash = "sha256-zahXMPeJ8kb/UZd85RBcMbomB7HjfEKzQKjF2NnumhQ=";
  };
  strictDeps = true;
  dontBuild = true;
  installPhase = ''
    install -m755 -D ${pname}.plugin.zsh --target-directory $out/${install_path}
  '';
  meta = with lib; {
    homepage = "https://github.com/agkozak/zhooks";
    license = licenses.mit;
    longDescription = ''
      This Zsh plugin is a tool for displaying the code for all Zsh hook functions (such as precmd), as well as the contents of
      hook arrays (such as precmd_functions).

      To install the ${pname} plugin in home-manager you can add the following to your `programs.zsh.plugins` list:

      ```nix
      programs.zsh.plugins = [
        {
          name = "${pname}";
          src = "''${pkgs.${pname}}/${install_path}";
        }
      ];
      ```
    '';
    maintainers = with maintainers; [ fidgetingbits ];
  };
}
