# php Module

## Overview

This module install and configure php server.

## Usage

Default configuration:

```puppet
include php
```

Custom configuration:

```puppet
class { 'php':
    php                 => 'YES',
    php_fpm             => 'YES',
    open_basedir        => '/var/www/',
    expose_php          => 'Off',
    error_log           => '/var/log/php_error.log',
    file_uploads        => 'On',
    upload_tmp_dir      => '/tmp',
    upload_max_filesize => '2M',
    max_file_uploads    => '20',
    post_max_size       => '8M',
    max_execution_time  => '30',
    max_input_time      => '60',
    memory_limit        => '128M',    
}
```

php-fpm configuration:

```puppet
class { 'php::php_fpm':
    user  => 'www-data',
    group => 'www-data',
}
```
