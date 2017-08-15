class php::version (
  $php_version = undef,
){
  if $::osfamily == 'Debian' {
    if $php_version == '7.1' {
      $ver = true
      $package_name = [ 'php7.1', 'libapache2-mod-php7.1' ]
      $package_name_fpm = [ 'php7.1-fpm' ]
      $configfile = '/etc/php/7.1/apache2/php.ini'
      $configfile_fpm = '/etc/php/7.1/fpm/php.ini'
      $configfile_wwwconf = '/etc/php/7.1/fpm/pool.d/www.conf'
    }
    elsif $php_version == '5.6' {
      $ver = true
      $package_name = [ 'php5.6', 'libapache2-mod-php5.6' ]
      $package_name_fpm = [ 'php5.6-fpm' ]
      $configfile = '/etc/php/5.6/apache2/php.ini'
      $configfile_fpm = '/etc/php/5.6/fpm/php.ini'
      $configfile_wwwconf = '/etc/php/5.6/fpm/pool.d/www.conf'
    }
    else {
      $ver = undef
    }
  }
}
