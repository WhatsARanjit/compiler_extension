class compiler_extension::conf::puppetdb (
  $ca_server          = $::compiler_extension::ca,
  $compilers          = $::compiler_extension::compilers,
  $console            = $::compiler_extension::console,
  $puppetdb_auth_file = '/etc/puppetlabs/puppetdb/certificate-whitelist',
  $puppetdb_group     = 'pe-puppetdb',
  $puppetdb_user      = 'pe-puppetdb',
  $puppetdb           = $::compiler_extension::puppetdb,
  $server             = $::compiler_extension::master,
) {
  file { $puppetdb_auth_file:
    ensure  => file,
    owner   => $puppetdb_user,
    group   => $puppetdb_group,
    mode    => '0600',
    content => template("${module_name}/certificate_authorization.yml.erb"),
    notify  => Service['pe-httpd'],
  }
}
