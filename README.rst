Salt my PC
==========

Manage my computer using Salt.

Usage
-----

1. Install the Salt Minion

.. code-block:: bash

    apt-get install salt-minion


2. Edit /etc/salt/minion

.. code-block:: yaml

    file_client: local

    file_roots:
      base:
        - </path/to/salt-my-pc/repo>
        - </path/to/salt-my-pc/repo>/states

    pillar_roots:
      base:
        - </path/to/salt-my-pc/repo>/pillar

3. Restart the Salt Minion service, e.g.,

.. code-block:: bash

    systemctl restart salt-minion

3. Enjoy

.. code-block:: bash

    salt-call state.highstate
