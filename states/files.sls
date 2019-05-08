Link dotfiles:
  cmd.run:
    - name: "lndir -silent {{ pillar.git_dir }}/public/dotfiles-whiteinge {{ pillar.homedir }}"
