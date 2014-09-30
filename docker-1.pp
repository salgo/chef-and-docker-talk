
include 'docker'

docker::image { 'ubuntu':
  image_tag => 'precise'
}

docker::run { 'helloworld':
  image   => 'ubuntu:precise',
  command => '/bin/sh -c "while true; do echo hello world; sleep 1; done"',
}