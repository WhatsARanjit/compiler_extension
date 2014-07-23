class compiler_extension::conf::ca (
  $server    = $::compiler_extension::ca,
  $ca_server = $::compiler_extension::ca,
  $cacrl     = $::cacrl_path,
) {
  Ini_setting {
    ensure  => present,
    path    => $::settings::config,
    section => 'agent',
  }
  ini_setting { "Puppet CA ${::clientcert} uses ${server} as master":
    setting => 'server',
    value   => $server,
  }
  ini_setting { "Puppet CA ${::clientcert} uses ${ca_server} as CA":
    setting => 'ca_server',
    value   => $ca_server,
  }
  @@file { "Puppet CA ${::clientcert} CRL":
    ensure  => file,
    content => file($cacrl),
    tag     => ['compiler_extension-cacrl'],
  }
}
