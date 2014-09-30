require 'chef_metal_docker'

machine 'wario' do
  recipe 'openssh::default'

  machine_options :docker_options => {
    :base_image => {
      :name => 'ubuntu',
      :repository => 'ubuntu',
      :tag => '14.04'
    },
    :command => '/usr/sbin/sshd -p 8022 -D',      
    :ports => 8022
  }
  
end
