Simple sshd service running on alpine.

* Disables root login and password-based logins
* Allows only key-based login
* Auto-creates an unpriviliged `visitor` user upon launch
* Reads authorized_keys from `/authorized_keys` (friendly to swarm configs)
