platform = macosx

skynet:
	cd 3rd/skynet && make $(platform)

run:
	./3rd/skynet/skynet config

clean:
	cd 3rd/skynet && make clean
