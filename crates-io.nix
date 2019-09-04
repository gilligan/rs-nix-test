{ lib, buildRustCrate, buildRustCrateHelpers }:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
in
rec {

# c2-chacha-0.2.2

  crates.c2_chacha."0.2.2" = deps: { features?(features_.c2_chacha."0.2.2" deps {}) }: buildRustCrate {
    crateName = "c2-chacha";
    version = "0.2.2";
    authors = [ "The CryptoCorrosion Contributors" ];
    edition = "2018";
    sha256 = "1lcfazshbiw8kdpcgphlmls0mz5j4wnvsq1diaz4b2bcvgm3r2cn";
    dependencies = mapFeatures features ([
      (crates."ppv_lite86"."${deps."c2_chacha"."0.2.2"."ppv_lite86"}" deps)
    ]
      ++ (if features.c2_chacha."0.2.2".lazy_static or false then [ (crates.lazy_static."${deps."c2_chacha"."0.2.2".lazy_static}" deps) ] else []));
    features = mkFeatures (features."c2_chacha"."0.2.2" or {});
  };
  features_.c2_chacha."0.2.2" = deps: f: updateFeatures f (rec {
    c2_chacha = fold recursiveUpdate {} [
      { "0.2.2".byteorder =
        (f.c2_chacha."0.2.2".byteorder or false) ||
        (f.c2_chacha."0.2.2".rustcrypto_api or false) ||
        (c2_chacha."0.2.2"."rustcrypto_api" or false); }
      { "0.2.2".default = (f.c2_chacha."0.2.2".default or true); }
      { "0.2.2".lazy_static =
        (f.c2_chacha."0.2.2".lazy_static or false) ||
        (f.c2_chacha."0.2.2".std or false) ||
        (c2_chacha."0.2.2"."std" or false); }
      { "0.2.2".rustcrypto_api =
        (f.c2_chacha."0.2.2".rustcrypto_api or false) ||
        (f.c2_chacha."0.2.2".default or false) ||
        (c2_chacha."0.2.2"."default" or false); }
      { "0.2.2".simd =
        (f.c2_chacha."0.2.2".simd or false) ||
        (f.c2_chacha."0.2.2".default or false) ||
        (c2_chacha."0.2.2"."default" or false); }
      { "0.2.2".std =
        (f.c2_chacha."0.2.2".std or false) ||
        (f.c2_chacha."0.2.2".default or false) ||
        (c2_chacha."0.2.2"."default" or false); }
      { "0.2.2".stream-cipher =
        (f.c2_chacha."0.2.2".stream-cipher or false) ||
        (f.c2_chacha."0.2.2".rustcrypto_api or false) ||
        (c2_chacha."0.2.2"."rustcrypto_api" or false); }
    ];
    lazy_static."${deps.c2_chacha."0.2.2".lazy_static}".default = true;
    ppv_lite86 = fold recursiveUpdate {} [
      { "${deps.c2_chacha."0.2.2".ppv_lite86}"."simd" =
        (f.ppv_lite86."${deps.c2_chacha."0.2.2".ppv_lite86}"."simd" or false) ||
        (c2_chacha."0.2.2"."simd" or false) ||
        (f."c2_chacha"."0.2.2"."simd" or false); }
      { "${deps.c2_chacha."0.2.2".ppv_lite86}".default = true; }
    ];
  }) [
    (features_.lazy_static."${deps."c2_chacha"."0.2.2"."lazy_static"}" deps)
    (features_.ppv_lite86."${deps."c2_chacha"."0.2.2"."ppv_lite86"}" deps)
  ];


# end
# cfg-if-0.1.9

  crates.cfg_if."0.1.9" = deps: { features?(features_.cfg_if."0.1.9" deps {}) }: buildRustCrate {
    crateName = "cfg-if";
    version = "0.1.9";
    authors = [ "Alex Crichton <alex@alexcrichton.com>" ];
    sha256 = "13g9p2mc5b2b5wn716fwvilzib376ycpkgk868yxfp16jzix57p7";
  };
  features_.cfg_if."0.1.9" = deps: f: updateFeatures f (rec {
    cfg_if."0.1.9".default = (f.cfg_if."0.1.9".default or true);
  }) [];


# end
# getrandom-0.1.11

  crates.getrandom."0.1.11" = deps: { features?(features_.getrandom."0.1.11" deps {}) }: buildRustCrate {
    crateName = "getrandom";
    version = "0.1.11";
    authors = [ "The Rand Project Developers" ];
    edition = "2018";
    sha256 = "1f9w5rra9zbnamnh8wl81rw5y87mn3ml4ra5cqrzq2wryzr41651";
    dependencies = mapFeatures features ([
      (crates."cfg_if"."${deps."getrandom"."0.1.11"."cfg_if"}" deps)
    ])
      ++ (if (kernel == "linux" || kernel == "darwin") || kernel == "redox" then mapFeatures features ([
      (crates."libc"."${deps."getrandom"."0.1.11"."libc"}" deps)
    ]) else [])
      ++ (if kernel == "wasi" then mapFeatures features ([
      (crates."wasi"."${deps."getrandom"."0.1.11"."wasi"}" deps)
    ]) else [])
      ++ (if kernel == "wasm32-unknown-unknown" then mapFeatures features ([
]) else []);
    features = mkFeatures (features."getrandom"."0.1.11" or {});
  };
  features_.getrandom."0.1.11" = deps: f: updateFeatures f (rec {
    cfg_if."${deps.getrandom."0.1.11".cfg_if}".default = true;
    getrandom = fold recursiveUpdate {} [
      { "0.1.11".compiler_builtins =
        (f.getrandom."0.1.11".compiler_builtins or false) ||
        (f.getrandom."0.1.11".rustc-dep-of-std or false) ||
        (getrandom."0.1.11"."rustc-dep-of-std" or false); }
      { "0.1.11".core =
        (f.getrandom."0.1.11".core or false) ||
        (f.getrandom."0.1.11".rustc-dep-of-std or false) ||
        (getrandom."0.1.11"."rustc-dep-of-std" or false); }
      { "0.1.11".default = (f.getrandom."0.1.11".default or true); }
    ];
    libc."${deps.getrandom."0.1.11".libc}".default = (f.libc."${deps.getrandom."0.1.11".libc}".default or false);
    wasi."${deps.getrandom."0.1.11".wasi}".default = true;
  }) [
    (features_.cfg_if."${deps."getrandom"."0.1.11"."cfg_if"}" deps)
    (features_.libc."${deps."getrandom"."0.1.11"."libc"}" deps)
    (features_.wasi."${deps."getrandom"."0.1.11"."wasi"}" deps)
  ];


# end
# lazy_static-1.4.0

  crates.lazy_static."1.4.0" = deps: { features?(features_.lazy_static."1.4.0" deps {}) }: buildRustCrate {
    crateName = "lazy_static";
    version = "1.4.0";
    authors = [ "Marvin Löbel <loebel.marvin@gmail.com>" ];
    sha256 = "13h6sdghdcy7vcqsm2gasfw3qg7ssa0fl3sw7lq6pdkbk52wbyfr";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."lazy_static"."1.4.0" or {});
  };
  features_.lazy_static."1.4.0" = deps: f: updateFeatures f (rec {
    lazy_static = fold recursiveUpdate {} [
      { "1.4.0".default = (f.lazy_static."1.4.0".default or true); }
      { "1.4.0".spin =
        (f.lazy_static."1.4.0".spin or false) ||
        (f.lazy_static."1.4.0".spin_no_std or false) ||
        (lazy_static."1.4.0"."spin_no_std" or false); }
    ];
  }) [];


