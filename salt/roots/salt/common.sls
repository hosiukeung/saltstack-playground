common-tools:
  pkg.installed:
    - pkgs:
      - bash
      - openssl
      - curl
      - autoconf
      - build-essential
      - subversion
      - git
      - ntp
      - python-software-properties

monitoring-tools:
  pkg.installed:
    - pkgs:
      - command-not-found
      - htop
      - iftop
      - iotop
      - sysstat
      - tmux
      - fail2ban
