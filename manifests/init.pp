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
#     user                   = run as user
#     group                  = run as group
#     password               = logstash password
#     password_origin        = logstash password for remote rabbimq
#     passkey                = logstash keypass
#     passkey_origin         = logstash keypass for remote rabbimq
#     config_dir             = prospector plug-in directory path
#     ssl_dir                = certificate path
#     rabbit_key             = rabbitmq-client certificate key file
#     rabbit_crt             = rabbitmq-client certificate file
#     rabbit_p12             = rabbitmq-client p12 file
#     rabbit_origin_key      = rabbitmq-origin certificate key file
#     rabbit_origin_crt      = rabbitmq-origin certificate file
#     rabbit_origin_p12      = rabbitmq-origin p12 file
#     filebeat_key           = filebeat key file path
#     filebeat_crt           = filebeat cert file path
#     service                = systemd service file name
#     systemd_file           = systemd service file including full path
#     configure_origin       = configure remote rabbitmq inputs
#     rabbit_address         = rabbitmq server/cluster address IP or DNS
#     rabbit_origin          = rabbitmq server/cluster address IP or DNS for remote rabbimq
#     package_name           = the package name to install and configure
#     package_vers           = the package version to install and configure
#     repo_version           = the elastic search repo version
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
  $user                      = $logreceiver::params::user,
  $group                     = $logreceiver::params::group,
  $password                  = $logreceiver::params::password,
  $password_origin           = $logreceiver::params::password_origin,
  $passkey                   = $logreceiver::params::passkey,
  $passkey_origin            = $logreceiver::params::passkey_origin,
  $config_dir                = $logreceiver::params::config_dir,
  $ssl_dir                   = $logreceiver::params::ssl_dir,
  $rabbit_key                = $logreceiver::params::rabbit_key,
  $rabbit_crt                = $logreceiver::params::rabbit_crt,
  $rabbit_p12                = $logreceiver::params::rabbit_p12,
  $rabbit_origin_key         = $logreceiver::params::rabbit_origin_key,
  $rabbit_origin_crt         = $logreceiver::params::rabbit_origin_crt,
  $rabbit_origin_p12         = $logreceiver::params::rabbit_origin_p12,
  $filebeat_key              = $logreceiver::params::filebeat_key,
  $filebeat_crt              = $logreceiver::params::filebeat_crt,
  $service                   = $logreceiver::params::service,
  $configure_origin          = $logreceiver::params::configure_origin,
  $systemd_file              = $logreceiver::params::systemd_file,
  $rabbit_address            = $logreceiver::params::rabbit_address,
  $rabbit_origin             = $logreceiver::params::rabbit_origin,
  $package_name              = $logreceiver::params::package_name,
  $package_vers              = $logreceiver::params::package_vers,
  $repo_version              = $logreceiver::params::repo_version

  ) inherits logreceiver::params {

#   notify { "## --->>> Installing and configuring ${package_name}": }

    anchor { 'logreceiver::begin': } ->
    class { '::logreceiver::accounts': } ->
    class { '::logreceiver::install': } ->
    class { '::logreceiver::config': } ->
    class { '::logreceiver::service': } ->
    anchor { 'logreceiver::end': }

  }


# vim: set ts=2 sw=2 et :
