maintainer       "Ryan J. Geyer"
maintainer_email "me@ryangeyer.com"
license          "Apache 2.0"
description      "Installs/Configures wget"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

%w{mac_os_x}.each do |os|
  supports os
end

%w{rightscale}.each do |dep|
  depends dep
end

recipe "wget::install_from_source", "Compiles and installs wget from source"

attribute "wget/version",
  :display_name => "Wget Version",
  :required => "optional",
  :default => "1.13.4"

attribute "wget/install_dir",
  :display_name => "Wget Install Directory",
  :required => "optional"