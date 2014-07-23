class compiler_extension (
  $ca        = $::settings::server,
  $compilers = [ $::settings::server ],
  $console   = $::settings::server,
  $master    = $::settings::server,
  $puppetdb  = $::settings::server,
) {
  if $::settings::certname == $console {
    include ::compiler_extension::conf::console
  }
  if $::settings::certname == $puppetdb {
    include ::compiler_extension::conf::puppetdb
  }
  if $::settings::certname == $ca {
    include ::compiler_extension::conf::ca
  }
  if $::settings::certname in $compilers {
    include ::compiler_extension::conf::compiler
  }
  include ::compiler_extension::conf::agent
}

