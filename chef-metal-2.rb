machine 'db' do
  recipe 'mysql'
end

machine 'web1' do
  recipe 'apache'
end
