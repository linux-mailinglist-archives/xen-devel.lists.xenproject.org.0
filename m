Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B136E7E49FB
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 21:41:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629035.981090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0St8-0001WM-Af; Tue, 07 Nov 2023 20:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629035.981090; Tue, 07 Nov 2023 20:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0St8-0001U8-7g; Tue, 07 Nov 2023 20:41:30 +0000
Received: by outflank-mailman (input) for mailman id 629035;
 Tue, 07 Nov 2023 20:41:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FGpL=GU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r0St6-0000xQ-UF
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 20:41:28 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05292187-7dae-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 21:41:27 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3543BCE0FA7;
 Tue,  7 Nov 2023 20:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6821C433C7;
 Tue,  7 Nov 2023 20:41:20 +0000 (UTC)
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
X-Inumbo-ID: 05292187-7dae-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699389682;
	bh=TEqvg86v17/NcZU8Lqicuq9+k2jW+yHvgN3qy9GFaJY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=e4o5Dm8Bdp71mVRA9QM65H3OCDK5FZyTI8ZOL3vO/9UPllySQUUg/w1z643dX1rVH
	 yTCYkLjNOkrj9OX0jT6kBoR5/n3YzFY7kOC5JEKvFuO+LMglnUUbEQ9Y11pZAKs+8U
	 rNx1sZ+CztPyN2bqFhTRVBCBhLOUeGVNBq+xfI0JA5KihjMnxBpPp9D5tHq5gM/YRD
	 CI+cKHkqkGloAVDA00SxJvSQF9sQsBHO3TpVGD6HWLxpgdawl2KhTD8brVXhjlPFjt
	 KEAtrVWCaCrrlx3wDQNcZlN8gfC2NBnnzq4/h57PWWN+Z1+IASG+ZUufyGnevBIes/
	 PJTjqeGfIXltg==
Date: Tue, 7 Nov 2023 12:41:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: julien@xen.org, andrew.cooper3@citrix.com
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, roger.pau@citrix.com, 
    Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Henry Wang <Henry.Wang@arm.com>, 
    sstabellini@kernel.org
Subject: Re: [XEN PATCH v3 2/3] docs: make the docs for MISRA C:2012 Dir 4.1
 visible to ECLAIR
In-Reply-To: <alpine.DEB.2.22.394.2310021531430.2348112@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2311071240240.3478774@ubuntu-linux-20-04-desktop>
References: <cover.1696231870.git.nicola.vetrini@bugseng.com> <fd60f0f3c777652bd305a97b559cb7ee23293e8d.1696231870.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2310021531430.2348112@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+Julien, Andrew

Julien and Andrew raised concerns on this patch on the Xen Matrix
channel. Please provide further details.



On Mon, 2 Oct 2023, Stefano Stabellini wrote:
> On Mon, 2 Oct 2023, Nicola Vetrini wrote:
> > To be able to check for the existence of the necessary subsections in
> > the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a source
> > file that is built.
> > 
> > This file is generated from 'C-runtime-failures.rst' in docs/misra
> > and the configuration is updated accordingly.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
> > ---
> > Changes from RFC:
> > - Dropped unused/useless code
> > - Revised the sed command
> > - Revised the clean target
> > 
> > Changes in v2:
> > - Added explanative comment to the makefile
> > - printf instead of echo
> > 
> > Changes in v3:
> > - Terminate the generated file with a newline
> > - Build it with -std=c99, so that the documentation
> >   for D1.1 applies.
> > ---
> >  docs/Makefile       |  7 ++++++-
> >  docs/misra/Makefile | 22 ++++++++++++++++++++++
> >  2 files changed, 28 insertions(+), 1 deletion(-)
> >  create mode 100644 docs/misra/Makefile
> > 
> > diff --git a/docs/Makefile b/docs/Makefile
> > index 966a104490ac..ff991a0c3ca2 100644
> > --- a/docs/Makefile
> > +++ b/docs/Makefile
> > @@ -43,7 +43,7 @@ DOC_PDF  := $(patsubst %.pandoc,pdf/%.pdf,$(PANDOCSRC-y)) \
> >  all: build
> >  
> >  .PHONY: build
> > -build: html txt pdf man-pages figs
> > +build: html txt pdf man-pages figs misra
> >  
> >  .PHONY: sphinx-html
> >  sphinx-html:
> > @@ -66,9 +66,14 @@ endif
> >  .PHONY: pdf
> >  pdf: $(DOC_PDF)
> >  
> > +.PHONY: misra
> > +misra:
> > +	$(MAKE) -C misra
> > +
> >  .PHONY: clean
> >  clean: clean-man-pages
> >  	$(MAKE) -C figs clean
> > +	$(MAKE) -C misra clean
> >  	rm -rf .word_count *.aux *.dvi *.bbl *.blg *.glo *.idx *~
> >  	rm -rf *.ilg *.log *.ind *.toc *.bak *.tmp core
> >  	rm -rf html txt pdf sphinx/html
> > diff --git a/docs/misra/Makefile b/docs/misra/Makefile
> > new file mode 100644
> > index 000000000000..949458ff9e15
> > --- /dev/null
> > +++ b/docs/misra/Makefile
> > @@ -0,0 +1,22 @@
> > +TARGETS := C-runtime-failures.o
> > +
> > +all: $(TARGETS)
> > +
> > +# This Makefile will generate the object files indicated in TARGETS by taking
> > +# the corresponding .rst file, converting its content to a C block comment and
> > +# then compiling the resulting .c file. This is needed for the file's content to
> > +# be available when performing static analysis with ECLAIR on the project.
> > +
> > +# sed is used in place of cat to prevent occurrences of '*/'
> > +# in the .rst from breaking the compilation
> > +$(TARGETS:.o=.c): %.c: %.rst
> > +	printf "/*\n\n" > $@.tmp
> > +	sed -e 's|\*/|*//*|g' $< >> $@.tmp
> > +	printf "\n\n*/\n" >> $@.tmp
> > +	mv $@.tmp $@
> > +
> > +%.o: %.c
> > +	$(CC) -std=c99 -c $< -o $@
> > +
> > +clean:
> > +	rm -f C-runtime-failures.c *.o *.tmp
> > -- 
> > 2.34.1
> > 
> 

