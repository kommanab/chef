require 'fileutils'
require 'chef/resource/lwrp_base'

include Windows::Helper

remote_directory 'C:\\chef\\cache\\package\\new\\' do
  provider 'Chef::Provider::Directory::RemoteDirectory'
  source '\\\\192.168.10.13\\FreewareSoftware\\ITS-DevOps\\msoffice2013'
  remote_user  'administrator'
  remote_password  'password@1'
  rights :full_control, ['Administrators','Everyone']
  action :create
end
