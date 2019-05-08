user: {{ salt.environ.get('SUDO_USER', salt.environ.get('USERNAME')) }}
homedir: {{ salt.environ.get('HOME') }}
ssh_key_type: ed25519
