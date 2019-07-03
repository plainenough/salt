ntp_conf:
  file.managed:
    - name: /etc/systemd/timesyncd.conf
    - source: salt://files/ntp.conf
ntp_restart:
  cmd.run: 
    - name: "systemctl restart systemd-timesyncd.service"