# end
# libc-0.2.62

  crates.libc."0.2.62" = deps: { features?(features_.libc."0.2.62" deps {}) }: buildRustCrate {
    crateName = "libc";
    version = "0.2.62";
    authors = [ "The Rust Project Developers" ];
    sha256 = "1vsb4pyn6gl6sri6cv5hin5wjfgk7lk2bshzmxb1xnkckjhz4gbx";
    build = "build.rs";
    dependencies = mapFeatures features ([
]);
    features = mkFeatures (features."libc"."0.2.62" or {});
  };
  features_.libc."0.2.62" = deps: f: updateFeatures f (rec {
    libc = fold recursiveUpdate {} [
      { "0.2.62".align =
        (f.libc."0.2.62".align or false) ||
        (f.libc."0.2.62".rustc-dep-of-std or false) ||
        (libc."0.2.62"."rustc-dep-of-std" or false); }
      { "0.2.62".default = (f.libc."0.2.62".default or true); }
      { "0.2.62".rustc-std-workspace-core =
        (f.libc."0.2.62".rustc-std-workspace-core or false) ||
        (f.libc."0.2.62".rustc-dep-of-std or false) ||
        (libc."0.2.62"."rustc-dep-of-std" or false); }
      { "0.2.62".std =
        (f.libc."0.2.62".std or false) ||
        (f.libc."0.2.62".default or false) ||
        (libc."0.2.62"."default" or false) ||
        (f.libc."0.2.62".use_std or false) ||
        (libc."0.2.62"."use_std" or false); }
    ];
  }) [];


