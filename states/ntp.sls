ntp_conf:
  file.managed:
    - name: /etc/systemd/timesyncd.conf
    - source: salt://files/ntp.conf