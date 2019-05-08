git_dir: {{ salt.environ.get('HOME') }}/git
git_clones:
  - source: git@github.com:mirceaulinic/salt-my-pc.git
    target: public/salt-my-pc
  - source: git@github.com:mirceaulinic/dotfiles-whiteinge.git
    target: public/dotfiles-whiteinge
  - source: git@github.com:napalm-automation/napalm.git
    target: public/napalm
  - source: git@github.com:napalm-automation/napalm-salt.git
    target: public/napalm-salt
  - source: git@github.com:napalm-automation/napalm-logs.git
    target: public/napalm-logs
  - source: git@github.com:saltstack/salt.git
    target: public/salt
  - source: git@github.com:mirceaulinic/mirceaulinic.github.io.git
    target: public/mirceaulinic.github.io
