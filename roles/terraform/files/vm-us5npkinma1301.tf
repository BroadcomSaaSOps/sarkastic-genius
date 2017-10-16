resource "vsphere_virtual_machine" "us5npkinma1301" {
    name = "us5npkinma1301"
    datacenter = "US5NP"
    cluster = "HSA-CLARITY/APP-CLARITY-ORT-SI-02"
#    resource_pool = "carpvm01/Unclassified"
    vcpu = 2
    memory = 2048
    time_zone = "US/Eastern"
    domain = "ondemand.ca.com"
    dns_suffixes = ["ondemand.ca.com,casaasnp.com"]
    dns_servers = ["10.48.128.62","10.48.128.63"]

    disk {
        datastore = "CLARITY - SI - ORT/DCLUSTER_NTPA200_CLARITY/NTPA200_US5NPSVMFS01_DATASTORE_VMDSPPMVOL3"
        #datastore = "CLARITY - SI - ORT/DCLUSTER_NTPA200_CLARITY"
        #template = "Templates/US5NP_RHEL72_GOLDEN_TEMPLATE"
        template = "Templates/US5NP_CENTOS72_GOLDEN_TEMPLATE"
        #template = "us5npkinma1301-template"
        type = "thin"
    }
#    disk {
#        datastore = "us5npfs03-nfs_fo-12.casaasnp.com:/vol/ort_code"
# on /nfs/code
#    }

    network_interface {
        label = "Standard Switches/APP-PUB"
        #label = "dvSwitch7/APP-PUB"
        ipv4_address = "10.47.32.15"
        ipv4_prefix_length = "23"
    }
    network_interface {
        label = "Standard Switches/APP-MGMT"
        #label = "dvSwitch6/APP-MGMT"
        ipv4_address = "10.47.34.15"
        ipv4_prefix_length = "23"
        ipv4_gateway = "10.242.35.196"
    }
    network_interface {
        label = "NFS-FO-SAN"
        ipv4_address = "10.47.12.10"
        ipv4_prefix_length = "23"
    }
}
