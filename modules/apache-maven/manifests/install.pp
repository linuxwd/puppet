class apache-maven::install {
	exec { "apache-maven-install":
		cwd		=> "/tmp",
		path		=> ["/bin/","/sbin/","/usr/bin/","/usr/sbin/","/usr/local/bin","/usr/local/sbin"],
		command		=> "tar zxf apache-maven-3.0.4-bin.tar.gz;mv apache-maven-3.0.4 /opt/;ln -sv /opt/apache-maven-3.0.4 /opt/apache-maven",
		require		=> Class["apache-maven::prepare"],
		notify		=> Class['apache-maven::config'],
	}
}
