
default:	build

clean:
	rm -rf Makefile objs

build:
	$(MAKE) -f objs/Makefile

install:
	$(MAKE) -f objs/Makefile install

modules:
	$(MAKE) -f objs/Makefile modules

upgrade:
	/home/minimal/nginx/sbin/nginx -t

	kill -USR2 `cat /home/minimal/nginx/logs/nginx.pid`
	sleep 1
	test -f /home/minimal/nginx/logs/nginx.pid.oldbin

	kill -QUIT `cat /home/minimal/nginx/logs/nginx.pid.oldbin`
