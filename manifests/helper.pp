define sshauthkeys::helper ($user,$ensure='present') {
        notice ("${name}")
        $name2=regsubst($name,"-${user}\$","")
        notice ("${name2}")
	if has_key($ssh_keys["${name2}"], "ensure") {
		$ensurekey = $ssh_keys["${name2}"]["ensure"]
	} else {
		$ensurekey = "present"
	}
        ssh_authorized_key { "puppet: ${name2} ${user}":
          ensure => $ensurekey,
          type => $ssh_keys["${name2}"]["type"],
          key => $ssh_keys["${name2}"]["key"],
          user => "${user}"
        }
}

