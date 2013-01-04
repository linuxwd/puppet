class mongodb::clean-software {
	exec { "clean_software":
		cwd		=> "/tmp",
		path		=> ["/bin/","/sbin/","/usr/bin/","/usr/sbin/","/usr/local/bin/","/usr/local/sbin/"],
		command		=> 'rm -rf mongodb*',
		require		=> Class["mongodb::config"],
		notify		=> Class["mongodb::service"],
	}
}
