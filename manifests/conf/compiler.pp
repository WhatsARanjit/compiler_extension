class compiler_extension::conf::compiler (
  $crl   = $::crl_path,
  $owner = 'root',
  $group = 'root',
) {
  File <<| tag == 'compiler_extension-cacrl' |>> {
    path  => $crl,
    owner => $owner,
    group => $group,
    mode  => '0644',
  }
}
