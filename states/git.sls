Create git dir:
  file.directory:
    - name: {{ pillar.git_dir }}
    - user: {{ pillar.user }}

{%- for git_clone in pillar.git_clones %}
Clone {{ git_clone.source }}:
  git.cloned:
    - name: {{ git_clone.source }}
    - target: {{ pillar.git_dir }}/{{ git_clone.target }}
{%- endfor %}
