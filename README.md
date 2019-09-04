## testing rust/nix integration

As i am starting out to try to fix current problems with building rust packages
in Nix i wanted to have something to test so i hacked together this repo.

It contains a dummy cargo project that depends on [rand](https://github.com/rust-random/rand). 
rand happens to make use of the [renaming feature](https://doc.rust-lang.org/cargo/reference/specifying-dependencies.html#renaming-dependencies-in-cargotoml)
of Cargo which currently isn't supported by either carnix or crate2nix.

### Status

- buildRustPackage (19.03) :x:
- buildRustPackage (master) :heavy_check_mark:
- carnix :x:
- crate2nix :x:
