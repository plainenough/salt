ntp_conf:
  file.managed:
    - name: /etc/systemd/timesyncd.conf
    - source: salt://files/ntp.conf
    - stateful: True
ntp_service:
  service.running: 
    - name: "systemd-timesyncd.service"
    - watch:
      - /etc/systemd/timesyncd.conf
    - restart: True
