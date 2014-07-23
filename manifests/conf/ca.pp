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
    setting => 'server',
    value   => $server,
    tag     => 'compiler_extension_conf_agent',
  }
  @@ini_setting { 'Puppet CA Server':
    setting => 'ca_server',
    value   => $ca_server,
    tag     => 'compiler_extension_conf_agent',
  }
  @@ini_setting { 'Puppet CA function':
    setting => 'ca',
    value   => 'false',
    section => 'main',
    tag     => 'compiler_extension_conf_compiler',
  }
}
