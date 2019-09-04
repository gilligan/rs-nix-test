#!/usr/bin/env bash

nix-shell https://github.com/kolloch/crate2nix/tarball/master --run "crate2nix generate -o crate2nix.nix"
