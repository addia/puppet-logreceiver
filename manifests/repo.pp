# == Class logreceiver::repo
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
class logreceiver::repo (
  $package_name       = $logreceiver::params::package_name,
  $package_vers       = $logreceiver::params::package_vers,
  $repo_version       = $logreceiver::params::repo_version
) inherits logreceiver::params {

  notify { "Creating repo for: ${package_name}": }

  case $::osfamily {
    'RedHat': {
      yumrepo { 'logstash':
        ensure        => 'present',
        descr         => 'Elastic Logstash Repository',
        baseurl       => "https://packages.elastic.co/logstash/${repo_version}/centos",
        gpgcheck      => 1,
        gpgkey        => 'https://packages.elastic.co/GPG-KEY-elasticsearch',
        enabled       => 1,
        }
      }

    'Debian': {
      apt::source { 'logstash':
        location      => "https://packages.elastic.co/logstash/${repo_version}/debian",
        release       => 'stable',
        repos         => 'main',
        key           => 'D88E42B4',
        key_source    => 'https://packages.elasticsearch.org/GPG-KEY-elasticsearch',
        }
      }

    'Archlinux': {
      fail("\"${::osfamily}\" the \"${logstash_pkg}\" is provided via the AUR repository.")
      }
      
    default: {
      fail("\"${logstash_pkg}\" provides no repository information for OSfamily \"${::osfamily}\"")
      }
    }

  }


# vim: set ts=2 sw=2 et :
