name 'jenkinsserver'
maintainer 'Amlan'
maintainer_email 'amlana21@gmail.com'
license 'Public'
description 'Installs/Configures jenkinsserver'
long_description 'Installs/Configures jenkinsserver'
version '0.2.3'
depends 'docker'
depends 'maven'
chef_version '>= 12.1' if respond_to?(:chef_version)

