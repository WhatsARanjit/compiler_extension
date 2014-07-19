class compiler_extension (
  $mom      = $::settings::server,
  $console  = $::settings::server,
  $puppetdb = $::settings::server,
) {
  case $fqdn {
    $mom : {
      # If you are the MOM, export your information
      include ::compiler_extension::conf::ca
    }
    $console: {
    }
    $puppetdb:{
    }
    default: {
      # If you're not the MOM, update your puppet.conf
      include ::compiler_extension::conf::compiler
    }
  }
}

