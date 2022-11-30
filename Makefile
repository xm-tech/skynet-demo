platform = macosx

build:
	cd 3rd/skynet && make $(platform)

run:
	./3rd/skynet/skynet ./server/config

run_mysql:
	./3rd/skynet/skynet ./server/config.mysql

clean:
	cd 3rd/skynet && make clean
