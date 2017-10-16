provider "vsphere" {
  user                 = "CASAASNP\\pmfkey_or_serviceaccount"
  password             = "password"
  vsphere_server       = "us5npvc01"
  allow_unverified_ssl = "true"
}