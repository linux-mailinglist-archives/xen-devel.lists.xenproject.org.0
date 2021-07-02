Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 085553BA5F3
	for <lists+xen-devel@lfdr.de>; Sat,  3 Jul 2021 00:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149354.276162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzRZ2-0001aE-61; Fri, 02 Jul 2021 22:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149354.276162; Fri, 02 Jul 2021 22:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzRZ2-0001XN-2d; Fri, 02 Jul 2021 22:23:12 +0000
Received: by outflank-mailman (input) for mailman id 149354;
 Fri, 02 Jul 2021 22:23:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2ZMt=L2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lzRYz-0001TB-UK
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 22:23:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 142bdc0a-db84-11eb-83c9-12813bfff9fa;
 Fri, 02 Jul 2021 22:23:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1AD5613D8;
 Fri,  2 Jul 2021 22:23:07 +0000 (UTC)
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
X-Inumbo-ID: 142bdc0a-db84-11eb-83c9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625264588;
	bh=zQNj7JPmp8LSW80+gBSqlEodeUICaVTJJkxXZfv6L2I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BirKJ1REFub07HLbB102mTrRvf8LWj3y34qKXKdfeNv4zLO3NJtweDeDVYvBVWlRV
	 fpoOzRlon/BvfeSwbTKQu3v9Ko5/uajP43/awOp4pMtVDkhRettlJqudcCSkrOaZmY
	 rMCDfY2enO3AkhqoKi66jH61G+PfkLZrtfvSAvmAXvxNGiu7ioCwvNlMnxY7L/YIIN
	 jimb94yZV4k75ZjwtsrbYm6C5BdPrltfCp4yHQNAzz14gps9wLOrPHCtl3DGQQLyE/
	 KV2iXxdhujkkaJ7V4UJYqRnA4ZvoyQLvoLgraiIA3XH1bPm93Ddccx8LhCP5c0CBbq
	 XYjoY9WHI21iQ==
Date: Fri, 2 Jul 2021 15:23:07 -0700 (PDT)
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
In-Reply-To: <7C3269F1-3C61-4F39-82F9-9DE4C563849B@arm.com>
Message-ID: <alpine.DEB.2.21.2107021324090.9437@sstabellini-ThinkPad-T480s>
References: <20210510084105.17108-1-luca.fancellu@arm.com> <20210510084105.17108-8-luca.fancellu@arm.com> <alpine.DEB.2.21.2106231506040.24906@sstabellini-ThinkPad-T480s> <1FC1E8DF-8AED-4ABD-BE9A-DBBD9D66EDBB@arm.com> <alpine.DEB.2.21.2107011037580.9437@sstabellini-ThinkPad-T480s>
 <7C3269F1-3C61-4F39-82F9-9DE4C563849B@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-766106159-1625257521=:9437"
Content-ID: <alpine.DEB.2.21.2107021337540.9437@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-766106159-1625257521=:9437
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2107021337541.9437@sstabellini-ThinkPad-T480s>

