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

  $user                    = 'logstash'
  $group                   = 'logstash'
  $password                = hiera('elk_stack_logstash_passwd')
  $password_origin         = hiera('elk_stack_rabbitmq_origin_passwd')
  $passkey                 = hiera('elk_stack_logstash_key')
  $passkey_origin          = hiera('elk_stack_rabbitmq_origin_passkey')
  $config_dir              = '/etc/logstash/conf.d/'
  $ssl_dir                 = '/etc/logstash/ssl'
  $rabbit_key              = 'rabbitmq-client.key'
  $rabbit_crt              = 'rabbitmq-client.crt'
  $rabbit_p12              = 'rabbitmq-client.p12'
  $rabbit_origin_key       = 'rabbitmq_origin.key'
  $rabbit_origin_crt       = 'rabbitmq_origin.crt'
  $rabbit_origin_p12       = 'rabbitmq_origin.p12'
  $filebeat_key            = '/etc/filebeat/ssl/filebeat.key'
  $filebeat_crt            = '/etc/filebeat/ssl/filebeat.crt'
  $service                 = 'logreceiver.service'
  $configure_origin        = hiera('elk_stack_rabbitmq_origin_conf')
  $systemd_file            = "/usr/lib/systemd/system/${service}"
  $rabbit_address          = hiera('elk_stack_rabbitmq_address')
  $rabbit_origin           = hiera('elk_stack_rabbitmq_origin')
  $package_name            = 'logstash'
  $package_vers            = '2.3.3-1'
  $repo_version            = '2.3'

}


# vim: set ts=2 sw=2 et :
