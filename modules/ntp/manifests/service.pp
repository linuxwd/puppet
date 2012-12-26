class ntp::service {
	service {"ntpd":
		ensure		=> running,
		enable		=> true,
		pattern		=> 'ntpd',
		require		=> Class['ntp::config'],
	}
}
