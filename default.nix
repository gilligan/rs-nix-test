{ pkgs1903 ? (import ./nix/nixpkgs.nix {}).nixpkgs1903
, master   ? (import ./nix/nixpkgs.nix {}).master
}:

{
  test-1903-buildRustPackage= pkgs1903.rustPlatform.buildRustPackage {
    name = "rust-test-19.03";
    src = ./.;
    cargoSha256 = "sha256:0rl2nmd7jxr23rrvykm9i25f5dp245qbv6i8cbfayccqk1xq3www";
  };

  test-master-buildRustPackage = master.rustPlatform.buildRustPackage {
    name = "rust-test-master";
    src = ./.;
    cargoSha256 = "sha256:0rl2nmd7jxr23rrvykm9i25f5dp245qbv6i8cbfayccqk1xq3wwq";
  };

  test-carnix = (pkgs1903.callPackage ./Cargo.nix {
    cratesIO = pkgs1903.callPackage ./crates-io.nix {};
  }).rs_nix_test;

  test-crate2nix = (pkgs1903.callPackage ./crate2nix.nix {}).rootCrate.build;

}
