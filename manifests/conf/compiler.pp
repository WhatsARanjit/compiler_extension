class compiler_extension::conf::compiler (
) {
  @@file_line { "${::settings::certanme} puppetdb whitelist entry":
    path => '/etc/puppetlabs/puppetdb/certificate-whitelist',
    line => $::settings::certname,
    tag  => 'compiler_extension_conf_puppetdb',
  }
  @@yaml_setting { "${::settings::certname} console whitelist entry":
    target => '/etc/puppetlabs/console-auth/certificate_authorization.yml',
    key    => "${::settings::certname}/role",
    value  => 'read-write1',
    tag    => 'compiler_extension_conf_console',
  }
  Ini_setting <<| tag == 'compiler_extension_conf_compiler' |>>
}
