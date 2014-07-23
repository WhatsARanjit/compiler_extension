class compiler_extension::conf::console (
  $ca_server         = $::compiler_extension::ca,
  $compilers         = $::compiler_extension::compilers,
  $console           = $::compiler_extension::console,
  $console_auth_file = '/etc/puppetlabs/console-auth/certificate_authorization.yml',
  $console_group     = 'pe-auth',
  $console_user      = 'puppet-dashboard',
  $puppetdb          = $::compiler_extension::puppetdb,
  $server            = $::compiler_extension::master,
) {
  file { $console_auth_file:
    ensure  => file,
    owner   => $console_user,
    group   => $console_group,
    mode    => '0644',
    content => template("${module_name}/certificate_authorization.yml.erb"),
    notify  => Service['pe-httpd'],
  }
}
