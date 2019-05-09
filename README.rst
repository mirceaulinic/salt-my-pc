Salt my PC
==========

Manage my computer using Salt.

The idea is to keep everything simple and portable across computers, to 
replicate my development environment the way I like it, while not having 
additional dependencies or always running processes etc. The Masterless Salt 
Minion facilitates this setup, and whenever I need I can execute a Salt function 
or State using ``salt-call``.

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


   It is important to configure the fileserver to use the local client, so you
   don't need a Salt Master (i.e., you'll be running a Masterless Minion).

3. Enjoy

   .. code-block:: bash

       $ sudo salt-call state.highstate

   .. note::

      To avoid running with sudo, simply change the owner of the directories
      ``/var/log/salt/`` and ``/var/cache/salt/``, e.g,

      .. code-block:: bash

        $ sudo chown -R $USER /var/log/salt/
        $ sudo chown -R $USER /var/cache/salt/
        $ salt-call test.ping

      Alternatively, you can run the ``misc`` State:

      .. code-block:: bash

        $ sudo salt-call state.apply perms
        $ salt-call test.ping

   .. hint::

      Generally, Salt is going to install and enable the system service for the
      Minion, but you don't necessarily need to have the Minion always running
      -- you can for example disable the service, e.g.,

      .. code-block:: bash

        $ sudo systemctl disable salt-minion
        $ salt-call test.ping
