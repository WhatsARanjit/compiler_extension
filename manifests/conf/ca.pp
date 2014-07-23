class compiler_extension::conf::ca (
  $server    = $::settings::certname,
  $ca_server = $::settings::certname,
) {
  Ini_setting {
    ensure  => present,
    path    => $::settings::config,
    section => 'agent',
  }
  @@ini_setting { 'Puppet MOM':
    value   => 'server',
    setting => $server,
    tag     => ['compiler_extension_conf_agent'],
  }
  @@ini_setting { 'Puppet CA Server':
    value   => 'ca_server',
    setting => $ca_server,
    tag     => ['compiler_extension_conf_agent'],
  }
  @@ini_setting { 'Puppet CA function':
    value   => 'ca',
    setting => 'false',
    section => 'main',
    tag     => ['compiler_extension_conf_compiler'],
  }
}
