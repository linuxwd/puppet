class sudo::config {
	File {
		owner		=> "root",
		group		=> "root",
		mode		=> 0440,
		require		=> Class['sudo::install'],
	}
	file { "/etc/sudoers":
		source		=> "puppet://$puppetserver/modules/sudo/etc/sudoers",
		}
}
