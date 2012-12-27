class sun-jdk::clean-software {
	exec { "clean_software":
		cwd             => "/tmp",
		path		=> [ "/bin/","/sbin/","/usr/bin/","/usr/sbin/","/usr/local/bin","/usr/local/sbin/"],
		command         => 'rm -rf jdk-6u38-linux-x64-rpm.bin sun-javadb-* jdk-6u38-linux-amd64.rpm',
#		command         => 'rm -rf sun-javadb-*',
#		command         => 'rm -rf jdk-6u38-linux-amd64.rpm',
		require         => Class["sun-jdk::config"],
	}
}
