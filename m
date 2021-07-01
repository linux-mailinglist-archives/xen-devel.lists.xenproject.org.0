Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E25F3B95A6
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 19:43:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149008.275421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lz0ia-0007rh-KZ; Thu, 01 Jul 2021 17:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149008.275421; Thu, 01 Jul 2021 17:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lz0ia-0007pE-H1; Thu, 01 Jul 2021 17:43:16 +0000
Received: by outflank-mailman (input) for mailman id 149008;
 Thu, 01 Jul 2021 17:43:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uD8v=LZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lz0iY-0007os-RA
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 17:43:14 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce647b15-da93-11eb-835a-12813bfff9fa;
 Thu, 01 Jul 2021 17:43:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 960E9613CF;
 Thu,  1 Jul 2021 17:43:11 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ce647b15-da93-11eb-835a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625161392;
	bh=n3cChlAKPWbsfGn3St/MEGP7YDIKX5dMWBEnm3z0uGI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZQVoGOWLkJlm7to26A7enQV1QMXZY4dVC6mwxEd1WOf1hkO5JBQ17zABeMU4T4kqO
	 oHX1C+mIJmu+Wlpv7GiIRfmsWUD5Vx1ceAbx1z5MKykhtjtW8mgPP6I4K5MbiGRV7C
	 fGwSJHIo9euM/qgihWrsClb12IEbKylyPM1h+vh1chABxhZNazTtlr1BftYJbRPJ0s
	 TpgcOPX4aqHsCT8xFmZkbSXQbYoOQTklnUIT5UVGL+wDxKNZFad53XX1Xf3udR20k+
	 ThnqldElZvrw7HgZhfAqcTozT0Y6Q/V+yxCNIL0QAAu8ZHzkuvWgc+VuoYR10ZGkps
	 Ab121NZ+6hKOQ==
Date: Thu, 1 Jul 2021 10:43:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 7/9] docs: Change Makefile and sphinx configuration
 for doxygen
