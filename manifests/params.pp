# == Class logreceiver::params
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
class logreceiver::params {

  $ensure           = 'present'
  $status           = 'enabled'
  $user             = 'logstash'
  $group            = 'logstash'
  $password         = hiera('elk_stack_logstash_passwd')
  $passkey          = hiera('elk_stack_logstash_key')
  $config_dir       = '/etc/logstash/conf.d/'
  $ssl_dir          = '/etc/logstash/ssl'
  $ssl_key          = 'filebeat.key'
  $ssl_cert         = 'filebeat.crt'
  $rabbit_key       = 'rabbitmq-client.key'
  $rabbit_crt       = 'rabbitmq-client.crt'
  $service          = 'logreceiver.service'
  $systemd_file     = "/usr/lib/systemd/system/${service}"
  $rabbit_address   = hiera('elk_stack_rabbitmq_address')
  $package_name     = 'logstash'
  $repo_version     = '2.3'

}


# vim: set ts=2 sw=2 et :
