{% for user in pillar['git']['users'] %} 
/home/{{ user }}/.gitconfig:
  file.managed:
    - source: salt://git/.gitconfig
    - user: {{ user }}
    - group: {{ user }}
    - mode: 644
{% endfor %}
