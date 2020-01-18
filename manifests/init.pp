class webserver {
    $webserver = $osfamily ? {
      'redhat' => 'httpd',
      'debian' => 'apache2',
       default => 'apache2',
       }
   package {$webserver:
       ensure => 'present',
       }
   service { $webserver:
       ensure => 'running',
       enable => true,
       }
   file { 'index.html':
       ensure => 'present',
       path => '/var/www/html/index.html',
       content => "<!doctype html>
                <title>Welcome Page</title>
                <style>
                body { text-align: center; padding: 150px; }
                h1 { font-size: 50px; }
                  body { font: 20px Helvetica, sans-serif; color: #333; }
                  article { display: block; text-align: left; width: 650px; margin: 0 auto; }
                  a { color: #dc8100; text-decoration: none; }
                  a:hover { color: #333; text-decoration: none; }
                </style>
