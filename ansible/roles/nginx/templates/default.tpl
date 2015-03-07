server {

    listen       80;
    server_name  ezp.dev www.ezp.dev;

    root {{ doc_root }};

    include ez_params.d/ez_prod_rewrite_params;

    # ez rewrite rules
    include ez_params.d/ez_rewrite_params;

    location / {
        location ~ ^/(index|index_(rest|cluster|treemenu_tags))\.php(/|$) {
        include ez_params.d/ez_fastcgi_params;

        # FPM socket
        fastcgi_pass unix:/var/run/php5-fpm.sock;

        }
    }

access_log {{ doc_root }}/ezpublish/logs/httpd-access.log;
error_log  {{ doc_root }}/ezpublish/logs/httpd-error.log notice;

include ez_params.d/ez_server_params;
}
