#cloud-config
package_upgrade: true
packages:
  - squid
write_files:
  - owner: root:root
    path: /etc/squid/squid.conf
    content: |
      acl localnet src 10.0.0.0/8
      
      acl SSL_ports port 443
      acl Safe_ports port 80
      acl Safe_ports port 21
      acl Safe_ports port 443
      acl Safe_ports port 70
      acl Safe_ports port 210
      acl Safe_ports port 1025-65535
      acl Safe_ports port 280
      acl Safe_ports port 488
      acl Safe_ports port 591
      acl Safe_ports port 777
      acl CONNECT method CONNECT
      
      http_access deny !Safe_ports
      http_access deny CONNECT !SSL_ports
      http_access allow localhost manager
      http_access deny manager
      http_access allow localnet
      http_access allow localhost
      http_access deny all

      http_port 3128    
          
      coredump_dir /var/cache/squid
      cache_dir ufs /var/cache/squid 1000 16 256  # 1GB as Cache
      
      refresh_pattern ^ftp: 1440 20% 10080
      refresh_pattern ^gopher: 1440 0% 1440
      refresh_pattern -i (/cgi-bin/|\?) 0 0% 0
      refresh_pattern . 0 20% 4320
  - owner: proxy:proxy
    path: /var/cache/squid/DUMMY
runcmd:
  - squid -k reconfigure   
