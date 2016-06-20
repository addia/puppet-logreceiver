# == Class: logreceiver
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
#     password        = logstash password
#     passkey         = logstash keypass
#     config_dir      = prospector plug-in directory path
#     ssl_dir         = certificate path
#     ssl_key         = certificate key file
#     ssl_cert        = certificate file
#     rabbit_key      = rabbitmq-client certificate key file
#     rabbit_crt      = rabbitmq-client certificate file
#     service         = systemd service file name
#     systemd_file    = systemd service file including full path
#     rabbit_address  = rabbitmq server/cluster address IP or DNS
#     package_name    = the package name to install and configure
#     package_vers    = the package version to install and configure
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
class logreceiver (
  $ensure             = $logreceiver::params::ensure,
  $status             = $logreceiver::params::status,
  $user               = $logreceiver::params::user,
  $group              = $logreceiver::params::group,
  $password           = $logreceiver::params::password,
  $passkey            = $logreceiver::params::passkey,
  $config_dir         = $logreceiver::params::config_dir,
  $ssl_dir            = $logreceiver::params::ssl_dir,
  $ssl_key            = $logreceiver::params::ssl_key,
  $ssl_cert           = $logreceiver::params::ssl_cert,
  $rabbit_key         = $logreceiver::params::rabbit_key,
  $rabbit_crt         = $logreceiver::params::rabbit_crt,
  $service            = $logreceiver::params::service,
  $systemd_file       = $logreceiver::params::systemd_file,
  $rabbit_address     = $logreceiver::params::rabbit_address,
  $package_name       = $logreceiver::params::package_name,
  $package_vers       = $logreceiver::params::package_vers,
  $repo_version       = $logreceiver::params::repo_version

  ) inherits logreceiver::params {

    notify { "## --->>> Installing and configuring ${package_name}": }

    anchor { 'logreceiver::begin': } ->
    class { '::logreceiver::accounts': } ->
    class { '::logreceiver::install': } ->
    class { '::logreceiver::config': } ->
    class { '::logreceiver::service': } ->
    anchor { 'logreceiver::end': }

}


# vim: set ts=2 sw=2 et :
