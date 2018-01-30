provider "vsphere" {
  user                 = "{{ tf_vsphere_user }}"
  password             = "{{ tf_vsphere_password }}"
  vsphere_server       = "{{ tf_vsphere_server }}"
  allow_unverified_ssl = "{{ tf_vsphere_allow_unverified_ssl }}"
  version              = "~> 0.4"
}