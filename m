Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9943B23F4
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 01:34:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146329.269228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwCNh-0003zh-52; Wed, 23 Jun 2021 23:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146329.269228; Wed, 23 Jun 2021 23:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwCNh-0003wq-1X; Wed, 23 Jun 2021 23:34:05 +0000
Received: by outflank-mailman (input) for mailman id 146329;
 Wed, 23 Jun 2021 23:34:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zqu9=LR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lwCNf-0003w1-7p
 for xen-devel@lists.xenproject.org; Wed, 23 Jun 2021 23:34:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 627905af-7947-41b8-88ad-7c95b769bd0b;
 Wed, 23 Jun 2021 23:34:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BC1C61166;
 Wed, 23 Jun 2021 23:34:01 +0000 (UTC)
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
X-Inumbo-ID: 627905af-7947-41b8-88ad-7c95b769bd0b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624491241;
	bh=7tSNNITUacF15FFuRbyhihpM/sSFWQlAjhsa/yA1V5E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HzaYHrcJHqYRJI7JSEUHpDL9vWJFOjoDBdyujAvwekbSeQplbmeP4SAubl45n45o6
	 QjGZJMqbrB8XBSvHvC+tmB60QMRdMFQmTFzPY11U35BrMomIbucPp+GivUcwPK8yJv
	 8z40Jcys+D+tmntoVJPwdt5YkowgFpAOmptPlmvEsm1gViR9JYWaHICqi3typYwFf2
	 K5jIdtebwMXSO9bN733b/ndjmCPaCqnG99De4xIGXHh97vOBy/R5VWcdJUnPonXvvL
	 I0YMnBMEvvw8/zibLCjl0bN2ZWYnu33Vt66zD++qUn/S4LAl+Gb+HQ27c0FWYty+oV
	 KqdV7k9qKMK5w==
Date: Wed, 23 Jun 2021 16:34:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 8/9] docs: hypercalls sphinx skeleton for generated
 html
