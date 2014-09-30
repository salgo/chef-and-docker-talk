machine 'db' do
  recipe 'mysql'
end

1.upto(50) do |i|
  machine "web#{i}" do
    recipe 'apache'
  end
end
