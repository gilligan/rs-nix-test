{}:
{
  nixpkgs1903 = import (import ./sources.nix)."nixos-19.03" {};
  master = import (import ./sources.nix).master {};
}

