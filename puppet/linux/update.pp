exec { "add dkms":
  command => "/usr/bin/apt-get update; /usr/bin/apt-get install build-essential module-assistant virtualbox-guest-dkms dkms linux-headers-$(uname -r) -y",
  timeout => 3600
}
-> exec { "add virtualbox x11 driver":
  command => "/usr/bin/apt-get install -y -o Dpkg::Options::='--force-confnew' virtualbox-guest-x11",
}
-> exec { "apt-update":
  command => "/usr/bin/apt-get update; /usr/bin/apt-get upgrade -y; /usr/bin/apt-get dist-upgrade -y",
  timeout => 3600
}
-> exec { "Disable the existing virtualbox service":
  command => "/bin/systemctl disable vboxadd-service",
  onlyif => "/usr/bin/test -f /lib/systemd/system/vboxadd-service.service"
}