.PHONY : test

EMACS ?= emacs
LOADPATH = -L .

test:
	$(EMACS) -Q -batch $(LOADPATH) \
		-l test/test.el -f ert-run-tests-batch-and-exit
