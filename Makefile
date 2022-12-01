platform := macosx

build:
	cd 3rd/skynet && make $(platform)

update3rd:
	# rm -rf 3rd/skynet && rm -rf 3rd/openssl
	git submodule add git@github.com:cloudwu/skynet.git 3rd/skynet
	git submodule add git@github.com:xm-tech/openssl.git 3rd/openssl

	git submodule update --init --recursive
run:
	./3rd/skynet/skynet ./server/config

run_mysql:
	./3rd/skynet/skynet ./server/config.mysql

clean:
	cd 3rd/skynet && make clean
