platform = macosx

build:
	cd 3rd/skynet && make $(platform)

run:
	./3rd/skynet/skynet ./server/config

clean:
	cd 3rd/skynet && make clean
