class mongodb::install {
	exec { "mongodb-install":
		cwd		=> "/tmp",
		path		=> ["/bin/","/sbin/","/usr/bin/","/usr/sbin/","/usr/local/bin","/usr/local/sbin"],
		command		=> "tar -zxvf mongodb-linux-x86_64-2.2.2.tgz;
				mv mongodb-linux-x86_64-2.2.2 /opt/;
				mv /opt/mongodb-linux-x86_64-2.2.2 /opt/mongodb
				",
		require		=> Class["mongodb::prepare"],
		notify		=> Class['mongodb::config'],
	}
}
