# == Class logreceiver::install
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
class logreceiver::install (
  $package_name       = $logreceiver::params::package_name,
  $package_vers       = $logreceiver::params::package_vers
) inherits logreceiver::params {

  include logreceiver::repo

# notify { "Installing package: ${package_name}": }

  package { ['java-1.8.0-openjdk', 'java-1.8.0-openjdk-devel'] :
    ensure            => present,
    }

  package { $package_name:
    ensure            => $package_vers,
    }
  }


# vim: set ts=2 sw=2 et :
