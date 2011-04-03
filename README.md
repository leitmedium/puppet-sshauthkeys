sshauthkeys
===

sshauthkeys is a simple and lightweight wrapper for puppet's ssh_auth_keyfile. It allows you to easily add one ssh auth key to multiple login users and keep your configution clean.

Installation
---

Put the project in your puppet's modules directory and make sure it's named "sshauthkeys". E.g.:

   $ cd /etc/puppet/modules
   $ git clone git://github.com/damokles/puppet-sshauthkeys.git sshauthkeys


Usage
---

sshauthkeys is a simple define based wrapper.


        $ssh_keys = {
                "admin@domain.tld" => {
                        "type" => "ssh-rsa",
                        "key" => "key-content", },
                "user@domain.tld" => {
                        "type" => "ssh-dsa",
                        "key" => "key-content", },
        }
        sshauthkeys{ root: keys => 'admin@domain.tld' }
        sshauthkeys{ root: keys => 'user@domain.tld', ensure => 'absent' }
        sshauthkeys{ user: keys => [ 'admin@domain.tld','user@domain.tld'] }



