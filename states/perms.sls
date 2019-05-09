{%- set dirs = ['/var/log/salt/', '/var/cache/salt'] %}

{%- for dir in dirs %}
Update {{ dir }} permissions:
  file.directory:
    - name: {{ dir }}
    - user: {{ pillar.user }}
    - recurse:
      - user
{%- endfor %}
