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
    network_interface {
        label = "CA_Internal_VL1402"
        ipv4_address = "10.242.7.202"
        ipv4_prefix_length = "24"
        ipv4_gateway = "10.242.7.1"
    }
}
