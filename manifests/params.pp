# == Class log-receiver::params
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
class log-receiver::params {

  $ensure           = 'present'
  $status           = 'enabled'
  $user             = 'logstash'
  $group            = 'logstash'
  $config_dir       = '/etc/logstash/conf.d/'
  $ssl_dir          = '/etc/logstash/ssl'
  $ssl_key          = 'filebeat.key'
  $ssl_cert         = 'filebeat.crt'
  $rabbit_key       = 'rabbitmq-client.key'
  $rabbit_crt       = 'rabbitmq-client.crt'
  $service          = 'log-receiver.service'
  $systemd_file     = "/usr/lib/systemd/system/${service}"
  $rabbit_address   = hiera('elk_stack_rabbitmq_address')
  $package_name     = 'logstash'
  $repo_version     = '2.2'

}


# vim: set ts=2 sw=2 et :
