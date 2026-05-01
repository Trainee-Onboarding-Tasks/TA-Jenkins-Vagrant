require 'yaml'

settings = YAML.load_file('config.yml')


Vagrant.configure("2") do |config|
  
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = settings['box']

    jenkins.disksize.size = settings['disk_size']

    jenkins.vm.network "private_network", ip: settings['jenkins_ip']
    jenkins.vm.network "forwarded_port", guest: settings['port'], host: settings['port']

    jenkins.vm.provider "virtualbox" do |vb|
      vb.name = "Jenkins-Server"

      vb.customize ["modifyvm", :id, "--clipboard-mode", "bidirectional"]
      vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
      
      vb.memory = settings['memory']
      vb.cpus   = settings['cpu']
    end

    jenkins.vm.provision "shell", path: "scripts/base_setup.sh"
    jenkins.vm.provision "shell", path: "scripts/install_jenkins.sh"
    jenkins.vm.provision "shell", path: "scripts/install_ansible.sh"
    jenkins.vm.provision "shell", path: "scripts/install_hashicorp.sh"
    jenkins.vm.provision "shell", path: "scripts/install_docker.sh"
    jenkins.vm.provision "shell", path: "scripts/install_aws.sh"
    jenkins.vm.provision "shell", path: "scripts/start_services.sh"

  end
end