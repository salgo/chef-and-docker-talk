
# Conditionally rebuild image if changes upstream:

git "#{Chef::Config[:file_cache_path]}/docker-testcontainerd" do
  repository 'git@github.com:bflad/docker-testcontainerd.git'
  notifies :build, 'docker_image[bflad/testcontainerd]', :immediately
end

docker_image 'bflad/testcontainerd' do
  action :pull_if_missing
end