# end
# ppv-lite86-0.2.5

  crates.ppv_lite86."0.2.5" = deps: { features?(features_.ppv_lite86."0.2.5" deps {}) }: buildRustCrate {
    crateName = "ppv-lite86";
    version = "0.2.5";
    authors = [ "The CryptoCorrosion Contributors" ];
    edition = "2018";
    sha256 = "1r3bhih75vhl8v7q0flmywl7hmfg902yf3jjzracsh0jlkldij6r";
    features = mkFeatures (features."ppv_lite86"."0.2.5" or {});
  };
  features_.ppv_lite86."0.2.5" = deps: f: updateFeatures f (rec {
    ppv_lite86 = fold recursiveUpdate {} [
      { "0.2.5".default = (f.ppv_lite86."0.2.5".default or true); }
      { "0.2.5".simd =
        (f.ppv_lite86."0.2.5".simd or false) ||
        (f.ppv_lite86."0.2.5".default or false) ||
        (ppv_lite86."0.2.5"."default" or false); }
      { "0.2.5".std =
        (f.ppv_lite86."0.2.5".std or false) ||
        (f.ppv_lite86."0.2.5".default or false) ||
        (ppv_lite86."0.2.5"."default" or false); }
    ];
  }) [];


# end
# rand-0.7.0

  crates.rand."0.7.0" = deps: { features?(features_.rand."0.7.0" deps {}) }: buildRustCrate {
    crateName = "rand";
    version = "0.7.0";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    edition = "2018";
    sha256 = "00nfv8p95nf985sxdfd7j23br77v47sf9hp95qjna1zsz4fyjs8v";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand"."0.7.0"."rand_core"}" deps)
    ])
      ++ (if !(kernel == "emscripten") then mapFeatures features ([
      (crates."rand_chacha"."${deps."rand"."0.7.0"."rand_chacha"}" deps)
    ]) else [])
      ++ (if kernel == "emscripten" then mapFeatures features ([
      (crates."rand_hc"."${deps."rand"."0.7.0"."rand_hc"}" deps)
    ]) else [])
      ++ (if (kernel == "linux" || kernel == "darwin") then mapFeatures features ([
      (crates."libc"."${deps."rand"."0.7.0"."libc"}" deps)
    ]) else []);
    features = mkFeatures (features."rand"."0.7.0" or {});
  };
  features_.rand."0.7.0" = deps: f: updateFeatures f (rec {
    libc."${deps.rand."0.7.0".libc}".default = (f.libc."${deps.rand."0.7.0".libc}".default or false);
    rand = fold recursiveUpdate {} [
      { "0.7.0".alloc =
        (f.rand."0.7.0".alloc or false) ||
        (f.rand."0.7.0".std or false) ||
        (rand."0.7.0"."std" or false); }
      { "0.7.0".default = (f.rand."0.7.0".default or true); }
      { "0.7.0".getrandom =
        (f.rand."0.7.0".getrandom or false) ||
        (f.rand."0.7.0".std or false) ||
        (rand."0.7.0"."std" or false); }
      { "0.7.0".getrandom_package =
        (f.rand."0.7.0".getrandom_package or false) ||
        (f.rand."0.7.0".getrandom or false) ||
        (rand."0.7.0"."getrandom" or false); }
      { "0.7.0".packed_simd =
        (f.rand."0.7.0".packed_simd or false) ||
        (f.rand."0.7.0".simd_support or false) ||
        (rand."0.7.0"."simd_support" or false); }
      { "0.7.0".rand_pcg =
        (f.rand."0.7.0".rand_pcg or false) ||
        (f.rand."0.7.0".small_rng or false) ||
        (rand."0.7.0"."small_rng" or false); }
      { "0.7.0".simd_support =
        (f.rand."0.7.0".simd_support or false) ||
        (f.rand."0.7.0".nightly or false) ||
        (rand."0.7.0"."nightly" or false); }
      { "0.7.0".std =
        (f.rand."0.7.0".std or false) ||
        (f.rand."0.7.0".default or false) ||
        (rand."0.7.0"."default" or false); }
    ];
    rand_chacha."${deps.rand."0.7.0".rand_chacha}".default = true;
    rand_core = fold recursiveUpdate {} [
      { "${deps.rand."0.7.0".rand_core}"."alloc" =
        (f.rand_core."${deps.rand."0.7.0".rand_core}"."alloc" or false) ||
        (rand."0.7.0"."alloc" or false) ||
        (f."rand"."0.7.0"."alloc" or false); }
      { "${deps.rand."0.7.0".rand_core}"."getrandom" =
        (f.rand_core."${deps.rand."0.7.0".rand_core}"."getrandom" or false) ||
        (rand."0.7.0"."getrandom" or false) ||
        (f."rand"."0.7.0"."getrandom" or false); }
      { "${deps.rand."0.7.0".rand_core}"."std" =
        (f.rand_core."${deps.rand."0.7.0".rand_core}"."std" or false) ||
        (rand."0.7.0"."std" or false) ||
        (f."rand"."0.7.0"."std" or false); }
      { "${deps.rand."0.7.0".rand_core}".default = true; }
    ];
    rand_hc."${deps.rand."0.7.0".rand_hc}".default = true;
  }) [
    (features_.rand_core."${deps."rand"."0.7.0"."rand_core"}" deps)
    (features_.rand_chacha."${deps."rand"."0.7.0"."rand_chacha"}" deps)
    (features_.rand_hc."${deps."rand"."0.7.0"."rand_hc"}" deps)
    (features_.libc."${deps."rand"."0.7.0"."libc"}" deps)
  ];


