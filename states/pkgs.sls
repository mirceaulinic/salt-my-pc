{%- for pkg in pillar.pkgs %}
Install {{ pkg }}:
  pkg.installed:
    - name: {{ pkg }}
{%- endfor %}
