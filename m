Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939B437325D
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 00:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122738.231527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1le3Yv-0005y4-7U; Tue, 04 May 2021 22:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122738.231527; Tue, 04 May 2021 22:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1le3Yv-0005xh-4M; Tue, 04 May 2021 22:30:41 +0000
Received: by outflank-mailman (input) for mailman id 122738;
 Tue, 04 May 2021 22:30:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jbig=J7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1le3Yt-0005xc-I4
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 22:30:39 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f42bea6-9701-419f-9a12-0afd3d9f8679;
 Tue, 04 May 2021 22:30:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95282613BA;
 Tue,  4 May 2021 22:30:37 +0000 (UTC)
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
X-Inumbo-ID: 2f42bea6-9701-419f-9a12-0afd3d9f8679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620167438;
	bh=N5DNmNqIILQGKdjmxbsySJMTjU5VA/cIrCKROhYvYKI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=D7uVxlL+36S+hjMQMYbihYmqEgkvjuZQGZbBIR4lmRPoj6gnxs7HKl+DfY6ebdFdU
	 wrIAaZhQ7ar5G8SO0+7RI094WdW+p9T+E2ebVCzHpMYKXWoquYkNoaZgPznKMoc16P
	 Yr/tVP1a20dYUdhZ/BycENRZqqDiCftSgfb6vgfxfydJTB7V7Dls/a8nw0gCpM6l+6
	 5H9seCcTdwjPwJdJnH6BDO73B+MEhlGOvjggbQQHY3shmF2FDWbavOq9TA3LNRiuAM
	 7Y1VK01G/gWqY+OiJrTHUF6mhzTIcGncxm0MKm+ZFNG3KeErbDqgw34IEhCVLfJNKB
	 Y2DQS0ia6X5EA==
Date: Tue, 4 May 2021 15:30:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 2/3] docs: hypercalls sphinx skeleton for generated
 html
In-Reply-To: <20210504133145.767-3-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.21.2105041527550.5018@sstabellini-ThinkPad-T480s>
References: <20210504133145.767-1-luca.fancellu@arm.com> <20210504133145.767-3-luca.fancellu@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 May 2021, Luca Fancellu wrote:
> Create a skeleton for the documentation about hypercalls

Why is there a difference between the arm32, arm64 and x86_64 skeletons?
Shouldn't just we have one? Or if we have to have three, why are they
not identical?


> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  .gitignore                             |  1 +
>  docs/Makefile                          |  4 ++++
>  docs/hypercall-interfaces/arm32.rst    |  4 ++++
>  docs/hypercall-interfaces/arm64.rst    | 32 ++++++++++++++++++++++++++
>  docs/hypercall-interfaces/index.rst.in |  7 ++++++
>  docs/hypercall-interfaces/x86_64.rst   |  4 ++++
>  docs/index.rst                         |  8 +++++++
>  7 files changed, 60 insertions(+)
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
> index 0000000000..4e973fbbaf
> --- /dev/null
> +++ b/docs/hypercall-interfaces/arm32.rst
> @@ -0,0 +1,4 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Hypercall Interfaces - arm32
> +============================
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
> index 0000000000..3ed70dff95
> --- /dev/null
> +++ b/docs/hypercall-interfaces/x86_64.rst
> @@ -0,0 +1,4 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Hypercall Interfaces - x86_64
> +=============================
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

