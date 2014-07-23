class compiler_extension::conf::agent (
  $server    = $::compiler_extension::master,
  $ca_server = $::compiler_extension::ca,
) {
  Ini_setting {
    ensure  => present,
    path    => $::settings::config,
    section => 'agent',
  }
  ini_setting { "Puppet Agent ${::settings::certname} uses ${server} as master":
    setting => 'server',
    value   => $ca_server,
  }
  ini_setting { "Puppet Agent ${::settings::certname} uses ${ca_server} as CA":
    setting => 'ca_server',
    value   => $ca_server,
  }
}
