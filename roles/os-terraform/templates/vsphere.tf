provider "vsphere" {
  user                 = "{{ tf_vsphere_user }}"
  password             = "{{ tf_vsphere_password }}"
  vsphere_server       = "{{ tf_vsphere_server }}"
  allow_unverified_ssl = "{{ tf_vsphere_allow_unverified_ssl }}"
}

resource "vsphere_virtual_machine" "{{ inventory_hostname }}" {
  name = "{{ inventory_hostname }}"
  datacenter = "{{ tf_vsphere_datacenter }}"
  cluster = "{{ tf_vsphere_cluster }}"
  resource_pool = "{{ tf_vsphere_resource_pool }}"
  vcpu = "{{ tf_vsphere_vcpu }}"
  memory = "{{ tf_vsphere_memory }}"

  domain = "{{ tf_vsphere_domain}}"
  dns_suffixes = ["{{ tf_vsphere_dns_suffixes }}"]
  dns_servers = ["{{ tf_vsphere_dns_servers }}"]
  time_zone = "{{ tf_vsphere_time_zone }}"

  disk {
    datastore = "{{ tf_vsphere_disk_datastore }}"
    template = "{{ tf_vsphere_disk_template }}"
    type = "{{ tf_vsphere_disk_type }}"
  }

  network_interface {
    label = "{{ tf_vsphere_net_label }}"
    ipv4_address = "{{ tf_vsphere_net_ipv4_address }}"
    ipv4_prefix_length = "{{ tf_vsphere_net_ipv4_prefix_length }}"
    ipv4_gateway = "{{ tf_vsphere_net_ipv4_gateway }}"
  }

#  provisioner "remote-exec" {
#    inline = [
#      "echo '{{ root_ssh_key }}' >> /root/.ssh/authorized_keys"
#    ]
#  }
}