Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0889D7B5D2B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 00:32:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611793.951363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRST-0003aD-Eo; Mon, 02 Oct 2023 22:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611793.951363; Mon, 02 Oct 2023 22:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRST-0003YR-Ae; Mon, 02 Oct 2023 22:32:09 +0000
Received: by outflank-mailman (input) for mailman id 611793;
 Mon, 02 Oct 2023 22:32:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oggk=FQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnRSR-0003Uh-Tp
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 22:32:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 838820b4-6173-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 00:32:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 677496100B;
 Mon,  2 Oct 2023 22:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFF8C433C8;
 Mon,  2 Oct 2023 22:32:02 +0000 (UTC)
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
X-Inumbo-ID: 838820b4-6173-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696285924;
	bh=6g7oL5xSElW10Bg0sPSXxBPKXgjXfN4SFDaVtsZXhuQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rHRmtTKAxUizRS8w6lnXc3g+xh/IKKQBVFsEjdlkr7lYLp8mSQ7u3MZG17IORfE4Z
	 LHg5bq0y/rZiWISAKN+QQRlqujJlJG3VNsB63YErhcEnxmXv8/embI1A2s9HTKM29n
	 RBfOQJN+FbIs2BNx+CuGUoIRciRZg8HwbqPgVNzo3reAeeOEtVoutm1QSd3s5dKEwH
	 MTXqVVDIGzQ3eIFyTk5Z633jVZgRpGu3LbLW5og4i7qIhmF72FGMIQMJ6Bo8WRA65w
	 1ZZuOz8VucLfRWt3BdOp9ZJn3rnnB+e8xlwkwy+QFtVL/DaC0I64IZqDzjnTjhumov
	 gK2DObxM/InbA==
Date: Mon, 2 Oct 2023 15:32:00 -0700 (PDT)
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
Subject: Re: [XEN PATCH v3 2/3] docs: make the docs for MISRA C:2012 Dir 4.1
 visible to ECLAIR
In-Reply-To: <fd60f0f3c777652bd305a97b559cb7ee23293e8d.1696231870.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310021531430.2348112@ubuntu-linux-20-04-desktop>
References: <cover.1696231870.git.nicola.vetrini@bugseng.com> <fd60f0f3c777652bd305a97b559cb7ee23293e8d.1696231870.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Oct 2023, Nicola Vetrini wrote:
> To be able to check for the existence of the necessary subsections in
> the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a source
> file that is built.
> 
> This file is generated from 'C-runtime-failures.rst' in docs/misra
> and the configuration is updated accordingly.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes from RFC:
> - Dropped unused/useless code
> - Revised the sed command
> - Revised the clean target
> 
> Changes in v2:
> - Added explanative comment to the makefile
> - printf instead of echo
> 
> Changes in v3:
> - Terminate the generated file with a newline
> - Build it with -std=c99, so that the documentation
>   for D1.1 applies.
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
> index 000000000000..949458ff9e15
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
> +	printf "\n\n*/\n" >> $@.tmp
> +	mv $@.tmp $@
> +
> +%.o: %.c
> +	$(CC) -std=c99 -c $< -o $@
> +
> +clean:
> +	rm -f C-runtime-failures.c *.o *.tmp
> -- 
> 2.34.1
> 

