# ansible_day3

**CREATED BY FILIP CHKHAIDZE, APRIL 2019**

**TO EXECUTE PLAYBOOK WITHOUT PASSWORD IN FURTHER RUN THE COMMAND BELOW:**
  
  ansible all -i inventory -m copy -a "src=\~/.ssh/id_rsa.pub dest=~/.ssh/authorized_keys mode=0640" -u vagrant -k

**ROLES DESCRIPTION:**

  **COMMON.** Common role for all hosts. Creates directory for custom facts. Use this role if you want to provision
  something to all hosts.

  **USER.** Creates users. Firstly, to create new user add information to vars/users.xml. You need to assign uid and gid.
  Also you can set password and privileges, if needed. Secondly, you need to add <newuser>_username: <newuser>
  to defaults/main. Finally, when invoke a role just specify <newuser>_username: <newuser> as argument. Example:
  - hosts: jenkins
    roles:
    - { role: user, username: "{{ jenkins_username }}" }

  **JAVA.** Installs Open JDK on the hosts. You can invoke role with explicit argument jdk_version. In other way
  this value of the variable will be set to default from file defaults/main.yml. You can reassign this value too.
  Also you can assign the host variable in inventory, this will reassigns default value. Example for explicit variable:
  - hosts: jenkins
    roles:
    - { role: java, jdk_version: 1.6.0 }

  **JENKINS.** Installs Jenkins on the hosts. You can specify a user for execute jenkins.service. Default value is jenkins.
  To specify another just invoke the role with different exec_user_jenkins value. Example:
  - hosts: jenkins
    roles:
    - { role: jenkins, exec_user_jenkins: <different_user> }

  **NEXUS.** Installs Nexus Repository on the hosts. You can specify a user for execute nexus.service. Default value is nexus.
  To specify another just invoke the role with different exec_user_nexus value. Example:
  - hosts: nexus
    roles:
    - { role: nexus, exec_user_nexus: <different_user> }

  **NGINX.** This role installs Nginx web server on the managed hosts. If you want to use custom nginx.conf
  just add your <custom>.nginx.conf file to FILES directory (ex: files/host1_nginx.conf) and specify
  variable nginx_config in the inventory for particular host (ex: 192.168.0.1 nginx_config=host1_nginx.conf)

  **SONAR.** This role installs SonarQube Server with PostgreSQL on the managed hosts.

  **TOMCAT.** This role installs Tomcat Application Server on the managed hosts.

**TO RETRIEVE LOCAL FACTS, ENTER THE COMMAND BELOW:**
  ansible-playbook -i inventory -u vagrant playbooks/playbook.yml --tags=never

**TO RETRIEVE LOCAL FACT ABOUT BUILD NUMBER OF DEPLOYED ARTIFACT, ENTER THE COMMAND BELOW:**
  ansible-playbook -i inventory -u vagrant playbooks/playbook.yml --tags=build

**LIST OF SERVERS:**  
jenkins 192.168.56.110  
nexus 192.168.56.111  
sonar 192.168.56.112  
tomcat 192.168.56.113  

