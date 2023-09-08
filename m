Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD50797F9C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 02:23:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597676.931924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qePHG-0000fB-Tm; Fri, 08 Sep 2023 00:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597676.931924; Fri, 08 Sep 2023 00:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qePHG-0000cZ-Qj; Fri, 08 Sep 2023 00:23:14 +0000
Received: by outflank-mailman (input) for mailman id 597676;
 Fri, 08 Sep 2023 00:23:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmm/=EY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qePHG-0000cT-6x
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 00:23:14 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e50d3bd5-4ddd-11ee-9b0d-b553b5be7939;
 Fri, 08 Sep 2023 02:23:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AF696B81F95;
 Fri,  8 Sep 2023 00:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5C2C433C8;
 Fri,  8 Sep 2023 00:23:08 +0000 (UTC)
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
X-Inumbo-ID: e50d3bd5-4ddd-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694132590;
	bh=wHvMk1qNkBOhlcF2JHLPUys28/Jn+/zQzN6CQPrO+fo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=S2X3x5LgQr5pcVGlFHvPjXU65m7LrTRtwizo5gFLbkjlK9KzUxrNh/dvm0rVu4xs8
	 MxBj2BglvyBc/Bzbl8qIAPO2Gb6vO0vs0x6CzH2etDO9iQHxVfv6V0ea1gpJFgsq2n
	 zeKlw9o72K72/hWcZ+QgLMPanQCFkA6cSRVCruZUegEQFp1LP637LynIMpw2Kz3YG5
	 33q8H/a6GFcSBLXyKC4acq5rsaKlzmolfNIr5RaGR3Qep383xIhTURFP581JapWXce
	 28C5XWXlTF7Qy4DlPpUsCiMXnB/T3KurHsC6GYqCQa/6rrEc2NpalzK1OjMPKONaqu
	 t4Lr9Rf+cvukg==
Date: Thu, 7 Sep 2023 17:23:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH 2/3] docs: make the docs for MISRA C:2012 Dir 4.1
 visible to ECLAIR
In-Reply-To: <bf38efce3ac551fc95eaf1935ce7f574a7804df2.1693558913.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309071722000.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693558913.git.nicola.vetrini@bugseng.com> <bf38efce3ac551fc95eaf1935ce7f574a7804df2.1693558913.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 1 Sep 2023, Nicola Vetrini wrote:
> To be able to check for the existence of the necessary subsections in
> the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a source
> file that is built.
> 
> This file is generated from 'C-runtime-failures.rst' in docs/misra
> and the configuration is updated accordingly.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Changes from RFC:
> - Dropped unused/useless code
> - Revised the sed command
> - Revised the clean target
> ---
>  docs/Makefile       |  7 ++++++-
>  docs/misra/Makefile | 17 +++++++++++++++++
>  2 files changed, 23 insertions(+), 1 deletion(-)
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
> index 000000000000..8ea0505c8a20
> --- /dev/null
> +++ b/docs/misra/Makefile
> @@ -0,0 +1,17 @@
> +TARGETS := C-runtime-failures.o
> +
> +all: $(TARGETS)
> +
> +# sed is used in place of cat to prevent occurrences of '*/'
> +# in the .rst from breaking the compilation

Please expand this comment with what you are doing in this makefile and
specifically what kind of .c file you are generating and why.

Everything else looks good.


> +$(TARGETS:.o=.c): %.c: %.rst
> +	echo "/*\n" > $@.tmp
> +	sed -e 's|\*/|*//*|g' $< >> $@.tmp
> +	echo "\n*/" >> $@.tmp
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

