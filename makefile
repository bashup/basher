test:
	bats tests

.PHONY: test vendor


# The bootstrap script adds basher's physical directory to PATH:
# It is built from bashup/realpaths + libexec/basher.stub

BOOTSTRAP=libexec/basher.realpath

vendor: $(BOOTSTRAP)

$(BOOTSTRAP): vendor/bashup/realpaths/realpaths libexec/basher.stub
	sed -e '2i\
	# This file is automatically generated by `make vendor`; do not edit!' $^ >$@
	chmod +x $@
