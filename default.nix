with import <nixpkgs> {};
#{ lib
#, stdenv
#, fetchFromGitHub
#, fetchYarnDeps
#}:
let
  ver = "unstable-2023-10-02";

  src = fetchFromGitHub {
    owner = "cutestnekoaqua";
    repo = "Sharkey-bunjs";
    rev = "779b2860347e5765cc0ebffdd3aebfee6fd35aa7";
    hash = "sha256-jA/swxgEIseWNSiOVm+MrvhzG3uLAw7lN6dfkSKVtNA=";
    fetchSubmodules = true;
  };
  
  deps = fetchYarnDeps { # check out mkYarnPackage
    #pname = "sharkey-deps";
    #version = ver;
    yarnLock = src + "yarn.lock";
    hash = "sha256-0000000000000000000000000000000000000000000=";
  };
in
stdenv.mkDerivation rec {
  pname = "sharkey-bunjs";
  version = ver;

  src = fetchFromGitHub {
    owner = "cutestnekoaqua";
    repo = "Sharkey-bunjs";
    rev = "779b2860347e5765cc0ebffdd3aebfee6fd35aa7";
    hash = "sha256-jA/swxgEIseWNSiOVm+MrvhzG3uLAw7lN6dfkSKVtNA=";
    fetchSubmodules = true;
  };

  buildDependencies = [ deps ];

  meta = with lib; {
    description = "A Sharkish microblogging platform";
    homepage = "https://github.com/cutestnekoaqua/Sharkey-bunjs";
    changelog = "https://github.com/cutestnekoaqua/Sharkey-bunjs/blob/${src.rev}/CHANGELOG.md";
    license = licenses.agpl3Only;
    maintainers = with maintainers; [ ];
  };
}
