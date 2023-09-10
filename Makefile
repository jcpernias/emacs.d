SHELL := /bin/sh

INSTALL := /usr/bin/install

-include local.mk

dotemacsdir := $(HOME)/.emacs.d
elispdir := $(dotemacsdir)/elisp

snippetsdir := $(dotemacsdir)/snippets
orgsnippetsdir := $(snippetsdir)/org-mode


lispfiles := \
	early-init.el \
	init.el \
	$(wildcard elisp/*.el)

orgsnippets := $(wildcard snippets/org-mode/*)

all_deps := \
	$(addprefix $(dotemacsdir)/,$(lispfiles)) \
	$(addprefix $(dotemacsdir)/,$(orgsnippets))

all: $(all_deps)


$(dotemacsdir)/%: ./% | installdirs
	$(INSTALL) -m 0644 -T $< $@


.PHONY:
installdirs: $(elispdir) $(orgsnippetsdir)

$(dotemacsdir):
	$(INSTALL) -m 0755 -d $@

$(elispdir): | $(dotemacsdir)
	$(INSTALL) -m 0755 -d $@

$(snippetsdir):
	$(INSTALL) -m 0755 -d $@

$(orgsnippetsdir): | $(snippetsdir)
	$(INSTALL) -m 0755 -d $@

clean:
	-@$(RM) -rf $(dotemacsdir)

veryclean: clean
