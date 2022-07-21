# make sure to kill all nginx before start
killall nginx

CWD=$(pwd)

nginx -p "$CWD/scripts/nginx" -c "$CWD/scripts/nginx/web.proxy.dev.conf"