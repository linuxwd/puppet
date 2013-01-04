class mongodb {
	include mongodb::prepare
	include mongodb::install
	include mongodb::config
	include mongodb::clean-software
	include mongodb::service
}

