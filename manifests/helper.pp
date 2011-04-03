define sshauthkeys::helper ($user,$ensure='present') {
        notice ("${name}")
        $name2=regsubst($name,"-${user}\$","")
        notice ("${name2}")
        ssh_authorized_key { "puppet: ${name2} ${user}":
          ensure => $ensure,
          type => $ssh_keys["${name2}"]["type"],
          key => $ssh_keys["${name2}"]["key"],
          user => "${user}"
        }
}

