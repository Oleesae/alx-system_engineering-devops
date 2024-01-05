class nginx_server {
    package { 'nginx':
        ensure => installed,
    }

    file { '/etc/nginx/sites-available/default':
        ensure  => file,
        content => '
            server {
                listen 80 default_server;
                listen [::]:80 default_server;

                root /var/www/html;
                index index.html index.htm index.nginx-debian.html;

                server_name _;

                location / {
                    try_files $uri $uri/ =404;
                }

                location /redirect_me {
                    return 301 http://google.com/;
                }

                error_page 404 /404.html;
                location = /404.html {
                    root /usr/share/nginx/html;
                    internal;
                }
            }
        ',
        require => Package['nginx'],
        notify  => Service['nginx'],
    }

    service { 'nginx':
        ensure    => running,
        enable    => true,
        subscribe => File['/etc/nginx/sites-available/default'],
    }
}

include nginx_server