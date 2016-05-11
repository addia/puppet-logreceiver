# == Class log-receiver::install
# ===========================
#
#
# Description of the Class:
#
#   This class is meant to be called from init.pp only.
#
#
# ===========================
#
class log-receiver::install (
  $ensure             = $log-receiver::params::ensure,
  $package_name       = $log-receiver::params::package_name
  ) inherits log-receiver::params {

  include log-receiver::repo

  notify { "Installing package: ${package_name}": }

  package { ['java-1.8.0-openjdk', 'java-1.8.0-openjdk-devel'] :
    ensure            => present,
  }
  package { $package_name:
    ensure            => $ensure
  }
}


# vim: set ts=2 sw=2 et :
