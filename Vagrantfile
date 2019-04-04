Vagrant.configure("2") do |config|
  
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "sbeliakou/centos"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network "private_network", ip: "192.168.56.110"
    jenkins.vm.provider "virtualbox" do |vb|
      vb.name = "jenkins"
      vb.memory = "1800"
    end
  end

  config.vm.define "nexus" do |nexus|
    nexus.vm.box = "sbeliakou/centos"
    nexus.vm.hostname = "nexus"
    nexus.vm.network "private_network", ip: "192.168.56.111"
    nexus.vm.provider "virtualbox" do |vb|
      vb.name = "nexus"
      vb.memory = "768"
    end
  end

  config.vm.define "sonar" do |sonar|
    sonar.vm.box = "sbeliakou/centos"
    sonar.vm.hostname = "sonar"
    sonar.vm.network "private_network", ip: "192.168.56.112"
    sonar.vm.provider "virtualbox" do |vb|
      vb.name = "sonar"
      vb.memory = "768"
    end
  end

  config.vm.define "tomcat" do |tomcat|
    tomcat.vm.box = "sbeliakou/centos"
    tomcat.vm.hostname = "tomcat"
    tomcat.vm.network "private_network", ip: "192.168.56.113"
    tomcat.vm.provider "virtualbox" do |vb|
      vb.name = "tomcat"
      vb.memory = "1024"
    end
  end

end

