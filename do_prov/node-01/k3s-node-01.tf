resource "digitalocean_droplet" "k3s-node-01" {
    image = "rockylinux-9-x64" #"ubuntu-20-04-x64"
    name = "k3s-${var.dep_region}-node-01" 
    region = var.dep_region
    # size = "s-1vcpu-1gb" #rockylinux-s-1vcpu-1gb-35gb-intel-fra1-01
    # size = "s-1vcpu-1gb-amd" #rockylinux-s-1vcpu-1gb-35gb-intel-fra1-01
    # size = "s-1vcpu-2gb-35gb-intel"
    size = "s-1vcpu-2gb-intel"
    ssh_keys = [
      data.digitalocean_ssh_key.terraform.id
    ]

    connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  
  # provisioner "remote-exec" {
  #   inline = [
  #     "export PATH=$PATH:/usr/bin",
  #     # install iptables
  #     "yum update -y"
  #     # "yum install -y iptables"
  #   ]
  # }
}

resource "digitalocean_droplet" "k3s-node-02" {
    image = "rockylinux-9-x64" #"ubuntu-20-04-x64"
    name = "k3s-${var.dep_region}-node-02" 
    region = var.dep_region
    # size = "s-1vcpu-1gb" #rockylinux-s-1vcpu-1gb-35gb-intel-fra1-01
    # size = "s-1vcpu-1gb-amd" #rockylinux-s-1vcpu-1gb-35gb-intel-fra1-01
    # size = "s-1vcpu-2gb-35gb-intel"
    size = "s-1vcpu-2gb-intel"
    ssh_keys = [
      data.digitalocean_ssh_key.terraform.id
    ]

    connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  
  # provisioner "remote-exec" {
  #   inline = [
  #     "export PATH=$PATH:/usr/bin",
  #     # install iptables
  #     "yum update -y",
  #     # "yum install -y iptables"
  #   ]
  # }
}