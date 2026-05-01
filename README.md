# TA-Jenkins-Vagrant

# Table of Contents

- [Overview](#overview)
- [Preinstalled Tools](#preinstalled-tools)
- [Setup & Run](#setup--run)
- [Accessing Jenkins](#accessing-jenkins)
- [Cleanup & Full Reset](#cleanup--full-reset)

-------


# Overview

This project provides an automated, reproducible environment for building and testing a Jenkins-based DevOps infrastructure. By leveraging Vagrant and VirtualBox, it creates a local virtual machine that mirrors a production-ready build server.

The primary goal is to use this local environment as a "sandbox" to prepare and validate configurations before baking them into a custom Amazon Machine Image (AMI) using Packer. It ensures that all tools, scripts, and dependencies work perfectly in an isolated environment before moving to the AWS Cloud.

-------


# Preinstalled Tools

The generated VM will contain:

- Base Ubuntu configuration (clean & optimized)
- Required system utilities and dependencies
- Jenkins
- Ansible
- Docker
- Terraform
- Packer
- OpenJDK-21
- AWS CLI

-------


# Setup & Run


1. Clone repository:
    ```bash
    git clone https://github.com/Trainee-Onboarding-Tasks/TA-Jenkins-Vagrant.git
    cd TA-Jenkins-Vagrant
    ```

2. Before start creating virtual machine, make sure that:
    - Virtual Box is installed on local PC
    - HashiCorp Vagrant is installed
    - `vagrant-disksize` plugin (allow disk resizing) is installed, do it by running:

      ```bash
      vagrant plugin install vagrant-disksize
      ```


3. In `config.yml` file configure variables:
    ```bash
    jenkins_ip: "192.168.56.120"
    port: 8080
    memory: 8192
    cpu: 4
    box: "bento/ubuntu-24.04"
    disk_size: "35GB"
    ```
    there are special custom variables :
    
    - `jenkins_ip` - static IP address assigned to the Jenkins virtual machine

    - `port` - port on which Jenkins will be accessible (defaults to 8080)

    - `memory` / `cpu` - allocated resources (RAM and CPU cores) for the VM (recomended min 8GB RAM and 4 CPU)

    - `box` - name of the Vagrant box (Operating System) to be used (Recommended: Ubuntu 24.04 LTS)

    - `disk_size` - total disk space capacity for the virtual machine



4. To build and run virual machine, run
    - ```bash
      vagrant up
      ```


5. To reload virtual machine, run:
    - ```bash
      vagrant reload
      ```

--------


# Accessing Jenkins

#### Once the provisioning is finished, Jenkins will be available via your web browser. You can access it using either the static IP or your local machine's loopback address:

  1. Via Static IP (Recommended): [http://192.168.56.120:8080](http://192.168.56.120:8080)

  2. Via Localhost: http://localhost:8080


#### (Important) If you modified `jenkins_ip` or `port` in `config.yml` file, please use your custom values. For example, if you set the port to 9090, use http://localhost:9090.

-------

# Connect to VM

#### Once the virtual machine is up and running, you can access it using the following methods:

### Recommended Method
  The easiest and most reliable way to access the VM terminal is via the built-in Vagrant command:

  ```bash
  vagrant ssh
  ```
This command automatically handles SSH keys and authentication

### Manual Connection
  If you prefer to connect manually (e.g., via a standalone SSH client or IDE), use the following credentials:

  `Host`: 192.168.56.120 (or the IP configured in `config.yml`)

  `Port`: 22

  `User`: vagrant

  `Password`: vagrant

-------

# Cleanup & Full Reset

If you need to stop, remove, or completely wipe the environment, use the following commands:


### Destroy the Virtual Machine
  To stop and delete the VM along with its disks and settings, run:

  ```bash
  vagrant destroy --force
  ```

### Remove the Base Box (Optional)
  If you want to free up global disk space by removing the downloaded OS image (e.g., bento/ubuntu-24.04):

  ```bash
  vagrant box list              # View installed boxes
  vagrant box remove [BOX_NAME] # Remove a specific box
  ```


### Full Reset

  After running `vagrant destroy`, a hidden `.vagrant` folder remains in your project directory. It stores local connection metadata. To perform a "factory reset" of the project folder, run:

  ```bash
  rm -rf .vagrant/
  ```


### VirtualBox Network Cleanup (Important)

  Sometimes VirtualBox leaves "Host-Only" network adapters behind. To avoid IP conflicts in future, check and remove used IPs manually in VirtualBox GUI:

  `File -> Tools -> Network Manager -> Remove unused vboxnet adapters`
