# log
This directory is intentionally world writeable, and empty. This exists to allow all users to write logs without permissions issues, while maintaining secure permissions on the rest of the files. The following files accomplish this:

ansible.cfg
Configured to put all .retry files and all ansible logs into this directory, datestamped.

.gitignore
Ignores all *.retry, ansible*.log, and log/*
