ntp_conf:
  file.managed:
    - name: /etc/systemd/timesyncd.conf
    - source: salt://files/ntp.conf
    - stateful: True
ntp_restart:
  cmd.run: 
    - name: "systemctl restart systemd-timesyncd.service"
    - onchanges:
      - cmd: ntp_conf
