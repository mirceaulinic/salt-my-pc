Salt my PC
==========

Manage my computer using Salt.

Usage
-----

1. Install the Salt Minion

   .. code-block:: bash

       $ apt-get install salt-minion

   .. note::

       On some system distributions this may install older versions of Salt. It 
       sometimes might be a better idea to install the Salt Minion using 
       `salt-bootstrap <https://github.com/saltstack/salt-bootstrap>`__, e.g.,

       .. code-block:: bash

         $ curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com
         ~~ check the contents of bootstrap-salt.sh ~~
         $ sudo sh bootstrap-salt.sh

2. Edit the Salt Minion configuration file: ``/etc/salt/minion``

   .. code-block:: yaml

       file_client: local

       file_roots:
         base:
           - </path/to/salt-my-pc/repo>
           - </path/to/salt-my-pc/repo>/states

       pillar_roots:
         base:
           - </path/to/salt-my-pc/repo>/pillar

3. Restart the Salt Minion service to load the changes in the configuration
   file, e.g., using systemd or your preferred service manager software:

   .. code-block:: bash

       $ systemctl restart salt-minion

3. Enjoy

   .. code-block:: bash

       $ sudo salt-call state.highstate

   .. note::

      To avoid running with sudo, simply change the owner of the directories
      ``/var/log/salt/`` and ``/var/cache/salt/``, e.g,

      .. code-block:: bash

        $ sudo chown -R /var/log/salt/
        $ sudo chown -R /var/cache/salt/
        $ salt-call test.ping

      Alternatively, you can run the ``misc`` State:

      .. code-block:: bash

        $ sudo salt-call state.apply perms
        $ salt-call test.ping