# end
# rand_chacha-0.2.1

  crates.rand_chacha."0.2.1" = deps: { features?(features_.rand_chacha."0.2.1" deps {}) }: buildRustCrate {
    crateName = "rand_chacha";
    version = "0.2.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" "The CryptoCorrosion Contributors" ];
    edition = "2018";
    sha256 = "0zpp3wmxhhmripb6bywhzhx5rfwl4dfbny85hpalwdj0sncv0p0k";
    dependencies = mapFeatures features ([
      (crates."c2_chacha"."${deps."rand_chacha"."0.2.1"."c2_chacha"}" deps)
      (crates."rand_core"."${deps."rand_chacha"."0.2.1"."rand_core"}" deps)
    ]);
    features = mkFeatures (features."rand_chacha"."0.2.1" or {});
  };
  features_.rand_chacha."0.2.1" = deps: f: updateFeatures f (rec {
    c2_chacha = fold recursiveUpdate {} [
      { "${deps.rand_chacha."0.2.1".c2_chacha}"."simd" = true; }
      { "${deps.rand_chacha."0.2.1".c2_chacha}"."std" =
        (f.c2_chacha."${deps.rand_chacha."0.2.1".c2_chacha}"."std" or false) ||
        (rand_chacha."0.2.1"."std" or false) ||
        (f."rand_chacha"."0.2.1"."std" or false); }
      { "${deps.rand_chacha."0.2.1".c2_chacha}".default = (f.c2_chacha."${deps.rand_chacha."0.2.1".c2_chacha}".default or false); }
    ];
    rand_chacha = fold recursiveUpdate {} [
      { "0.2.1".default = (f.rand_chacha."0.2.1".default or true); }
      { "0.2.1".simd =
        (f.rand_chacha."0.2.1".simd or false) ||
        (f.rand_chacha."0.2.1".default or false) ||
        (rand_chacha."0.2.1"."default" or false); }
      { "0.2.1".std =
        (f.rand_chacha."0.2.1".std or false) ||
        (f.rand_chacha."0.2.1".default or false) ||
        (rand_chacha."0.2.1"."default" or false); }
    ];
    rand_core."${deps.rand_chacha."0.2.1".rand_core}".default = true;
  }) [
    (features_.c2_chacha."${deps."rand_chacha"."0.2.1"."c2_chacha"}" deps)
    (features_.rand_core."${deps."rand_chacha"."0.2.1"."rand_core"}" deps)
  ];


