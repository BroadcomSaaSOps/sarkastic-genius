resource "vsphere_virtual_machine" "{{ inventory_hostname }}" {
  name = "{{ inventory_hostname }}"
  datacenter = "{{ tf_vsphere_datacenter }}"
  cluster = "{{ tf_vsphere_cluster }}"
{% if tf_vsphere_resource_pool is defined %}
  resource_pool = "{{ tf_vsphere_resource_pool }}"
{% endif %}
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

{% if tf_vsphere_net_eth0_label is defined %}
  network_interface {
    label = "{{ tf_vsphere_net_eth0_label }}"
    ipv4_address = "{{ tf_vsphere_net_eth0_ipv4_address }}"
    ipv4_prefix_length = "{{ tf_vsphere_net_eth0_ipv4_prefix_length }}"
{% if tf_vsphere_net_eth0_ipv4_gateway is defined %}
    ipv4_gateway = "{{ tf_vsphere_net_eth0_ipv4_gateway }}"
{% endif %}
  }
{% endif %}

{% if tf_vsphere_net_eth1_label is defined %}
  network_interface {
    label = "{{ tf_vsphere_net_eth1_label }}"
    ipv4_address = "{{ tf_vsphere_net_eth1_ipv4_address }}"
    ipv4_prefix_length = "{{ tf_vsphere_net_eth1_ipv4_prefix_length }}"
    {% if tf_vsphere_net_eth1_ipv4_gateway is defined %}
    ipv4_gateway = "{{ tf_vsphere_net_eth1_ipv4_gateway }}"
    {% endif %}
  }
  {% endif %}

  {% if tf_vsphere_net_eth2_label is defined %}
  network_interface {
    label = "{{ tf_vsphere_net_eth2_label }}"
    ipv4_address = "{{ tf_vsphere_net_eth2_ipv4_address }}"
    ipv4_prefix_length = "{{ tf_vsphere_net_eth2_ipv4_prefix_length }}"
    {% if tf_vsphere_net_eth2_ipv4_gateway is defined %}
    ipv4_gateway = "{{ tf_vsphere_net_eth2_ipv4_gateway }}"
    {% endif %}
  }
  {% endif %}

}