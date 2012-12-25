class ssh{
	include ssh::params
	include ssh::install
	include ssh::config,ssh::service
	}

