# logstash_push

A puppet module to manage the logstash install for receiving messages

## Requirements

* Puppet  >=  3.4
* The [stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib) Puppet library.

## Usage

### Main class

```
class ( 'log-receiver' )

This puppet module installs the logstash receiver that pushes all messages into the rabbitmq queue without modification.
The logstash_push module is only required on the rabbitmq server environment to receive all messages from a single region.
The install should happen at RabbitMQ environment install.

The config files are configured for just receiving and forwarding to server and queue.

```

### License

Please see the [LICENSE](https://github.com/LandRegistry-Ops/puppet-log-receiver/blob/master/LICENSE.md) file.

