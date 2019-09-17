#
# Cookbook:: jenkinsserver
# Recipe:: prepmaster


apt_update 'update apt' do
    frequency 86400
    action :periodic
end

docker_service 'default' do
    action [:create, :start]
    # supports :restart=>true, :status => true, :start => true, :stop => true
end

execute 'enable docker permission' do
    command 'chmod 777 /var/run/docker.sock'
    # elevated true
end


docker_image 'jenkins/jenkins' do
    tag 'lts'
    action :pull
end


docker_volume 'jenkins_home' do
    action :create
end


docker_container 'jenkinsinstall' do
    repo 'jenkins/jenkins'
    tag 'lts'
    port '8080:8080'
    volumes ['jenkins_home:/var/jenkins_home']
    action :run
end


