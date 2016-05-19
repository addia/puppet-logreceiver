# == Class logreceiver::accounts
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
class logreceiver::accounts (
  $user               = $logreceiver::params::user,
  $group              = $logreceiver::params::group,
  $package_name       = $logreceiver::params::package_name
  ) inherits logreceiver::params {

  notify { "Creating accounts for: ${package_name}": }

  group {  $group:
    ensure     => present,
    gid        => 252
  }

  user { $user: 
    ensure     => present,
    home       => '/var/lib/logstash',
    shell      => '/bin/bash',
    uid        => '252',
    gid        => '252',
    password   => '!',
    managehome => true,
  }

}


# vim: set ts=2 sw=2 et :
