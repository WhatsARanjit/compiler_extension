class compiler_extension (
  $ca        = $::settings::server,
  $compilers = [ $::settings::server ],
  $console   = $::settings::server,
  $master    = $::settings::server,
  $puppetdb  = $::settings::server,
) {
  if $::clientcert == $console {
    include ::compiler_extension::conf::console
  }
  if $::clientcert == $puppetdb {
    include ::compiler_extension::conf::puppetdb
  }
  if $::clientcert == $ca {
    include ::compiler_extension::conf::ca
  }
  if $::clientcert in $compilers {
    include ::compiler_extension::conf::compiler
  }
  include ::compiler_extension::conf::agent
}

