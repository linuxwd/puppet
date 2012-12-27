class apache-maven {
	include apache-maven::prepare
	include apache-maven::install
	include apache-maven::config
	include apache-maven::clean-software
}

