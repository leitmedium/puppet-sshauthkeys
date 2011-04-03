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

sshauthkeys is a simple define based wrapper. It expects a nested hashmap named "$ssh_keys" containing your ssh keys (see example below). Each key needs an identifier (an email address is fine), a type (ssh-rsa/ssh-dsa) and the key itself (without the comment part).

sshauthkeys defines the key(s) for a user. You can call it with the name of single key or with an array containing multiple key identifiers.

   # declare ssh keys for later usage
   $ssh_keys = {
           "admin@domain.tld" => {
                   "type" => "ssh-rsa",
                   "key" => "key-content", },
           "user@domain.tld" => {
                   "type" => "ssh-dsa",
                   "key" => "key-content", },
           "user2@domain.tld" => {
                   "type" => "ssh-dsa",
                   "key" => "key-content", },
   }
   # just enroll one key for root user
   sshauthkeys{ root: keys => 'admin@domain.tld' }
   # enroll multiple keys for a user
   sshauthkeys{ user: keys => [ 'admin@domain.tld','user@domain.tld'] }
   # if you want to reuse a team, make it an array for multiple defines 
   $team = [ 'admin@domain.tld', 'user2@domain.tld' ]
   sshauthkeys{ user2: keys => [ $team ] }
   sshauthkeys{ user3: keys => [ $team ] }

Please note: sshauthkeys is define based so you can only call "sshauthkeys" for a user exactly once. If you want to enroll multiple keys for one user you have to put them in an array to make sure you only need one sshauthkeys call. 

Todo
---

There is already support for "absent" keys by calling sshauthkeys like

        sshauthkeys{ root: keys => 'admin@domain.tld', ensure: 'absent' }

Currently you cannot mix absent and present keys besides not being able to call sshauthkeys more than one time for a user - so this feature is quite useless yet.
	


