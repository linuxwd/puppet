class redis::install {
	exec { "redis-install":
		cwd		=> "/tmp",
		path		=> ["/bin/","/sbin/","/usr/bin/","/usr/sbin/","/usr/local/bin","/usr/local/sbin"],
		command		=> "tar -zxf redis-2.6.7.tar.gz;
				cd redis-2.6.7;
				make -j4;
				make PREFIX=/opt/redis install;
				",
		require		=> Class["redis::prepare"],
		notify		=> Class['redis::config'],
	}
}