On Fri, 2 Jul 2021, Luca Fancellu wrote:
> > On 1 Jul 2021, at 18:43, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Thu, 1 Jul 2021, Luca Fancellu wrote:
> >>> On 24 Jun 2021, at 00:33, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>> 
> >>> On Mon, 10 May 2021, Luca Fancellu wrote:
> >>>> Modify docs/Makefile to call doxygen and generate sphinx
> >>>> html documentation given the doxygen XML output.
> >>>> 
> >>>> Modify docs/conf.py sphinx configuration file to setup
> >>>> the breathe extension that works as bridge between
> >>>> sphinx and doxygen.
> >>>> 
> >>>> Add some files to the .gitignore to ignore some
> >>>> generated files for doxygen.
> >>>> 
> >>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> >>>> ---
> >>>> .gitignore    |  6 ++++++
> >>>> docs/Makefile | 42 +++++++++++++++++++++++++++++++++++++++---
> >>>> docs/conf.py  | 48 +++++++++++++++++++++++++++++++++++++++++++++---
> >>>> 3 files changed, 90 insertions(+), 6 deletions(-)
> >>>> 
> >>>> diff --git a/.gitignore b/.gitignore
> >>>> index 1c2fa1530b..d271e0ce6a 100644
> >>>> --- a/.gitignore
> >>>> +++ b/.gitignore
> >>>> @@ -58,6 +58,12 @@ docs/man7/
> >>>> docs/man8/
> >>>> docs/pdf/
> >>>> docs/txt/
> >>>> +docs/doxygen-output
> >>>> +docs/sphinx
> >>>> +docs/xen.doxyfile
> >>>> +docs/xen.doxyfile.tmp
> >>>> +docs/xen-doxygen/doxygen_include.h
> >>>> +docs/xen-doxygen/doxygen_include.h.tmp
> >>>> extras/mini-os*
> >>>> install/*
> >>>> stubdom/*-minios-config.mk
> >>>> diff --git a/docs/Makefile b/docs/Makefile
> >>>> index 8de1efb6f5..2f784c36ce 100644
> >>>> --- a/docs/Makefile
> >>>> +++ b/docs/Makefile
> >>>> @@ -17,6 +17,18 @@ TXTSRC-y := $(sort $(shell find misc -name '*.txt' -print))
> >>>> 
> >>>> PANDOCSRC-y := $(sort $(shell find designs/ features/ misc/ process/ specs/ \( -name '*.pandoc' -o -name '*.md' \) -print))
> >>>> 
> >>>> +# Directory in which the doxygen documentation is created
> >>>> +# This must be kept in sync with breathe_projects value in conf.py
> >>>> +DOXYGEN_OUTPUT = doxygen-output
> >>>> +
> >>>> +# Doxygen input headers from xen-doxygen/doxy_input.list file
> >>>> +DOXY_LIST_SOURCES != cat "xen-doxygen/doxy_input.list"
> >>>> +DOXY_LIST_SOURCES := $(realpath $(addprefix $(XEN_ROOT)/,$(DOXY_LIST_SOURCES)))
> >> 
> >> Hi Stefano,
> >> 
> >>> 
> >>> I cannot find exactly who is populating doxy_input.list. I can see it is
> >>> empty in patch #6. Does it get populated during the build?
> >> 
> >> doxy_input.list is the only file that should be modified by the developer when he/she wants to add documentation
> >> for a new file to be parsed by Doxygen, in my patch about documenting grant_tables.h you can see I add
> >> there the path “xen/include/public/grant_table.h"
> > 
> > OK, thanks. I missed that addition.
> > 
> > 
> >>> 
> >>>> +DOXY_DEPS := xen.doxyfile \
> >>>> +			 xen-doxygen/mainpage.md \
> >>>> +			 xen-doxygen/doxygen_include.h
> >>>> +
> >>>> # Documentation targets
> >>>> $(foreach i,$(MAN_SECTIONS), \
> >>>>  $(eval DOC_MAN$(i) := $(patsubst man/%.$(i),man$(i)/%.$(i), \
> >>>> @@ -46,8 +58,28 @@ all: build
> >>>> build: html txt pdf man-pages figs
> >>>> 
> >>>> .PHONY: sphinx-html
> >>>> -sphinx-html:
> >>>> -	sphinx-build -b html . sphinx/html
> >>>> +sphinx-html: $(DOXY_DEPS) $(DOXY_LIST_SOURCES)
> >>>> +ifneq ($(SPHINXBUILD),no)
> >>> 
> >>> This check on SPHINXBUILD is new, it wasn't there before. Why do we need
> >>> it now? We are not really changing anything in regards to Sphinx, just
> >>> adding Doxygen support. Or was it a mistake that it was missing even
> >>> before this patch?
> >> 
> >> Yes this is new, I saw that we didn’t look if sphinx was installed in the system, so now we did
> > 
> > In that case, I think anything related to SPHINXBUILD and whether sphinx
> > is installed or not, should be a separate patch at the beginning of the
> > series. It could be committed independently before the rest of the
> > series. When we get to this patch, SPHINXBUILD should be already there.
> 
> I’ve introduced SPHINXBUILD in this patch: [PATCH v6 5/9] docs: add checks to configure for sphinx and doxygen,
> In your commend do you mean that you would like it to be outside this serie and this serie to be based on top of that one?

I totally missed patches 4 and 5. Can you please CC me to the whole
series next time?

I meant as a separate patch, like you have done in patch #5. It doesn't
necessarily need to be at the beginning of the series so what you have
already done is OK.
--8323329-766106159-1625257521=:9437--