In-Reply-To: <20210510084105.17108-9-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.21.2106231523210.24906@sstabellini-ThinkPad-T480s>
References: <20210510084105.17108-1-luca.fancellu@arm.com> <20210510084105.17108-9-luca.fancellu@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 May 2021, Luca Fancellu wrote:
> Create a skeleton for the documentation about hypercalls
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v6 changes:
> - Now every platform has the same sections in .rst files
> ---
>  .gitignore                             |  1 +
>  docs/Makefile                          |  4 ++++
>  docs/hypercall-interfaces/arm32.rst    | 32 ++++++++++++++++++++++++++
>  docs/hypercall-interfaces/arm64.rst    | 32 ++++++++++++++++++++++++++
>  docs/hypercall-interfaces/index.rst.in |  7 ++++++
>  docs/hypercall-interfaces/x86_64.rst   | 32 ++++++++++++++++++++++++++
>  docs/index.rst                         |  8 +++++++
>  7 files changed, 116 insertions(+)
>  create mode 100644 docs/hypercall-interfaces/arm32.rst
>  create mode 100644 docs/hypercall-interfaces/arm64.rst
>  create mode 100644 docs/hypercall-interfaces/index.rst.in
>  create mode 100644 docs/hypercall-interfaces/x86_64.rst
> 
> diff --git a/.gitignore b/.gitignore
> index d271e0ce6a..a9aab120ae 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -64,6 +64,7 @@ docs/xen.doxyfile
>  docs/xen.doxyfile.tmp
>  docs/xen-doxygen/doxygen_include.h
>  docs/xen-doxygen/doxygen_include.h.tmp
> +docs/hypercall-interfaces/index.rst
>  extras/mini-os*
>  install/*
>  stubdom/*-minios-config.mk
> diff --git a/docs/Makefile b/docs/Makefile
> index 2f784c36ce..b02c3dfb79 100644
> --- a/docs/Makefile
> +++ b/docs/Makefile
> @@ -61,6 +61,9 @@ build: html txt pdf man-pages figs
>  sphinx-html: $(DOXY_DEPS) $(DOXY_LIST_SOURCES)
>  ifneq ($(SPHINXBUILD),no)
>  	$(DOXYGEN) xen.doxyfile
> +	@echo "Generating hypercall-interfaces/index.rst"
> +	@sed -e "s,@XEN_TARGET_ARCH@,$(XEN_TARGET_ARCH),g" \
> +		hypercall-interfaces/index.rst.in > hypercall-interfaces/index.rst

I take that this means we are going to generate docs only for the
architecture that we are building? So if we build for x86, then the docs
are for x86 (no arm32 and arm64 docs.) Is that right?

Is that because Doxygen relies somehow on the compiler to extract data?
I am asking because if Doxygen doesn't rely on the compiler, then it
could probably generate the docs for all architectures in one go?



>  	XEN_ROOT=$(realpath $(XEN_ROOT)) $(SPHINXBUILD) -b html . sphinx/html
>  else
>  	@echo "Sphinx is not installed; skipping sphinx-html documentation."
> @@ -108,6 +111,7 @@ clean: clean-man-pages
>  	rm -f xen.doxyfile.tmp
>  	rm -f xen-doxygen/doxygen_include.h
>  	rm -f xen-doxygen/doxygen_include.h.tmp
> +	rm -f hypercall-interfaces/index.rst
>  
>  .PHONY: distclean
>  distclean: clean
> diff --git a/docs/hypercall-interfaces/arm32.rst b/docs/hypercall-interfaces/arm32.rst
> new file mode 100644
> index 0000000000..6762d9fc7c
> --- /dev/null
> +++ b/docs/hypercall-interfaces/arm32.rst
> @@ -0,0 +1,32 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Hypercall Interfaces - arm32
> +============================
> +
> +Starting points
> +---------------
> +.. toctree::
> +   :maxdepth: 2
> +
> +
> +
> +Functions
> +---------
> +
> +
> +Structs
> +-------
> +
> +
> +Enums and sets of #defines
> +--------------------------
> +
> +
> +Typedefs
> +--------
> +
> +
> +Enum values and individual #defines
> +-----------------------------------
> +
> +
> diff --git a/docs/hypercall-interfaces/arm64.rst b/docs/hypercall-interfaces/arm64.rst
> new file mode 100644
> index 0000000000..5e701a2adc
> --- /dev/null
> +++ b/docs/hypercall-interfaces/arm64.rst
> @@ -0,0 +1,32 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Hypercall Interfaces - arm64
> +============================
> +
> +Starting points
> +---------------
> +.. toctree::
> +   :maxdepth: 2
> +
> +
> +
> +Functions
> +---------
> +
> +
> +Structs
> +-------
> +
> +
> +Enums and sets of #defines
> +--------------------------
> +
> +
> +Typedefs
> +--------
> +
> +
> +Enum values and individual #defines
> +-----------------------------------
> +
> +
> diff --git a/docs/hypercall-interfaces/index.rst.in b/docs/hypercall-interfaces/index.rst.in
> new file mode 100644
> index 0000000000..e4dcc5db8d
> --- /dev/null
> +++ b/docs/hypercall-interfaces/index.rst.in
> @@ -0,0 +1,7 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Hypercall Interfaces
> +====================
> +
> +.. toctree::
> +   @XEN_TARGET_ARCH@
> diff --git a/docs/hypercall-interfaces/x86_64.rst b/docs/hypercall-interfaces/x86_64.rst
> new file mode 100644
> index 0000000000..59e948900c
> --- /dev/null
> +++ b/docs/hypercall-interfaces/x86_64.rst
> @@ -0,0 +1,32 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Hypercall Interfaces - x86_64
> +=============================
> +
> +Starting points
> +---------------
> +.. toctree::
> +   :maxdepth: 2
> +
> +
> +
> +Functions
> +---------
> +
> +
> +Structs
> +-------
> +
> +
> +Enums and sets of #defines
> +--------------------------
> +
> +
> +Typedefs
> +--------
> +
> +
> +Enum values and individual #defines
> +-----------------------------------
> +
> +
> diff --git a/docs/index.rst b/docs/index.rst
> index b75487a05d..52226a42d8 100644
> --- a/docs/index.rst
> +++ b/docs/index.rst
> @@ -53,6 +53,14 @@ kind of development environment.
>     hypervisor-guide/index
>  
>  
> +Hypercall Interfaces documentation
> +----------------------------------
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   hypercall-interfaces/index
> +
>  Miscellanea
>  -----------
>  
> -- 
> 2.17.1
> 

