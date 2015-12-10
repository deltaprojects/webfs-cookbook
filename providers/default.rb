use_inline_resources

action :install do
  # install webfs.
  package 'webfs'

  # enable and start webfs service.
  service 'webfs' do
    supports :status => false, :restart => true, :reload => false
    action [:start, :enable]
  end

  # create config file.
  template "/etc/webfsd.conf" do
    cookbook 'webfs'
    source 'webfsd.conf.erb'
    variables(
      :docroot => new_resource.docroot,
      :port => new_resource.port
    )
    action :create
    notifies :restart, 'service[webfs]', :delayed
  end

end # end action: install
