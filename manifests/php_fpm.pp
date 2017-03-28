class php::php_fpm (
  $package_name_fpm               = $::php::params::package_name_fpm,
  $configfile_wwwconf             = $::php::params::configfile_wwwconf,
  $template_wwwconf               = 'php/www.conf.erb',
  $user                           = undef,
  $group                          = undef,
  $listen                         = undef,
  $listen_owner                   = undef,
  $listen_group                   = undef,
  $listen_allowed_clients         = undef,
  $pm                             = undef,
  $pm_max_children                = undef,
  $pm_start_servers               = undef,
  $pm_min_spare_servers           = undef,
  $pm_max_spare_servers           = undef,
  $slowlog                        = undef,
  $chdir                          = undef,
  $php_admin_value_error_log      = undef,
  $php_admin_flag_log_errors      = undef,
  $php_value_session_save_handler = undef,
  $php_value_session_save_path    = undef,
  $php_value_soap_wsdl_cache_dir  = undef,
) inherits ::php::params {
  file { $configfile_wwwconf:
    require => package[$package_name_fpm],
    backup  => '.backup',
    content => template($template_wwwconf),
  }
}
