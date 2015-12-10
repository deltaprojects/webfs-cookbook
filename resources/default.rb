actions :install
default_action :install

attribute :docroot, :kind_of => String, :name_attribute => true
attribute :port, :kind_of => Integer, :required => true, :default => 80

def initialize(*args)
  super
  #@run_context.include_recipe "dp_webfs::default"
  @action = :install
end
