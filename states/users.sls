{% import_yaml "user_map.yaml" as users %}
{% if users['present'] %}
{% for user in users['present'] %}
{{ user }}:
  user.present:
    - shell: /bin/bash
    - home: /home/{{ user }}
  ssh_auth.present:
    - user: {{ user }}
    - source: salt://keys/{{ user }}
{% endfor %}
{% endif %}


{% if users['absent'] %}
{% for user in users['absent'] %}
{{ user }}_absent:
  user.absent:
    - name: {{ user }}
    - purge: true
    - force: true
{% endfor %}
{% endif %}
