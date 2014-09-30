# Pull latest image
docker_image 'samalba/docker-registry'

# Run container exposing ports
docker_container 'samalba/docker-registry' do
  detach true
  port '5000:5000'
  env 'SETTINGS_FLAVOR=local'
  volume '/mnt/docker:/docker-storage'
end

# Login to private registry
docker_registry 'https://docker-registry.example.com/' do
  username 'shipper'
  password 'iloveshipping'
end

# Pull tagged image
docker_image 'apps/crowsnest' do
  tag 'not-latest'
end
