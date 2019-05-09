{%- set ssh_keyfile = pillar.homedir ~ '/.ssh/id_' ~ pillar.ssh_key_type %}

{%- if not salt.file.file_exists(ssh_keyfile) %}
  {%- if not pillar.get('ssh_key_passphrase') %}
Please set the ssh_key_passphrase field into the Pillar, or pass it via the CLI to generate the SSH key:
  test.fail_without_changes
  {%- else %}
Gen SSH key:
  cmd.run:
    - name: ssh-keygen -t {{ pillar.ssh_key_type }} -f {{ ssh_keyfile }} -P {{ pillar.ssh_key_passphrase }}

Change SSH key perms:
  file.managed:
    - name: {{ ssh_keyfile }}
    - user: {{ pillar.user }}
    - replace: false
    - require:
      - Gen SSH key

Change SSH key pub perms:
  file.managed:
    - name: {{ ssh_keyfile }}.pub
    - user: {{ pillar.user }}
    - replace: false
    - require:
      - Gen SSH key
  {%- endif %}
{%- endif %}

{%- for known_host in pillar.ssh_known_hosts %}
{{ known_host }} is known host:
  ssh_known_hosts.present:
    - name: {{ known_host }}
    - user: {{ pillar.user }}
{%- endfor %}
