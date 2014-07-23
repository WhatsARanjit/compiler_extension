class compiler_extension (
  $ca       = $::settings::server,
  $console  = $::settings::server,
  $puppetdb = $::settings::server,
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
  include ::compiler_extension::conf::agent
}

