class apache-ant::install {
	exec { "apache-ant-install":
		cwd		=> "/tmp",
		path		=> ["/bin/","/sbin/","/usr/bin/","/usr/sbin/","/usr/local/bin","/usr/local/sbin"],
		command		=> "tar -zxf apache-ant-1.8.4-bin.tar.gz;mv apache-ant-1.8.4 /opt/;ln -sv /opt/apache-ant-1.8.4 /opt/apache-ant",
		require		=> Class["apache-ant::prepare"],
		notify		=> Class['apache-ant::config'],
	}
}
