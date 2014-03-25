name              "yourls"
maintainer        "Jeff Rafter"
maintainer_email  "jeffrafter@gmail.com"
license           "Apache 2.0"
description       "Installs the yourls URL shortener from source"
version           "0.1.0"

recipe "default", "Installs the yourls URL shortener from source"

%w{ ubuntu debian centos redhat amazon scientific oracle fedora }.each do |os|
  supports os
end

%w{ nginx }.each do |cb|
  depends cb
end
