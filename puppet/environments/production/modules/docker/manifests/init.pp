class docker{
	exec{"Instala Docker":
		command => "/usr/bin/curl https://get.docker.com/ | sh"
	}	
	
	service{'docker':
		ensure => running,
		enable => true
		require => Package['docker-ce']
	}
}
