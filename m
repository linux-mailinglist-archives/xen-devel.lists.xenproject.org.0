Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA927B1024
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 02:49:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609231.948191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlfDa-0000xq-S7; Thu, 28 Sep 2023 00:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609231.948191; Thu, 28 Sep 2023 00:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlfDa-0000vT-PO; Thu, 28 Sep 2023 00:49:26 +0000
Received: by outflank-mailman (input) for mailman id 609231;
 Thu, 28 Sep 2023 00:49:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjmF=FM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qlfDY-0000vL-MX
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 00:49:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd3bd9e0-5d98-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 02:49:23 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B65AC619F2;
 Thu, 28 Sep 2023 00:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76405C433C8;
 Thu, 28 Sep 2023 00:49:19 +0000 (UTC)
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
X-Inumbo-ID: dd3bd9e0-5d98-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695862161;
	bh=YXzwrS2ny1/pwVsQb+JjW5/Svg1/ZTFW92WJW1zxVA4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ncrprf4mX/CIG20OzyYrc5bh3J4Mr/AFqHxruCdOS1/2TfADfQ2k/Mj/s+JHCC6Sn
	 uNiK3sDX8VFy/S5JbDKEMtOvjKmzUOLHs7eepuUsMEqH8ButrQXIVwtsCHnFP7ZzJK
	 mkRCLwcEfaWyVfn29hvIncDj1WNoVjzx5RxlNulFfufBwjDQw60czcGOktveo9AbIt
	 zaByC3XE7hMP50zCR2YLdQhFShzSrJv6MLLW3wgpSjUdg+HPKzdmq97khlu1MfryoH
	 L5UHKutl6/T2iDq+4GV4nPZ/UgZaDd+k2dp1sibIu+gHf5GjXbPOt6ZRdjfZde75zy
	 TB73cRZXD6GnQ==
Date: Wed, 27 Sep 2023 17:49:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v2 2/3] docs: make the docs for MISRA C:2012 Dir 4.1
 visible to ECLAIR
In-Reply-To: <4e25395c844a312556303e3484a915e875e0e5a7.1695801813.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309271749110.1996340@ubuntu-linux-20-04-desktop>
References: <cover.1695801813.git.nicola.vetrini@bugseng.com> <4e25395c844a312556303e3484a915e875e0e5a7.1695801813.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Sep 2023, Nicola Vetrini wrote:
> To be able to check for the existence of the necessary subsections in
> the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a source
> file that is built.
> 
> This file is generated from 'C-runtime-failures.rst' in docs/misra
> and the configuration is updated accordingly.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes from RFC:
> - Dropped unused/useless code
> - Revised the sed command
> - Revised the clean target
> 
> Changes in v2:
> - Added explanative comment to the makefile
> - printf instead of echo
> ---
>  docs/Makefile       |  7 ++++++-
>  docs/misra/Makefile | 22 ++++++++++++++++++++++
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 docs/misra/Makefile
> 
> diff --git a/docs/Makefile b/docs/Makefile
> index 966a104490ac..ff991a0c3ca2 100644
> --- a/docs/Makefile
> +++ b/docs/Makefile
> @@ -43,7 +43,7 @@ DOC_PDF  := $(patsubst %.pandoc,pdf/%.pdf,$(PANDOCSRC-y)) \
>  all: build
>  
>  .PHONY: build
> -build: html txt pdf man-pages figs
> +build: html txt pdf man-pages figs misra
>  
>  .PHONY: sphinx-html
>  sphinx-html:
> @@ -66,9 +66,14 @@ endif
>  .PHONY: pdf
>  pdf: $(DOC_PDF)
>  
> +.PHONY: misra
> +misra:
> +	$(MAKE) -C misra
> +
>  .PHONY: clean
>  clean: clean-man-pages
>  	$(MAKE) -C figs clean
> +	$(MAKE) -C misra clean
>  	rm -rf .word_count *.aux *.dvi *.bbl *.blg *.glo *.idx *~
>  	rm -rf *.ilg *.log *.ind *.toc *.bak *.tmp core
>  	rm -rf html txt pdf sphinx/html
> diff --git a/docs/misra/Makefile b/docs/misra/Makefile
> new file mode 100644
> index 000000000000..8fd89404e96b
> --- /dev/null
> +++ b/docs/misra/Makefile
> @@ -0,0 +1,22 @@
> +TARGETS := C-runtime-failures.o
> +
> +all: $(TARGETS)
> +
> +# This Makefile will generate the object files indicated in TARGETS by taking
> +# the corresponding .rst file, converting its content to a C block comment and
> +# then compiling the resulting .c file. This is needed for the file's content to
> +# be available when performing static analysis with ECLAIR on the project.
> +
> +# sed is used in place of cat to prevent occurrences of '*/'
> +# in the .rst from breaking the compilation
> +$(TARGETS:.o=.c): %.c: %.rst
> +	printf "/*\n\n" > $@.tmp
> +	sed -e 's|\*/|*//*|g' $< >> $@.tmp
> +	printf "\n\n*/" >> $@.tmp
> +	mv $@.tmp $@
> +
> +%.o: %.c
> +	$(CC) -c $< -o $@
> +
> +clean:
> +	rm -f C-runtime-failures.c *.o *.tmp
> -- 
> 2.34.1
> 

