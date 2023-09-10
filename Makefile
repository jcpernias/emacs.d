SHELL := /bin/sh

INSTALL := /usr/bin/install

-include local.mk

dotemacsdir := $(HOME)/.emacs.d
elispdir := $(dotemacsdir)/elisp

auctexdir := $(dotemacsdir)/auctex-styles

snippetsdir := $(dotemacsdir)/snippets
orgsnippetsdir := $(snippetsdir)/org-mode


lispfiles := \
	early-init.el \
	init.el \
	$(wildcard elisp/*.el)

orgsnippets := $(wildcard snippets/org-mode/*)

auctexfiles := $(wildcard auctex-styles/*)

all_deps := \
	$(addprefix $(dotemacsdir)/,$(lispfiles)) \
	$(addprefix $(dotemacsdir)/,$(orgsnippets)) \
	$(addprefix $(dotemacsdir)/,$(auctexfiles))

all: $(all_deps)


$(dotemacsdir)/%: ./% | installdirs
	$(INSTALL) -m 0644 -T $< $@


.PHONY:
installdirs: $(elispdir) $(auctexdir) $(orgsnippetsdir)

$(dotemacsdir):
	$(INSTALL) -m 0755 -d $@

$(elispdir): | $(dotemacsdir)
	$(INSTALL) -m 0755 -d $@

$(auctexdir): | $(dotemacsdir)
	$(INSTALL) -m 0755 -d $@

$(snippetsdir):
	$(INSTALL) -m 0755 -d $@

$(orgsnippetsdir): | $(snippetsdir)
	$(INSTALL) -m 0755 -d $@

clean:
	-@$(RM) -rf $(dotemacsdir)

veryclean: clean
