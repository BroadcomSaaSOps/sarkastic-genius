# sarkastic-genius
Ansible automation
Matt.King@ca.com

## Usage
ansible-playbook -i inventory/<env>.hosts <playbook.yml> --check --tags="<tags>" --ask-pass
- where -
<env> = 3-letter environment code (au1, mun, sc5, us5, etc.)
<playbook.yml> = filename of playbook you wish to run (os-install-terraform.yml)
<tags> = dependent on playbook, (destroy, build)

## FAQ
Q: What's up with the name?
A: I'm not fantastic at naming things so I used a wu-tang name generator. The misspelling of "sarcastic" came from the generator and I liked because it is meta. Despite, or maybe even because of the typo, the name is something more memorable and less sterile than "infrastructure-ansible-automation" or similar.

## More
1) https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet
