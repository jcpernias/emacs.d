SHELL := /bin/sh

INSTALL := /usr/bin/install

-include local.mk

dotemacsdir := $(HOME)/.emacs.d
elispdir := $(dotemacsdir)/elisp


lispfiles := \
	early-init.el \
	init.el \
	$(wildcard elisp/*.el)

all_deps := \
	$(addprefix $(dotemacsdir)/,$(lispfiles))



all: $(all_deps)


$(dotemacsdir)/%: ./% | installdirs
	$(INSTALL) -m 0644 -T $< $@


.PHONY:
installdirs: $(dotemacsdir) $(elispdir)

$(dotemacsdir):
	$(INSTALL) -m 0755 -d $@

$(elispdir):
	$(INSTALL) -m 0755 -d $@

clean:
	-@$(RM) -rf $(dotemacsdir)

veryclean: clean
