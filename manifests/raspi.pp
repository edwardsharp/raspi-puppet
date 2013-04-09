#class users {
	
	user { 'edward':
	  ensure     => 'present',
  	managehome => true,
  	shell => '/bin/bash',
  	groups => 'sudo',
	}

	file { '/home/edward/.ssh':
	    ensure => 'directory',
	    require => User['edward'],
	    owner => 'edward',
	    mode => '700',
	}

	# now load up the key...
	# see http://reductivelabs.com/trac/puppet/wiki/TypeReference#ssh-authorized-key
	ssh_authorized_key { 'edward_dsa_key':
	   ensure => 'present',
	   key => 'AAAAB3NzaC1kc3MAAACBAJd0cq7o+5DpD/bNumsTRFKJzTPfORWJOKNixCCfhlAnPBUu3tKwP5AdvrObdx9F5rf9qPBjf5LOozO52XtLrbQttQjEPP/3u3sjtFDDdxZbObyrX7eCxVER8d5thCCiKfWRfskS+w/2vgjBZr98YeyzcnVLSg14jX1V1oUUnKnXAAAAFQDI4yucjaRorGUjXQSN9t5YjbOJ7QAAAIAxIR7NTt1RUXeuMe6a+P9h2pRRiSB0LJS3ajIhqBm/CVNUDONHAlOmiLI3Oo3zY9PZWneStHaIQb8O5qzjlMFl+KjcXEhwWB+FaQ+VHKr5UHLM2Dn4KWzW7cHUbKGAfLEfidBsQvhYKVGyVnw3jgeD6zQWyMYZxDaDvRHeD6mNGgAAAIEAkwulRW1hZhjEB0jWS2R0GDGdGDhHJTHem30/cRMqmXOpIigelYzPztqrS93E8jnvIfbLeqID1QAqqDmbFoelW1YIB79TqtKA3ufXyWtN7t7YyuFZZNjctT6ll72nh757Vj0FU4kV1rebmXYlThqEqKHivkFGLddWktA53thNqBM=',
	   type => 'ssh-dsa',
	   user => 'edward',
	   require => File['/home/edward/.ssh'],
	}

	
#}

	