{%- set ssh_keyfile = pillar.homedir ~ '/.ssh/id_' ~ pillar.ssh_key_type %}

{%- if not salt.file.file_exists(ssh_keyfile) %}
Gen SSH key:
  cmd.run:
    - name: ssh-keygen -t {{ pillar.ssh_key_type }} -f {{ ssh_keyfile }} -P {{ pillar.ssh_key_passphrase }}
{%- endif %}

{%- for known_host in pillar.ssh_known_hosts %}
{{ known_host }} is known host:
  ssh_known_hosts.present:
    - name: {{ known_host }}
    - user: {{ pillar.user }}
{%- endfor %}
