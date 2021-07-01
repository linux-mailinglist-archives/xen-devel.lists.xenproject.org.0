Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3693B9578
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 19:25:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148980.275362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lz0Qi-00037M-Rd; Thu, 01 Jul 2021 17:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148980.275362; Thu, 01 Jul 2021 17:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lz0Qi-00035V-OJ; Thu, 01 Jul 2021 17:24:48 +0000
Received: by outflank-mailman (input) for mailman id 148980;
 Thu, 01 Jul 2021 17:24:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uD8v=LZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lz0Qh-00035P-OC
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 17:24:47 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37b6940f-3c0c-4c7d-a8fa-60a10fc43cf1;
 Thu, 01 Jul 2021 17:24:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0107661406;
 Thu,  1 Jul 2021 17:24:45 +0000 (UTC)
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
X-Inumbo-ID: 37b6940f-3c0c-4c7d-a8fa-60a10fc43cf1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625160286;
	bh=9C0/uCMUMnP6PwBqwBxTxBmKbrPiPpORig3xR+otpIo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IumK+bakb+BzvaRbTIy5m7Pe4tOdjTxdUWEDtnrq1aMz8LD55FX+Dcm4/b5qq/ZhF
	 GxddFJuuRmQIW5u4kGskSa5tfPaiFbeM3MJ8dUtmp1+WTk5PiPiSLNQX7SYr0VdoVW
	 DBCF3/871//LY+dXsvQ94HRNH0iCDCBJx5vIPUKFSBSXez2VIEZRMRwsdxc5vX20AA
	 0SFrLwatHHhKN0BBeJf+WB/yi8OdYJM6Q/1WegZ20t4tXo835Wyn3I4CRMxL+0Qncs
	 OShgkVl+gklNCRXx7RnryhEIDXPdw4I2qAlDqmAKf66BdIJSXzOcmC44XGIrBk3y8B
	 0XQC+D99s2LUQ==
Date: Thu, 1 Jul 2021 10:24:45 -0700 (PDT)
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
Subject: Re: [PATCH v6 8/9] docs: hypercalls sphinx skeleton for generated
 html
