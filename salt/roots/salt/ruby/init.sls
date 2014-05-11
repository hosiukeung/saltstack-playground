rbenv-deps:
  pkg.installed:
    - pkgs:
      - openssl
      - autoconf
      - bison
      - build-essential
      - libssl-dev
      - libyaml-dev
      - libreadline6
      - libreadline6-dev
      - zlib1g
      - zlib1g-dev
      - libssl-dev

{% for user in pillar['ruby']['users'] %}
ruby-2.0.0-p247:
  rbenv.installed:
    - default: True
    - user: {{ user }}
    - pkg: rbenv-deps
{% endfor %}

{% for user in pillar['ruby']['users'] %}
blockreplace-rbenv-bashrc:
  file.blockreplace:
    - name: /home/{{ user }}/.bashrc
    - marker_start: "# START rbenv"
    - marker_end: "# END rbenv"
    - show_changes: True
    - append_if_not_found: True
    - user: {{ user }}
    - require:
      - rbenv: ruby-2.0.0-p247
{% endfor %}

{% for user in pillar['ruby']['users'] %}
rbenv-bashrc:
  file.accumulated:
    - filename: /home/{{ user }}/.bashrc
    - text: | 
        export PATH="$HOME/.rbenv/bin:$PATH"; eval "$(rbenv init -)";
    - user: {{ user }}
    - require_in:
        - file: blockreplace-rbenv-bashrc
{% endfor %}

{% for user in pillar['git']['users'] %}
/home/{{ user }}/.gemrc:
  file.managed:
    - source: salt://ruby/.gemrc
    - user: {{ user }}
    - group: {{ user }}
    - mode: 644
{% endfor %}
