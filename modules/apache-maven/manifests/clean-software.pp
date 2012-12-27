class apache-maven::clean-software {
	exec { "clean_software":
		cwd		=> "/tmp",
		path		=> ["/bin/","/sbin/","/usr/bin/","/usr/sbin/","/usr/local/bin/","/usr/local/sbin/"],
		command		=> 'rm -rf apache-maven*',
		require		=> Class["apache-maven::config"],
	}
}
