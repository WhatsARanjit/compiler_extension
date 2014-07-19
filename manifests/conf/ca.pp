class compiler_extension::conf::ca (
  $server    = $::settings::server,
  $ca_server = $::settings::server,
) {
  Ini_setting {
    ensure  => present,
    path    => $::settings::config,
    section => 'main',
  }
  @@ini_setting { 'Puppet MOM':
    value   => 'server',
    setting => $server,
    tag     => ['compiler_extension_conf'],
  }
  @@ini_setting { 'Puppet CA Server':
    value   => 'ca_server',
    setting => $ca_server,
    tag     => ['compiler_extension_conf'],
  }
  @@ini_setting { 'Puppet CA function':
    value   => 'ca',
    setting => 'false',
    tag     => ['compiler_extension_conf'],
  }
}
