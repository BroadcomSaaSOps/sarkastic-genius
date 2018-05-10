# sarkastic-genius
Ansible automation
Matt.King@ca.com

## Description
This git repo is an Ansible automation framework with a collection of playbooks.
The framework supports US5, SC5, MUN, AU1, NDC, CAR, CAN, on varying levels and can be extended to support more.

## General Usage
ansible-playbook -i inventory/[env].hosts [playbook.yml] --check --extra-vars="var1=foo var2=bar" --ask-pass

where
- [env] = 3-letter environment code (au1, mun, sc5, us5, ndc, car, can, etc.)
- [playbook.yml] = filename of playbook you wish to run (os-install.yml)
- [extra-vars] = dependent on playbook, may not be used at all
    (os-install uses "os_install_terraform_destroy=true os_install_terraform_build=false")
    * Note --extra-vars accepts a space-delimited list encased in quotes.
- --ask-pass = Depending on what you're trying to accomplish, you may need to run the playbook as your user but become root
ex: ansible-playbook -i inventory/car-build.hosts os-install.yml

## Provisioning
To provision new servers using this automation, perform the following steps:  
1) ssh to the environment's respective Ansible server (us5npopsansi01,sc5opsansi01,demunopsansi01,au1opsansi01,ndcpans01,etc.)  
-   ssh us5npopsansi01

2) Change directory to the playbook  
-  cd /usr/share/ansible/sarkastic-genius

3) Create an inventory  
   (Reference examples in the 'inventory' dir)
-   cat inventory/us5.hosts
   [us5]
   us5npnewbuild1
   us5npnewbuild2
   ...
4) Create a host_vars file named after each server you want to build  
   (Reference examples in the 'host_vars' dir)


5) Run the Ansible playbook  
   ansible-playbook -i path/to/inventory os-install.yml

* Notes:  
1) Running from a shared directory means that the Terraform state files remain after execution in the /log/ dir. This can lead to servers getting destroyed and rebuilt on next execution.  
Ensure the /log/ dir contains nothing other than a README file and the ansible.log or servers may be accidentally destroyed and rebuilt!
2) You can use the existing inventory files and pass a --limit='newbuild01,newbuild02"
3) There may be file permissions issues with the /log/ dir, a consequence of using a shared ansible directory rather than a unique workspace every execution. To avoid this, you may check out the code in your homedir and run from there.  

* Recording
A demo of this provisioning can be found here:  
https://catechnologies.webex.com/catechnologies/lsr.php?RCID=822589bdb21948e88acb8e9df9e92772


## FAQ
Q: What's up with the name?

A: I'm not fantastic at naming things so I used a wu-tang name generator. The misspelling of "sarcastic" came from the generator which I liked because it is meta. Despite, or maybe even because of the typo, the name is something more memorable and less sterile than "infrastructure-ansible-automation" or similar.


## Helpful resources
1) https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet - Howto compose README.md files
2) https://rogerdudler.github.io/git-guide/ - How to use git
3) http://docs.ansible.com/ansible/latest/playbooks_variables.html - Understanding Ansible variables
