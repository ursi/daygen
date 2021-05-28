with builtins;
let system = currentSystem; in
rec
{ make-shell =
    import
      (fetchGit
         { url = "https://github.com/ursi/nix-make-shell.git";
           ref = "1";
           rev = "ed72df45d0a81784eee8603e366e1f1ae9da6950";
         }
      )
      { inherit pkgs system; };

  pkgs =
    import
      (fetchGit
         { url = "https://github.com/NixOS/nixpkgs.git";
           ref = "nixpkgs-unstable";
           rev = "84aa23742f6c72501f9cc209f29c438766f5352d";
         }
      )
      {};

  purs-nix =
    import
      (fetchGit
         { url = "https://github.com/ursi/purs-nix.git";
           rev = "7b80249ff3eb4d13cee3afc322a65f2fe3b08b52";
         }
      )
      {};
}