# end
# rand_core-0.5.1

  crates.rand_core."0.5.1" = deps: { features?(features_.rand_core."0.5.1" deps {}) }: buildRustCrate {
    crateName = "rand_core";
    version = "0.5.1";
    authors = [ "The Rand Project Developers" "The Rust Project Developers" ];
    edition = "2018";
    sha256 = "19qfnh77bzz0x2gfsk91h0gygy0z1s5l3yyc2j91gmprq60d6s3r";
    dependencies = mapFeatures features ([
    ]
      ++ (if features.rand_core."0.5.1".getrandom or false then [ (crates.getrandom."${deps."rand_core"."0.5.1".getrandom}" deps) ] else []));
    features = mkFeatures (features."rand_core"."0.5.1" or {});
  };
  features_.rand_core."0.5.1" = deps: f: updateFeatures f (rec {
    getrandom = fold recursiveUpdate {} [
      { "${deps.rand_core."0.5.1".getrandom}"."std" =
        (f.getrandom."${deps.rand_core."0.5.1".getrandom}"."std" or false) ||
        (rand_core."0.5.1"."std" or false) ||
        (f."rand_core"."0.5.1"."std" or false); }
      { "${deps.rand_core."0.5.1".getrandom}".default = true; }
    ];
    rand_core = fold recursiveUpdate {} [
      { "0.5.1".alloc =
        (f.rand_core."0.5.1".alloc or false) ||
        (f.rand_core."0.5.1".std or false) ||
        (rand_core."0.5.1"."std" or false); }
      { "0.5.1".default = (f.rand_core."0.5.1".default or true); }
      { "0.5.1".getrandom =
        (f.rand_core."0.5.1".getrandom or false) ||
        (f.rand_core."0.5.1".std or false) ||
        (rand_core."0.5.1"."std" or false); }
      { "0.5.1".serde =
        (f.rand_core."0.5.1".serde or false) ||
        (f.rand_core."0.5.1".serde1 or false) ||
        (rand_core."0.5.1"."serde1" or false); }
    ];
  }) [
    (features_.getrandom."${deps."rand_core"."0.5.1"."getrandom"}" deps)
  ];


# end
# rand_hc-0.2.0

  crates.rand_hc."0.2.0" = deps: { features?(features_.rand_hc."0.2.0" deps {}) }: buildRustCrate {
    crateName = "rand_hc";
    version = "0.2.0";
    authors = [ "The Rand Project Developers" ];
    edition = "2018";
    sha256 = "0592q9kqcna9aiyzy6vp3fadxkkbpfkmi2cnkv48zhybr0v2yf01";
    dependencies = mapFeatures features ([
      (crates."rand_core"."${deps."rand_hc"."0.2.0"."rand_core"}" deps)
    ]);
  };
  features_.rand_hc."0.2.0" = deps: f: updateFeatures f (rec {
    rand_core."${deps.rand_hc."0.2.0".rand_core}".default = true;
    rand_hc."0.2.0".default = (f.rand_hc."0.2.0".default or true);
  }) [
    (features_.rand_core."${deps."rand_hc"."0.2.0"."rand_core"}" deps)
  ];


# end
# wasi-0.5.0

  crates.wasi."0.5.0" = deps: { features?(features_.wasi."0.5.0" deps {}) }: buildRustCrate {
    crateName = "wasi";
    version = "0.5.0";
    authors = [ "The Cranelift Project Developers" ];
    edition = "2018";
    sha256 = "07lkhjfx9ab19ri5gliqgga0jhafd1gv42y5ckb97l08wb7862k6";
  };
  features_.wasi."0.5.0" = deps: f: updateFeatures f (rec {
    wasi."0.5.0".default = (f.wasi."0.5.0".default or true);
  }) [];


# end
}