In-Reply-To: <D2BAA7F7-4396-4EE7-977B-AE300A50589D@arm.com>
Message-ID: <alpine.DEB.2.21.2107011024220.9437@sstabellini-ThinkPad-T480s>
References: <20210510084105.17108-1-luca.fancellu@arm.com> <20210510084105.17108-9-luca.fancellu@arm.com> <alpine.DEB.2.21.2106231523210.24906@sstabellini-ThinkPad-T480s> <D2BAA7F7-4396-4EE7-977B-AE300A50589D@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Jul 2021, Luca Fancellu wrote:
> > On 24 Jun 2021, at 00:34, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Mon, 10 May 2021, Luca Fancellu wrote:
> >> Create a skeleton for the documentation about hypercalls
> >> 
> >> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> >> ---
> >> v6 changes:
> >> - Now every platform has the same sections in .rst files
> >> ---
> >> .gitignore                             |  1 +
> >> docs/Makefile                          |  4 ++++
> >> docs/hypercall-interfaces/arm32.rst    | 32 ++++++++++++++++++++++++++
> >> docs/hypercall-interfaces/arm64.rst    | 32 ++++++++++++++++++++++++++
> >> docs/hypercall-interfaces/index.rst.in |  7 ++++++
> >> docs/hypercall-interfaces/x86_64.rst   | 32 ++++++++++++++++++++++++++
> >> docs/index.rst                         |  8 +++++++
> >> 7 files changed, 116 insertions(+)
> >> create mode 100644 docs/hypercall-interfaces/arm32.rst
> >> create mode 100644 docs/hypercall-interfaces/arm64.rst
> >> create mode 100644 docs/hypercall-interfaces/index.rst.in
> >> create mode 100644 docs/hypercall-interfaces/x86_64.rst
> >> 
> >> diff --git a/.gitignore b/.gitignore
> >> index d271e0ce6a..a9aab120ae 100644
> >> --- a/.gitignore
> >> +++ b/.gitignore
> >> @@ -64,6 +64,7 @@ docs/xen.doxyfile
> >> docs/xen.doxyfile.tmp
> >> docs/xen-doxygen/doxygen_include.h
> >> docs/xen-doxygen/doxygen_include.h.tmp
> >> +docs/hypercall-interfaces/index.rst
> >> extras/mini-os*
> >> install/*
> >> stubdom/*-minios-config.mk
> >> diff --git a/docs/Makefile b/docs/Makefile
> >> index 2f784c36ce..b02c3dfb79 100644
> >> --- a/docs/Makefile
> >> +++ b/docs/Makefile
> >> @@ -61,6 +61,9 @@ build: html txt pdf man-pages figs
> >> sphinx-html: $(DOXY_DEPS) $(DOXY_LIST_SOURCES)
> >> ifneq ($(SPHINXBUILD),no)
> >> 	$(DOXYGEN) xen.doxyfile
> >> +	@echo "Generating hypercall-interfaces/index.rst"
> >> +	@sed -e "s,@XEN_TARGET_ARCH@,$(XEN_TARGET_ARCH),g" \
> >> +		hypercall-interfaces/index.rst.in > hypercall-interfaces/index.rst
> > 
> 
> Hi Stefano,
> 
> > I take that this means we are going to generate docs only for the
> > architecture that we are building? So if we build for x86, then the docs
> > are for x86 (no arm32 and arm64 docs.) Is that right?
> > 
> > Is that because Doxygen relies somehow on the compiler to extract data?
> > I am asking because if Doxygen doesn't rely on the compiler, then it
> > could probably generate the docs for all architectures in one go?
> 
> Doxygen rely on the headers generated from the KConfig system to properly solve
> the preprocessor step, for that reason here we need that.
> 
> It can be improved for sure, but it needs to call a defconfig for each architecture and
> have separate Doxygen-output folders for each one, then on the rst files you can choose
> from which arch you want the data.
> 
> I think this step can be done in a future serie.

OK. Maybe add a note about this to one of the commit messages.


> > 
> > 
> > 
> >> 	XEN_ROOT=$(realpath $(XEN_ROOT)) $(SPHINXBUILD) -b html . sphinx/html
> >> else
> >> 	@echo "Sphinx is not installed; skipping sphinx-html documentation."
> >> @@ -108,6 +111,7 @@ clean: clean-man-pages
> >> 	rm -f xen.doxyfile.tmp
> >> 	rm -f xen-doxygen/doxygen_include.h
> >> 	rm -f xen-doxygen/doxygen_include.h.tmp
> >> +	rm -f hypercall-interfaces/index.rst
> >> 
> >> .PHONY: distclean
> >> distclean: clean
> >> diff --git a/docs/hypercall-interfaces/arm32.rst b/docs/hypercall-interfaces/arm32.rst
> >> new file mode 100644
> >> index 0000000000..6762d9fc7c
> >> --- /dev/null
> >> +++ b/docs/hypercall-interfaces/arm32.rst
> >> @@ -0,0 +1,32 @@
> >> +.. SPDX-License-Identifier: CC-BY-4.0
> >> +
> >> +Hypercall Interfaces - arm32
> >> +============================
> >> +
> >> +Starting points
> >> +---------------
> >> +.. toctree::
> >> +   :maxdepth: 2
> >> +
> >> +
> >> +
> >> +Functions
> >> +---------
> >> +
> >> +
> >> +Structs
> >> +-------
> >> +
> >> +
> >> +Enums and sets of #defines
> >> +--------------------------
> >> +
> >> +
> >> +Typedefs
> >> +--------
> >> +
> >> +
> >> +Enum values and individual #defines
> >> +-----------------------------------
> >> +
> >> +
> >> diff --git a/docs/hypercall-interfaces/arm64.rst b/docs/hypercall-interfaces/arm64.rst
> >> new file mode 100644
> >> index 0000000000..5e701a2adc
> >> --- /dev/null
> >> +++ b/docs/hypercall-interfaces/arm64.rst
> >> @@ -0,0 +1,32 @@
> >> +.. SPDX-License-Identifier: CC-BY-4.0
> >> +
> >> +Hypercall Interfaces - arm64
> >> +============================
> >> +
> >> +Starting points
> >> +---------------
> >> +.. toctree::
> >> +   :maxdepth: 2
> >> +
> >> +
> >> +
> >> +Functions
> >> +---------
> >> +
> >> +
> >> +Structs
> >> +-------
> >> +
> >> +
> >> +Enums and sets of #defines
> >> +--------------------------
> >> +
> >> +
> >> +Typedefs
> >> +--------
> >> +
> >> +
> >> +Enum values and individual #defines
> >> +-----------------------------------
> >> +
> >> +
> >> diff --git a/docs/hypercall-interfaces/index.rst.in b/docs/hypercall-interfaces/index.rst.in
> >> new file mode 100644
> >> index 0000000000..e4dcc5db8d
> >> --- /dev/null
> >> +++ b/docs/hypercall-interfaces/index.rst.in
> >> @@ -0,0 +1,7 @@
> >> +.. SPDX-License-Identifier: CC-BY-4.0
> >> +
> >> +Hypercall Interfaces
> >> +====================
> >> +
> >> +.. toctree::
> >> +   @XEN_TARGET_ARCH@
> >> diff --git a/docs/hypercall-interfaces/x86_64.rst b/docs/hypercall-interfaces/x86_64.rst
> >> new file mode 100644
> >> index 0000000000..59e948900c
> >> --- /dev/null
> >> +++ b/docs/hypercall-interfaces/x86_64.rst
> >> @@ -0,0 +1,32 @@
> >> +.. SPDX-License-Identifier: CC-BY-4.0
> >> +
> >> +Hypercall Interfaces - x86_64
> >> +=============================
> >> +
> >> +Starting points
> >> +---------------
> >> +.. toctree::
> >> +   :maxdepth: 2
> >> +
> >> +
> >> +
> >> +Functions
> >> +---------
> >> +
> >> +
> >> +Structs
> >> +-------
> >> +
> >> +
> >> +Enums and sets of #defines
> >> +--------------------------
> >> +
> >> +
> >> +Typedefs
> >> +--------
> >> +
> >> +
> >> +Enum values and individual #defines
> >> +-----------------------------------
> >> +
> >> +
> >> diff --git a/docs/index.rst b/docs/index.rst
> >> index b75487a05d..52226a42d8 100644
> >> --- a/docs/index.rst
> >> +++ b/docs/index.rst
> >> @@ -53,6 +53,14 @@ kind of development environment.
> >>    hypervisor-guide/index
> >> 
> >> 
> >> +Hypercall Interfaces documentation
> >> +----------------------------------
> >> +
> >> +.. toctree::
> >> +   :maxdepth: 2
> >> +
> >> +   hypercall-interfaces/index
> >> +
> >> Miscellanea
> >> -----------
> >> 
> >> -- 
> >> 2.17.1
> 

