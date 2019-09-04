{ pkgs ? import <nixpkgs> {} }:

with pkgs;

pkgs.mkShell {
  buildInputs = [ cargo rustc carnix ];
}
