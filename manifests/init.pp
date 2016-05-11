# == Class: log-receiver
# ===========================
#
#
# Description of the Class:
#
#   Install and configure the logstash service
#      which is pushing messages received from beats into a RabbitMQ Queue
#
#
# Document all Parameters:
#
#   Explanation of what this parameter affects and what it defaults to.
#     ensure          = package install status
#     status          = default service state
#     user            = run as user
#     group           = run as group
#     config_dir      = prospector plug-in directory path
#     ssl_dir         = certificate path
#     ssl_key         = certificate key file
#     ssl_cert        = certificate file
#     rabbit_key      = rabbitmq-client certificate key file
#     rabbit_cert     = rabbitmq-client certificate file
#     service         = systemd service file name
#     systemd_file    = systemd service file including full path
#     rabbit_address  = rabbitmq server/cluster address IP or DNS
#     package_name    = the package name to install and configure
#     repo_version    = the elastic search repo version
#
#
# ===========================
#
#
# == Authors
# ----------
#
# Author: Addi <addi.abel@gmail.com>
#
#
# == Copyright
# ------------
#
# Copyright:  ©  2016  LR / Addi.
#
#
class log-receiver (
  $ensure             = $log-receiver::params::ensure,
  $status             = $log-receiver::params::status,
  $user               = $log-receiver::params::user,
  $group              = $log-receiver::params::group,
  $config_dir         = $log-receiver::params::config_dir,
  $ssl_dir            = $log-receiver::params::ssl_dir,
  $ssl_key            = $log-receiver::params::ssl_key,
  $ssl_cert           = $log-receiver::params::ssl_cert,
  $rabbit_key         = $log-receiver::params::rabbit_key,
  $rabbit_crt         = $log-receiver::params::rabbit_crt,
  $service            = $log-receiver::params::service,
  $systemd_file       = $log-receiver::params::systemd_file,
  $rabbit_address     = $log-receiver::params::rabbit_address,
  $package_name       = $log-receiver::params::package_name,
  $repo_version       = $log-receiver::params::repo_version

  ) inherits log-receiver::params {

    notify { "## --->>> Installing and configuring ${package_name}": }

    anchor { 'log-receiver::begin': } ->
    class { '::log-receiver::accounts': } ->
    class { '::log-receiver::install': } ->
    class { '::log-receiver::config': } ->
    class { '::log-receiver::service': } ->
    anchor { 'log-receiver::end': }

}


# vim: set ts=2 sw=2 et :
