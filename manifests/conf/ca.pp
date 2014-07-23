class compiler_extension::conf::ca (
  $server    = $::settings::certname,
  $ca_server = $::settings::certname,
) {
  Ini_setting {
    ensure  => present,
    path    => $::settings::config,
    section => 'agent',
  }
  ini_setting { "Puppet CA ${::settings::certname} uses ${server} as master":
    setting => 'server',
    value   => $server,
  }
  ini_setting { "Puppet CA ${::settings::certname} uses ${ca_server} as CA":
    setting => 'ca_server',
    value   => $ca_server,
  }
}
