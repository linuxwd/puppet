class redis::clean-software {
	exec { "clean_software":
		cwd		=> "/tmp",
		path		=> ["/bin/","/sbin/","/usr/bin/","/usr/sbin/","/usr/local/bin/","/usr/local/sbin/"],
		command		=> 'rm -rf redis*',
		require		=> Class["redis::config"],
		notify		=> Class["redis::service"],
	}
}
