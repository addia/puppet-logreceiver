# == Class logreceiver::service
# ==============================
#
#
# Description of the Class:
#
#   This class is meant to be called from init.pp only.
#
#
# ===========================
#
class logreceiver::service (
  $systemd_file       = $logreceiver::params::systemd_file,
  $service            = $logreceiver::params::service,
  $package_name       = $logreceiver::params::package_name
) inherits logreceiver::params {
  
  notify { "Configuring service: ${package_name}": }

  file { $systemd_file:
    ensure            => file,
    owner             => 'root',
    group             => 'root',
    mode              => '0644',
    content           => template('logreceiver/logreceiver_service.erb'),
    notify            => Service[$service]
    }

  service { $service:
    ensure            => running,
    enable            => true,
    hasrestart        => true,
    hasstatus         => true,
    require           => File[$systemd_file]
    }

  service { 'logstash.service':
    ensure            => stopped,
    enable            => false
    }

  }


# vim: set ts=2 sw=2 et :
