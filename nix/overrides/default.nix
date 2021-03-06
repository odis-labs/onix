{ pkgs, ocaml, scope }:

let
  common = {
    ocamlfind = pkg:
      pkg.overrideAttrs (super: {
        patches =
          [ ./ocamlfind/ldconf.patch ./ocamlfind/install_topfind.patch ];
      });

    ocb-stubblr = pkg:
      pkg.overrideAttrs
      (super: { patches = [ ./ocb-stubblr/disable-opam.patch ]; });

    # https://github.com/ocsigen/lwt/pull/946
    lwt_react = pkg:
      pkg.overrideAttrs (super: {
        nativeBuildInputs = super.nativeBuildInputs or [ ]
          ++ [ scope.cppo or null ];
      });

    # https://github.com/pqwy/ocb-stubblr/blob/34dcbede6b51327172a0a3d83ebba02843aca249/src/ocb_stubblr.ml#L42
    core_unix = pkg:
      pkg.overrideAttrs (super: {
        prePatch = super.prePatch + ''
          patchShebangs unix_pseudo_terminal/src/discover.sh
        '';
      });

    # For versions < 1.12
    zarith = pkg:
      pkg.overrideAttrs (super: {
        prePatch = super.prePatch + ''
          if test -e ./z_pp.pl; then
            patchShebangs ./z_pp.pl
          fi
        '';
      });
  };

  darwin = {
    dune = pkg:
      pkg.overrideAttrs (super: {
        buildInputs = super.buildInputs or [ ] ++ [
          pkgs.darwin.apple_sdk.frameworks.Foundation
          pkgs.darwin.apple_sdk.frameworks.CoreServices
        ];
      });
  };

in common // pkgs.lib.optionalAttrs pkgs.stdenv.hostPlatform.isDarwin darwin
