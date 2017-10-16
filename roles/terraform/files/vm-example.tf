#provider "vsphere" {
#  user                 = "service-vcenter"
#  password             = "C0ws4dbq"
#  vsphere_server       = "carpvc01"
#  allow_unverified_ssl = "true" 
#}

resource "vsphere_virtual_machine" "canpap05" {
    name = "canpap05"
    datacenter = "CaryDev"
    cluster = "carpvm01"
#    resource_pool = "carpvm01/Unclassified"
    vcpu = 1
    memory = 2048
    time_zone = "US/Eastern"
    domain = "ca.com"
    dns_suffixes = ["ca.com"]
    dns_servers = ["141.202.1.108"]

    disk {
        datastore = "CaryDev-AX4-FC/decom-AX4-FC01-VMFS5-2TB"
        template = "Veeam Jobs/Templates/Linux Images/Template-cent7-kinma13"
        type = "thin"
    }
#    disk {
#        datastore = "CARDFS05_NFS_T2_01"
#        type = "thin"
#        size = "2"
#        name = "canpap05-01"
#    }

    network_interface {
        label = "CA_Internal_VL1402"
        ipv4_address = "10.242.7.202"
        ipv4_prefix_length = "24"
        ipv4_gateway = "10.242.7.1"
    }
#    network_interface {
#        label = "CA_Internal_VL1401"
#    }
#    network_interface {
#        label = "CA_Internal_VL1400"
#    }


#    connection {
#        user = "vagrant"
#        password = "abc123!@#"
#        bastion_host = "localhost"
#        bastion_user = "vagrant"
#        bastion_password = "vagrant"
#        agent = false
#    }
#
#    provisioner "remote-exec" {
#        inline = [
#          "echo creating staging directory",
#          "sudo mkdir /vagrant",
#          "sudo chown vagrant:vagrant /vagrant"
#        ]
#    }
#    provisioner "file" {
#        source = "proxy/"
#        destination = "/vagrant"
#    }
#
#    provisioner "remote-exec" {
#        inline = [
#          "echo installing ",
#          "sudo chmod 755 /vagrant/provision.sh",
#          "sudo /vagrant/provision.sh"
#        ]
#
#    }

}
