let
  inherit (import ./inputs.nix) make-shell pkgs purs-nix;
  inherit (purs-nix) ps-pkgs ps-pkgs-ns purs;

  inherit
    (purs
       { dependencies =
           with ps-pkgs;
           [ argonaut
             argonaut-generic
             console
             effect
             lists
             naturals
             newtype
             nullable
             ps-pkgs-ns.ursi.elmish
             psci-support
             random
             rationals
           ];

         src = ../src;
       }
    )
    command
    modules;
in
{ build =
    pkgs.runCommand "daygen" {}
      ''
      mkdir $out
      ln -s ${../index.html} $out/index.html
      ln -s ${modules.Main.bundle {}} $out/index.js
      '';

  shell =
    make-shell
      { packages =
          with pkgs;
          [ nodejs
            purs-nix.purescript
            (command {})
          ];
      };
}
