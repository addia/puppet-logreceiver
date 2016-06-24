# == Class logreceiver::config
# =============================
#
#
# Description of the Class:
#
#   This class is meant to be called from init.pp only.
#
#
# ===========================
#
class logreceiver::config (
  $user               = $logreceiver::params::user,
  $group              = $logreceiver::params::group,
  $password           = $logreceiver::params::password,
  $passkey            = $logreceiver::params::passkey,
  $config_dir         = $logreceiver::params::config_dir,
  $ssl_dir            = $logreceiver::params::ssl_dir,
  $rabbit_key         = $logreceiver::params::rabbit_key,
  $rabbit_crt         = $logreceiver::params::rabbit_crt,
  $rabbit_p12         = $logreceiver::params::rabbit_p12,
  $filebeat_key       = $logreceiver::params::filebeat_key,
  $filebeat_crt       = $logreceiver::params::filebeat_crt,
  $service            = $logreceiver::params::service,
  $rabbit_address     = $logreceiver::params::rabbit_address,
  $package_name       = $logreceiver::params::package_name
  ) inherits logreceiver::params {

  notify { "Creating config files for: ${package_name}": }

  $config_input       = "$config_dir/02_logstash-beats-input.conf"
  $config_output      = "$config_dir/31_logstash-mq-output.conf"
  $rabbitmq_crt       = "$ssl_dir/$rabbit_crt"
  $rabbitmq_key       = "$ssl_dir/$rabbit_key"

  file { $config_dir:
    ensure            => directory,
    owner             => $user,
    group             => $group,
    mode              => '0755'
  }

  file { $ssl_dir:
    ensure            => directory,
    owner             => $user,
    group             => $group,
    mode              => '0755'
  }

  file { $config_input: 
    ensure            => file,
    owner             => $user,
    group             => $group,
    mode              => '0644',
    content           => template('logreceiver/02_logstash-beats-input-conf.erb'),
    notify            => Service[$service]
  }

  file { $config_output: 
    ensure            => file,
    owner             => $user,
    group             => $group,
    mode              => '0644',
    content           => template('logreceiver/31_logstash-mq-output-conf.erb'),
    notify            => Service[$service]
  }

  file { "$ssl_dir/$rabbit_key":
    ensure            => file,
    owner             => $user,
    group             => $group,
    mode              => '0644',
    content           => hiera('elk_stack_rabbitmq_client_key')
  }

  file { "$ssl_dir/$rabbit_crt":
    ensure            => file,
    owner             => $user,
    group             => $group,
    mode              => '0644',
    content           => hiera('elk_stack_rabbitmq_client_cert')
  }

  openssl::export::pkcs12 { 'rabbitmq-client':
    ensure            => 'present',
    basedir           => $ssl_dir,
    pkey              => "$ssl_dir/$rabbit_key",
    cert              => "$ssl_dir/$rabbit_crt",
    in_pass           => "",
    out_pass          => "",
  }

}


# vim: set ts=2 sw=2 et :
