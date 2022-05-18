{ pkgs, self, opam-repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "16ff1304f8ccdd5a8c9fa3ebe906c32ecdd576ee";
} }: {
  "0install-solver" = {
    name = "0install-solver";
    version = "2.17";
    src = pkgs.fetchurl {
      url =
        "https://github.com/0install/0install/releases/download/v2.17/0install-v2.17.tbz";
      sha256 =
        "1704e5d852bad79ef9f5b5b31146846420270411c5396434f6fe26577f2d0923";
    };
    opam = "${opam-repo}/packages/0install-solver/0install-solver.2.17/opam";
    depends = with self; [ dune ocaml ];
  };
  angstrom = {
    name = "angstrom";
    version = "0.15.0";
    src = builtins.fetchurl {
      url = "https://github.com/inhabitedtype/angstrom/archive/0.15.0.tar.gz";
    };
    opam = "${opam-repo}/packages/angstrom/angstrom.0.15.0/opam";
    depends = with self; [ bigstringaf dune ocaml ocaml-syntax-shims result ];
  };
  astring = {
    name = "astring";
    version = "0.8.5";
    src = builtins.fetchurl {
      url = "https://erratique.ch/software/astring/releases/astring-0.8.5.tbz";
    };
    opam = "${opam-repo}/packages/astring/astring.0.8.5/opam";
    depends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  base-bigarray = {
    name = "base-bigarray";
    version = "base";
    src = null;
    opam = "${opam-repo}/packages/base-bigarray/base-bigarray.base/opam";
    depends = with self; [ ];
  };
  base-bytes = {
    name = "base-bytes";
    version = "base";
    src = null;
    opam = "${opam-repo}/packages/base-bytes/base-bytes.base/opam";
    depends = with self; [ ocaml ocamlfind ];
  };
  base-threads = {
    name = "base-threads";
    version = "base";
    src = null;
    opam = "${opam-repo}/packages/base-threads/base-threads.base/opam";
    depends = with self; [ ];
  };
  base-unix = {
    name = "base-unix";
    version = "base";
    src = null;
    opam = "${opam-repo}/packages/base-unix/base-unix.base/opam";
    depends = with self; [ ];
  };
  bigstringaf = {
    name = "bigstringaf";
    version = "0.9.0";
    src = builtins.fetchurl {
      url = "https://github.com/inhabitedtype/bigstringaf/archive/0.9.0.tar.gz";
    };
    opam = "${opam-repo}/packages/bigstringaf/bigstringaf.0.9.0/opam";
    depends = with self; [
      conf-pkg-config
      dune
      ocaml
      (self.ocaml-freestanding or null)
    ];
  };
  biniou = {
    name = "biniou";
    version = "1.2.1";
    src = pkgs.fetchurl {
      url =
        "https://github.com/mjambon/biniou/releases/download/1.2.1/biniou-1.2.1.tbz";
      sha256 =
        "35546c68b1929a8e6d27a3b39ecd17b38303a0d47e65eb9d1480c2061ea84335";
    };
    opam = "${opam-repo}/packages/biniou/biniou.1.2.1/opam";
    depends = with self; [ dune easy-format ocaml ];
  };
  bos = {
    name = "bos";
    version = "0.2.1";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/bos/releases/bos-0.2.1.tbz";
      sha512 =
        "8daeb8a4c2dd1f2460f6274ada19f4f1b6ebe875ff83a938c93418ce0e6bdb74b8afc5c9a7d410c1c9df2dad030e4fa276b6ed2da580639484e8b5bc92610b1d";
    };
    opam = "${opam-repo}/packages/bos/bos.0.2.1/opam";
    depends = with self; [
      astring
      base-unix
      fmt
      fpath
      logs
      ocaml
      ocamlbuild
      ocamlfind
      rresult
      topkg
    ];
  };
  cmdliner = {
    name = "cmdliner";
    version = "1.1.1";
    src = pkgs.fetchurl {
      url =
        "https://erratique.ch/software/cmdliner/releases/cmdliner-1.1.1.tbz";
      sha512 =
        "5478ad833da254b5587b3746e3a8493e66e867a081ac0f653a901cc8a7d944f66e4387592215ce25d939be76f281c4785702f54d4a74b1700bc8838a62255c9e";
    };
    opam = "${opam-repo}/packages/cmdliner/cmdliner.1.1.1/opam";
    depends = with self; [ ocaml ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    src = null;
    opam = "${opam-repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depends = with self; [ ];
  };
  cppo = {
    name = "cppo";
    version = "1.6.8";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/cppo/archive/v1.6.8.tar.gz";
      sha512 =
        "069bbe0ef09c03b0dc4b5795f909c3ef872fe99c6f1e6704a0fa97594b1570b3579226ec67fe11d696ccc349a4585055bbaf07c65eff423aa45af28abf38c858";
    };
    opam = "${opam-repo}/packages/cppo/cppo.1.6.8/opam";
    depends = with self; [ base-unix dune ocaml ];
  };
  dune = {
    name = "dune";
    version = "3.1.1";
    src = pkgs.fetchurl {
      url =
        "https://github.com/ocaml/dune/releases/download/3.1.1/fiber-3.1.1.tbz";
      sha256 =
        "02484454ab1b998840c7873509ec6b2301eb92662c132ef8f5f4f569b35a6b60";
    };
    opam = "${opam-repo}/packages/dune/dune.3.1.1/opam";
    depends = with self; [
      base-threads
      base-unix
      (self.ocaml or null)
      (self.ocamlfind-secondary or null)
    ];
  };
  easy-format = {
    name = "easy-format";
    version = "1.3.2";
    src = pkgs.fetchurl {
      url =
        "https://github.com/mjambon/easy-format/releases/download/1.3.2/easy-format-1.3.2.tbz";
      sha256 =
        "3440c2b882d537ae5e9011eb06abb53f5667e651ea4bb3b460ea8230fa8c1926";
    };
    opam = "${opam-repo}/packages/easy-format/easy-format.1.3.2/opam";
    depends = with self; [ dune ocaml ];
  };
  fmt = {
    name = "fmt";
    version = "0.9.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/fmt/releases/fmt-0.9.0.tbz";
      sha512 =
        "66cf4b8bb92232a091dfda5e94d1c178486a358cdc34b1eec516d48ea5acb6209c0dfcb416f0c516c50ddbddb3c94549a45e4a6d5c5fd1c81d3374dec823a83b";
    };
    opam = "${opam-repo}/packages/fmt/fmt.0.9.0/opam";
    depends = with self; [
      ocaml
      ocamlbuild
      ocamlfind
      topkg
      (self.base-unix or null)
      (self.cmdliner or null)
    ];
  };
  fpath = {
    name = "fpath";
    version = "0.7.3";
    src = builtins.fetchurl {
      url = "https://erratique.ch/software/fpath/releases/fpath-0.7.3.tbz";
    };
    opam = "${opam-repo}/packages/fpath/fpath.0.7.3/opam";
    depends = with self; [ astring ocaml ocamlbuild ocamlfind topkg ];
  };
  logs = {
    name = "logs";
    version = "0.7.0";
    src = builtins.fetchurl {
      url = "https://erratique.ch/software/logs/releases/logs-0.7.0.tbz";
    };
    opam = "${opam-repo}/packages/logs/logs.0.7.0/opam";
    depends = with self; [
      ocaml
      ocamlbuild
      ocamlfind
      topkg
      (self.base-threads or null)
      (self.cmdliner or null)
      (self.fmt or null)
      (self.js_of_ocaml or null)
      (self.lwt or null)
    ];
  };
  ocaml = {
    name = "ocaml";
    version = "4.14.0";
    src = null;
    opam = "${opam-repo}/packages/ocaml/ocaml.4.14.0/opam";
    depends = with self; [
      ocaml-config
      (self.ocaml-base-compiler or null)
      (self.ocaml-system or null)
      (self.ocaml-variants or null)
    ];
  };
  ocaml-base-compiler = {
    name = "ocaml-base-compiler";
    version = "4.14.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml/archive/4.14.0.tar.gz";
      sha256 =
        "39f44260382f28d1054c5f9d8bf4753cb7ad64027da792f7938344544da155e8";
    };
    opam =
      "${opam-repo}/packages/ocaml-base-compiler/ocaml-base-compiler.4.14.0/opam";
    depends = with self; [ ];
  };
  ocaml-config = {
    name = "ocaml-config";
    version = "2";
    src = null;
    opam = "${opam-repo}/packages/ocaml-config/ocaml-config.2/opam";
    depends = with self; [
      (self.ocaml-base-compiler or null)
      (self.ocaml-system or null)
      (self.ocaml-variants or null)
    ];
  };
  ocaml-options-vanilla = {
    name = "ocaml-options-vanilla";
    version = "1";
    src = null;
    opam =
      "${opam-repo}/packages/ocaml-options-vanilla/ocaml-options-vanilla.1/opam";
    depends = with self; [ ];
  };
  ocaml-syntax-shims = {
    name = "ocaml-syntax-shims";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url =
        "https://github.com/ocaml-ppx/ocaml-syntax-shims/releases/download/1.0.0/ocaml-syntax-shims-1.0.0.tbz";
      sha256 =
        "89b2e193e90a0c168b6ec5ddf6fef09033681bdcb64e11913c97440a2722e8c8";
    };
    opam =
      "${opam-repo}/packages/ocaml-syntax-shims/ocaml-syntax-shims.1.0.0/opam";
    depends = with self; [ dune ocaml ];
  };
  ocamlbuild = {
    name = "ocamlbuild";
    version = "0.14.1";
    src = pkgs.fetchurl {
      url =
        "https://github.com/ocaml/ocamlbuild/archive/refs/tags/0.14.1.tar.gz";
      sha512 =
        "1f5b43215b1d3dc427b9c64e005add9d423ed4bca9686d52c55912df8955647cb2d7d86622d44b41b14c4f0d657b770c27967c541c868eeb7c78e3bd35b827ad";
    };
    opam = "${opam-repo}/packages/ocamlbuild/ocamlbuild.0.14.1/opam";
    depends = with self; [ ocaml ];
  };
  ocamlfind = {
    name = "ocamlfind";
    version = "1.9.3";
    src = pkgs.fetchurl {
      url = "http://download.camlcity.org/download/findlib-1.9.3.tar.gz";
      sha512 =
        "27cc4ce141576bf477fb9d61a82ad65f55478740eed59fb43f43edb794140829fd2ff89ad27d8a890cfc336b54c073a06de05b31100fc7c01cacbd7d88e928ea";
    };
    opam = "${opam-repo}/packages/ocamlfind/ocamlfind.1.9.3/opam";
    depends = with self; [ ocaml (self.graphics or null) ];
  };
  ocamlgraph = {
    name = "ocamlgraph";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url =
        "https://github.com/backtracking/ocamlgraph/releases/download/2.0.0/ocamlgraph-2.0.0.tbz";
      sha256 =
        "20fe267797de5322088a4dfb52389b2ea051787952a8a4f6ed70fcb697482609";
    };
    opam = "${opam-repo}/packages/ocamlgraph/ocamlgraph.2.0.0/opam";
    depends = with self; [ dune ocaml stdlib-shims ];
  };
  onix-example = {
    name = "onix-example";
    version = "root";
    src = null;
    opam = "./onix-example.opam";
    depends = with self; [
      bos
      cmdliner
      dune
      easy-format
      fpath
      ocaml
      opam-0install
      options
      uri
      yojson
    ];
  };
  opam-0install = {
    name = "opam-0install";
    version = "0.4.3";
    src = pkgs.fetchurl {
      url =
        "https://github.com/ocaml-opam/opam-0install-solver/releases/download/v0.4.3/opam-0install-cudf-0.4.3.tbz";
      sha256 =
        "d59e0ebddda58f798ff50ebe213c83893b5a7c340c38c20950574d67e6145b8a";
    };
    opam = "${opam-repo}/packages/opam-0install/opam-0install.0.4.3/opam";
    depends = with self; [
      self."0install-solver"
      cmdliner
      dune
      fmt
      ocaml
      opam-file-format
      opam-state
    ];
  };
  opam-core = {
    name = "opam-core";
    version = "2.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam/archive/2.1.2.tar.gz";
      sha512 =
        "bea6f75728a6ef25bcae4f8903dde7a297df7186208dccacb3f58bd6a0caec551c11b79e8544f0983feac038971dbe49481fc405a5962973a5f56ec811abe396";
    };
    opam = "${opam-repo}/packages/opam-core/opam-core.2.1.2/opam";
    depends = with self; [
      base-bigarray
      base-unix
      cppo
      dune
      ocaml
      ocamlgraph
      re
    ];
  };
  opam-file-format = {
    name = "opam-file-format";
    version = "2.1.4";
    src = pkgs.fetchurl {
      url =
        "https://github.com/ocaml/opam-file-format/archive/refs/tags/2.1.4.tar.gz";
      sha512 =
        "fb5e584080d65c5b5d04c7d2ac397b69a3fd077af3f51eb22967131be22583fea507390eb0d7e6f5c92035372a9e753adbfbc8bfd056d8fd4697c6f95dd8e0ad";
    };
    opam = "${opam-repo}/packages/opam-file-format/opam-file-format.2.1.4/opam";
    depends = with self; [ ocaml (self.dune or null) ];
  };
  opam-format = {
    name = "opam-format";
    version = "2.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam/archive/2.1.2.tar.gz";
      sha512 =
        "bea6f75728a6ef25bcae4f8903dde7a297df7186208dccacb3f58bd6a0caec551c11b79e8544f0983feac038971dbe49481fc405a5962973a5f56ec811abe396";
    };
    opam = "${opam-repo}/packages/opam-format/opam-format.2.1.2/opam";
    depends = with self; [ dune ocaml opam-core opam-file-format re ];
  };
  opam-repository = {
    name = "opam-repository";
    version = "2.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam/archive/2.1.2.tar.gz";
      sha512 =
        "bea6f75728a6ef25bcae4f8903dde7a297df7186208dccacb3f58bd6a0caec551c11b79e8544f0983feac038971dbe49481fc405a5962973a5f56ec811abe396";
    };
    opam = "${opam-repo}/packages/opam-repository/opam-repository.2.1.2/opam";
    depends = with self; [ dune ocaml opam-format ];
  };
  opam-state = {
    name = "opam-state";
    version = "2.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam/archive/2.1.2.tar.gz";
      sha512 =
        "bea6f75728a6ef25bcae4f8903dde7a297df7186208dccacb3f58bd6a0caec551c11b79e8544f0983feac038971dbe49481fc405a5962973a5f56ec811abe396";
    };
    opam = "${opam-repo}/packages/opam-state/opam-state.2.1.2/opam";
    depends = with self; [ dune ocaml opam-repository ];
  };
  options = rec {
    name = "options";
    version = "dev";
    src = builtins.fetchGit {
      url = "git+https://github.com/odis-labs/options.git";
      rev = "223e6438ffb00ac0b28a8eba45dcb10e4063e7b7";
      allRefs = true;
    };
    opam = "${src}/options.opam";
    depends = with self; [ dune ];
  };
  re = {
    name = "re";
    version = "1.10.4";
    src = pkgs.fetchurl {
      url =
        "https://github.com/ocaml/ocaml-re/releases/download/1.10.4/re-1.10.4.tbz";
      sha256 =
        "83eb3e4300aa9b1dc7820749010f4362ea83524742130524d78c20ce99ca747c";
    };
    opam = "${opam-repo}/packages/re/re.1.10.4/opam";
    depends = with self; [ dune ocaml seq ];
  };
  result = {
    name = "result";
    version = "1.5";
    src = builtins.fetchurl {
      url =
        "https://github.com/janestreet/result/releases/download/1.5/result-1.5.tbz";
    };
    opam = "${opam-repo}/packages/result/result.1.5/opam";
    depends = with self; [ dune ocaml ];
  };
  rresult = {
    name = "rresult";
    version = "0.7.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/rresult/releases/rresult-0.7.0.tbz";
      sha512 =
        "f1bb631c986996388e9686d49d5ae4d8aaf14034f6865c62a88fb58c48ce19ad2eb785327d69ca27c032f835984e0bd2efd969b415438628a31f3e84ec4551d3";
    };
    opam = "${opam-repo}/packages/rresult/rresult.0.7.0/opam";
    depends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  seq = {
    name = "seq";
    version = "base";
    src = null;
    opam = "${opam-repo}/packages/seq/seq.base/opam";
    depends = with self; [ ocaml ];
  };
  stdlib-shims = {
    name = "stdlib-shims";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url =
        "https://github.com/ocaml/stdlib-shims/releases/download/0.3.0/stdlib-shims-0.3.0.tbz";
      sha256 =
        "babf72d3917b86f707885f0c5528e36c63fccb698f4b46cf2bab5c7ccdd6d84a";
    };
    opam = "${opam-repo}/packages/stdlib-shims/stdlib-shims.0.3.0/opam";
    depends = with self; [ dune ocaml ];
  };
  stringext = {
    name = "stringext";
    version = "1.6.0";
    src = pkgs.fetchurl {
      url =
        "https://github.com/rgrinberg/stringext/releases/download/1.6.0/stringext-1.6.0.tbz";
      sha256 =
        "db41f5d52e9eab17615f110b899dfeb27dd7e7f89cd35ae43827c5119db206ea";
    };
    opam = "${opam-repo}/packages/stringext/stringext.1.6.0/opam";
    depends = with self; [ base-bytes dune ocaml ];
  };
  topkg = {
    name = "topkg";
    version = "1.0.5";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/topkg/releases/topkg-1.0.5.tbz";
      sha512 =
        "9450e9139209aacd8ddb4ba18e4225770837e526a52a56d94fd5c9c4c9941e83e0e7102e2292b440104f4c338fabab47cdd6bb51d69b41cc92cc7a551e6fefab";
    };
    opam = "${opam-repo}/packages/topkg/topkg.1.0.5/opam";
    depends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  uri = {
    name = "uri";
    version = "4.2.0";
    src = pkgs.fetchurl {
      url =
        "https://github.com/mirage/ocaml-uri/releases/download/v4.2.0/uri-v4.2.0.tbz";
      sha256 =
        "c5c013d940dbb6731ea2ee75c2bf991d3435149c3f3659ec2e55476f5473f16b";
    };
    opam = "${opam-repo}/packages/uri/uri.4.2.0/opam";
    depends = with self; [ angstrom dune ocaml stringext ];
  };
  yojson = {
    name = "yojson";
    version = "1.7.0";
    src = builtins.fetchurl {
      url =
        "https://github.com/ocaml-community/yojson/releases/download/1.7.0/yojson-1.7.0.tbz";
    };
    opam = "${opam-repo}/packages/yojson/yojson.1.7.0/opam";
    depends = with self; [ biniou cppo dune easy-format ocaml ];
  };
}