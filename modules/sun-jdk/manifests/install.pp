class sun-jdk::install {
	exec { "install-jdk":
		cwd		=> "/tmp",
		path		=> [ "/bin/","/sbin/","/usr/bin/","/usr/sbin/","/usr/local/bin","/usr/local/sbin"],
		command		=> "echo \"\\n\"|/bin/bash jdk-6u38-linux-x64-rpm.bin",
		require		=> Class["sun-jdk::prepare"],
		notify		=> Class['sun-jdk::config'],
	}
}
