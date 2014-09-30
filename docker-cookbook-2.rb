
# Run container
docker_container 'crowsnest'

# Save current timestamp
timestamp = Time.new.strftime('%Y%m%d%H%M')

# Commit container changes
docker_container 'crowsnest' do
  repository 'apps'
  tag timestamp
  action :commit
end

# Push image
docker_image 'crowsnest' do
  repository 'apps'
  tag timestamp
  action :push
end