In-Reply-To: <1FC1E8DF-8AED-4ABD-BE9A-DBBD9D66EDBB@arm.com>
Message-ID: <alpine.DEB.2.21.2107011037580.9437@sstabellini-ThinkPad-T480s>
References: <20210510084105.17108-1-luca.fancellu@arm.com> <20210510084105.17108-8-luca.fancellu@arm.com> <alpine.DEB.2.21.2106231506040.24906@sstabellini-ThinkPad-T480s> <1FC1E8DF-8AED-4ABD-BE9A-DBBD9D66EDBB@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-683733543-1625161391=:9437"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-683733543-1625161391=:9437
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 1 Jul 2021, Luca Fancellu wrote:
> > On 24 Jun 2021, at 00:33, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Mon, 10 May 2021, Luca Fancellu wrote:
> >> Modify docs/Makefile to call doxygen and generate sphinx
> >> html documentation given the doxygen XML output.
> >> 
> >> Modify docs/conf.py sphinx configuration file to setup
> >> the breathe extension that works as bridge between
> >> sphinx and doxygen.
> >> 
> >> Add some files to the .gitignore to ignore some
> >> generated files for doxygen.
> >> 
> >> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> >> ---
> >> .gitignore    |  6 ++++++
> >> docs/Makefile | 42 +++++++++++++++++++++++++++++++++++++++---
> >> docs/conf.py  | 48 +++++++++++++++++++++++++++++++++++++++++++++---
> >> 3 files changed, 90 insertions(+), 6 deletions(-)
> >> 
> >> diff --git a/.gitignore b/.gitignore
> >> index 1c2fa1530b..d271e0ce6a 100644
> >> --- a/.gitignore
> >> +++ b/.gitignore
> >> @@ -58,6 +58,12 @@ docs/man7/
> >> docs/man8/
> >> docs/pdf/
> >> docs/txt/
> >> +docs/doxygen-output
> >> +docs/sphinx
> >> +docs/xen.doxyfile
> >> +docs/xen.doxyfile.tmp
> >> +docs/xen-doxygen/doxygen_include.h
> >> +docs/xen-doxygen/doxygen_include.h.tmp
> >> extras/mini-os*
> >> install/*
> >> stubdom/*-minios-config.mk
> >> diff --git a/docs/Makefile b/docs/Makefile
> >> index 8de1efb6f5..2f784c36ce 100644
> >> --- a/docs/Makefile
> >> +++ b/docs/Makefile
> >> @@ -17,6 +17,18 @@ TXTSRC-y := $(sort $(shell find misc -name '*.txt' -print))
> >> 
> >> PANDOCSRC-y := $(sort $(shell find designs/ features/ misc/ process/ specs/ \( -name '*.pandoc' -o -name '*.md' \) -print))
> >> 
> >> +# Directory in which the doxygen documentation is created
> >> +# This must be kept in sync with breathe_projects value in conf.py
> >> +DOXYGEN_OUTPUT = doxygen-output
> >> +
> >> +# Doxygen input headers from xen-doxygen/doxy_input.list file
> >> +DOXY_LIST_SOURCES != cat "xen-doxygen/doxy_input.list"
> >> +DOXY_LIST_SOURCES := $(realpath $(addprefix $(XEN_ROOT)/,$(DOXY_LIST_SOURCES)))
> 
> Hi Stefano,
> 
> > 
> > I cannot find exactly who is populating doxy_input.list. I can see it is
> > empty in patch #6. Does it get populated during the build?
> 
> doxy_input.list is the only file that should be modified by the developer when he/she wants to add documentation
> for a new file to be parsed by Doxygen, in my patch about documenting grant_tables.h you can see I add
> there the path “xen/include/public/grant_table.h"

OK, thanks. I missed that addition.


> > 
> >> +DOXY_DEPS := xen.doxyfile \
> >> +			 xen-doxygen/mainpage.md \
> >> +			 xen-doxygen/doxygen_include.h
> >> +
> >> # Documentation targets
> >> $(foreach i,$(MAN_SECTIONS), \
> >>   $(eval DOC_MAN$(i) := $(patsubst man/%.$(i),man$(i)/%.$(i), \
> >> @@ -46,8 +58,28 @@ all: build
> >> build: html txt pdf man-pages figs
> >> 
> >> .PHONY: sphinx-html
> >> -sphinx-html:
> >> -	sphinx-build -b html . sphinx/html
> >> +sphinx-html: $(DOXY_DEPS) $(DOXY_LIST_SOURCES)
> >> +ifneq ($(SPHINXBUILD),no)
> > 
> > This check on SPHINXBUILD is new, it wasn't there before. Why do we need
> > it now? We are not really changing anything in regards to Sphinx, just
> > adding Doxygen support. Or was it a mistake that it was missing even
> > before this patch?
> 
> Yes this is new, I saw that we didn’t look if sphinx was installed in the system, so now we did

In that case, I think anything related to SPHINXBUILD and whether sphinx
is installed or not, should be a separate patch at the beginning of the
series. It could be committed independently before the rest of the
series. When we get to this patch, SPHINXBUILD should be already there.


> >> +	$(DOXYGEN) xen.doxyfile
> >> +	XEN_ROOT=$(realpath $(XEN_ROOT)) $(SPHINXBUILD) -b html . sphinx/html
> >> +else
> >> +	@echo "Sphinx is not installed; skipping sphinx-html documentation."
> >> +endif
> >> +
> >> +xen.doxyfile: xen.doxyfile.in xen-doxygen/doxy_input.list
> >> +	@echo "Generating $@"
> >> +	@sed -e "s,@XEN_BASE@,$(realpath $(XEN_ROOT)),g" $< \
> >> +		| sed -e "s,@DOXY_OUT@,$(DOXYGEN_OUTPUT),g" > $@.tmp
> >> +	@$(foreach inc,\
> >> +		$(DOXY_LIST_SOURCES),\
> >> +		echo "INPUT += \"$(inc)\"" >> $@.tmp; \
> >> +	)
> >> +	mv $@.tmp $@
> >> +
> >> +xen-doxygen/doxygen_include.h: xen-doxygen/doxygen_include.h.in
> >> +	@echo "Generating $@"
> >> +	@sed -e "s,@XEN_BASE@,$(realpath $(XEN_ROOT)),g" $< > $@.tmp
> >> +	@mv $@.tmp $@
> > 
> > Is the absolute path required? If not, we can probably get rid of this
> > generation step and simply have the relative path in
> > xen-doxygen/doxygen_include.h. I think this could apply to
> > xen.doxyfile.in above.
> 
> Unfortunately yes, the doxygen_include.h is a file that is included in every documented header before 
> starting the doxygen parser, since we don’t have all the headers in one path, it is impossible to have here
> a relative path that is good for every header in Xen.

OK :-/


> > 
> > 
> >> .PHONY: html
> >> html: $(DOC_HTML) html/index.html
> >> @@ -71,7 +103,11 @@ clean: clean-man-pages
> >> 	$(MAKE) -C figs clean
> >> 	rm -rf .word_count *.aux *.dvi *.bbl *.blg *.glo *.idx *~
> >> 	rm -rf *.ilg *.log *.ind *.toc *.bak *.tmp core
> >> -	rm -rf html txt pdf sphinx/html
> >> +	rm -rf html txt pdf sphinx $(DOXYGEN_OUTPUT)
> >> +	rm -f xen.doxyfile
> >> +	rm -f xen.doxyfile.tmp
> >> +	rm -f xen-doxygen/doxygen_include.h
> >> +	rm -f xen-doxygen/doxygen_include.h.tmp
> >> 
> >> .PHONY: distclean
> >> distclean: clean
> >> diff --git a/docs/conf.py b/docs/conf.py
> >> index 50e41501db..a48de42331 100644
> >> --- a/docs/conf.py
> >> +++ b/docs/conf.py
> >> @@ -13,13 +13,17 @@
> >> # add these directories to sys.path here. If the directory is relative to the
> >> # documentation root, use os.path.abspath to make it absolute, like shown here.
> >> #
> >> -# import os
> >> -# import sys
> >> +import os
> >> +import sys
> >> # sys.path.insert(0, os.path.abspath('.'))
> >> 
> >> 
> >> # -- Project information -----------------------------------------------------
> >> 
> >> +if "XEN_ROOT" not in os.environ:
> >> +    sys.exit("$XEN_ROOT environment variable undefined.")
> >> +XEN_ROOT = os.path.abspath(os.environ["XEN_ROOT"])
> >> +
> >> project = u'Xen'
> >> copyright = u'2019, The Xen development community'
> >> author = u'The Xen development community'
> >> @@ -35,6 +39,7 @@ try:
> >>             xen_subver = line.split(u"=")[1].strip()
> >>         elif line.startswith(u"export XEN_EXTRAVERSION"):
> >>             xen_extra = line.split(u"=")[1].split(u"$", 1)[0].strip()
> >> +
> > 
> > spurious change?
> 
> I think I’ve intentionally added a new line to separate the code from the except: below,
> but if it is a problem I can remove it

Better to remove it or to move it to a separate patch


> > 
> >> except:
> >>     pass
> >> finally:
> >> @@ -44,6 +49,15 @@ finally:
> >>     else:
> >>         version = release = u"unknown version"
> >> 
> >> +try:
> >> +    xen_doxygen_output = None
> >> +
> >> +    for line in open(u"Makefile"):
> >> +        if line.startswith(u"DOXYGEN_OUTPUT"):
> >> +                xen_doxygen_output = line.split(u"=")[1].strip()
> >> +except:
> >> +    sys.exit("DOXYGEN_OUTPUT variable undefined.")
> > 
> > This is a bit strange: isn't there a better way to get the
> > DOXYGEN_OUTPUT variable than reading the Makefile?
> > 
> > At that point I think it would be better to define DOXYGEN_OUTPUT a
> > second time in conf.py. But maybe it could be passed as an evironmental
> > variable?
> 
> Yes we could pass it as an environment variable as we do with XEN_ROOT,
> I will fix it in a next release.

Great


 
> > 
> >> # -- General configuration ---------------------------------------------------
> >> 
> >> # If your documentation needs a minimal Sphinx version, state it here.
> >> @@ -53,7 +67,8 @@ needs_sphinx = '1.4'
> >> # Add any Sphinx extension module names here, as strings. They can be
> >> # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
> >> # ones.
> >> -extensions = []
> >> +# breathe -> extension that integrates doxygen xml output with sphinx
> >> +extensions = ['breathe']
> >> 
> >> # Add any paths that contain templates here, relative to this directory.
> >> templates_path = ['_templates']
> >> @@ -175,6 +190,33 @@ texinfo_documents = [
> >>      'Miscellaneous'),
> >> ]
> >> 
> >> +# -- Options for Breathe extension -------------------------------------------
> >> +
> >> +breathe_projects = {
> >> +    "Xen": "{}/docs/{}/xml".format(XEN_ROOT, xen_doxygen_output)
> >> +}
> >> +breathe_default_project = "Xen"
> >> +
> >> +breathe_domain_by_extension = {
> >> +    "h": "c",
> >> +    "c": "c",
> >> +}
> >> +breathe_separate_member_pages = True
> >> +breathe_show_enumvalue_initializer = True
> >> +breathe_show_define_initializer = True
> >> +
> >> +# Qualifiers to a function are causing Sphihx/Breathe to warn about
> >> +# Error when parsing function declaration and more.  This is a list
> >> +# of strings that the parser additionally should accept as
> >> +# attributes.
> >> +cpp_id_attributes = [
> >> +    '__syscall', '__deprecated', '__may_alias',
> >> +    '__used', '__unused', '__weak',
> >> +    '__DEPRECATED_MACRO', 'FUNC_NORETURN',
> >> +    '__subsystem',
> > 
> > Should we also have any of following:
> > 
> > __packed
> > __init
> > __attribute__
> > __aligned__
> > 
> > in the list? In any case, we don't have to add them right now, we could
> > add them later as we expand Doxygen coverage if they become needed.
> 
> Sure it is possible, I can add them now since I have to push a fix for this patch
> If you want.

I would add them now even if they are not strictly required to parse the
public headers. But this is the kind of thing where others might have a
different opinion.
--8323329-683733543-1625161391=:9437--

