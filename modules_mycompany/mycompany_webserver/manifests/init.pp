# == Class: mycompany_webserver
#
# classes to run for the webserver role
# class parameters can be coded here or resolved via the hiera parameter hierachy
#
class mycompany_webserver
{

	# call apache class
 	# class { 'apache': }

 	package { ['python3-pip']:
      ensure => installed,
 	}

	package { ['python-pip']:
	  ensure => installed,
	}

	# package { 'pip':
	#   require  => Package['python-pip'],
	#   ensure   => latest,
	#   provider => 'pip',
	# }

	# package { ['python-devel', 'openssl-devel', 'libffi-devel']:
	#   ensure => installed,
	# }

	# need 
	#
    # export LC_ALL=C


	package { 'zstandard':
	  ensure   => '0.11.1',
	  # require  => Package['python-pip', 'python-devel', 'openssl-devel', 'libffi-devel'],
	  package => pip
	}

	# https://stackoverflow.com/questions/44439763/puppet-installing-pip-rather-than-pip3-packages-using-the-pip3-provider-only-on
	package { 'zstandard':
	  ensure   => '0.11.1',
	  # require  => Package['python-pip', 'python-devel', 'openssl-devel', 'libffi-devel'],
	  package => pip3
	}

}
