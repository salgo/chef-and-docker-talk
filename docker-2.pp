
include 'docker'

docker::run { 'helloworld':
  image           => 'base',
  command         => '/bin/sh -c "while true; do echo hello world; sleep 1; done"',
  ports           => ['4444', '4555'],
  expose          => ['4666', '4777'],
  links           => ['mysql:db'],
  use_name        => true,
  volumes         => ['/var/lib/couchdb', '/var/log'],
  volumes_from    => '6446ea52fbc9',
  memory_limit    => 10m, # (format: <number><unit>, where unit = b, k, m or g)
  username        => 'example',
  hostname        => 'example.com',
  env             => ['FOO=BAR', 'FOO2=BAR2'],
  dns             => ['8.8.8.8', '8.8.4.4'],
  restart_service => true,
  privileged      => false,
}