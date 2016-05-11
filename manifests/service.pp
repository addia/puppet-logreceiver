# == Class log-receiver::service
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
class log-receiver::service (
  $systemd_file       = $log-receiver::params::systemd_file,
  $service            = $log-receiver::params::service,
  $package_name       = $log-receiver::params::package_name
  ) inherits log-receiver::params {
  
  notify { "Configuring service: ${package_name}": }

  file { $systemd_file:
    ensure            => file,
    owner             => 'root',
    group             => 'root',
    mode              => '0644',
    content           => template("${service}.erb"),
    notify            => Service[$service]
  }

  service { $service:
    ensure            => running,
    enable            => true,
    hasrestart        => true,
    hasstatus         => true,
    require           => File[$systemd_file]
  }

}


# vim: set ts=2 sw=2 et :
