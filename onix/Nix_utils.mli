val get_nix_build_jobs : unit -> string
val fetch : OpamUrl.t -> OpamFilename.Dir.t
val fetch_resolve : OpamUrl.t -> string * OpamFilename.Dir.t

val prefetch_url_with_path :
  ?hash_type:[< `sha256 | `sha512 > `sha256] ->
  ?hash:string ->
  string ->
  string * OpamFilename.Dir.t

val prefetch_url :
  ?hash_type:[< `sha256 | `sha512 > `sha256] -> ?hash:string -> string -> string


val prefetch_git_with_path :
  OpamUrl.t -> string * OpamFilename.Dir.t

type store_path = {
  hash : string;
  package_name : OpamPackage.Name.t;
  package_version : OpamPackage.Version.t;
  prefix : OpamFilename.Dir.t;
  suffix : OpamFilename.Base.t;
}

val pp_store_path : Format.formatter -> store_path -> unit
val parse_store_path : OpamFilename.Dir.t -> store_path
