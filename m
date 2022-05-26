Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE66D5347C4
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 03:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337400.561987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nu1tq-0004zv-23; Thu, 26 May 2022 01:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337400.561987; Thu, 26 May 2022 01:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nu1tp-0004yD-R8; Thu, 26 May 2022 01:02:49 +0000
Received: by outflank-mailman (input) for mailman id 337400;
 Thu, 26 May 2022 01:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nu1to-0004y7-Iu
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 01:02:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d12b603-dc8f-11ec-bd2c-47488cf2e6aa;
 Thu, 26 May 2022 03:02:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4ACA461719;
 Thu, 26 May 2022 01:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 410E0C385B8;
 Thu, 26 May 2022 01:02:43 +0000 (UTC)
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
X-Inumbo-ID: 8d12b603-dc8f-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653526963;
	bh=oK/GYxneCttxB/Z22skpAPjw2uxLN3rffqB0E+kgtA0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XnPu2X2AG8YOpW9RntHniiLv9ptrNL2i/IFsOObKJY/LvogjKFlR1V3aUvWt36P2R
	 TReYOtUeKFyoyvo8COm1eIkNfSYma+SytHmrJ2ETSeFrvV8zXF2pbQFb9ff0HMwS4y
	 eFw5njA9Ijk1cBNCLmQRunqk5nqcUJFHCaNcAWm8tektCrmfD7fpHHc6cm9n9cX9tC
	 4LDqoyBy+tfBY1TePXLA6m5yhcVRpRbmjQB3DkfRBv0N6+yjRz7KSaj0b5bI+vnjcj
	 cHpZcsIvlOIA8YBvpAvSjWiFpc9IJBax66FM3HY7wOkYaWNpwHYSyJYg01MHF8wZHB
	 JFE1KIVwcLSkA==
Date: Wed, 25 May 2022 18:02:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    jbeulich@suse.com, roger.pau@citrix.com, Bertrand.Marquis@arm.com, 
    George.Dunlap@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
In-Reply-To: <a19d22ca-33ef-b348-ac88-490010464bad@xen.org>
Message-ID: <alpine.DEB.2.22.394.2205251740280.1905099@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop> <20220525003505.304617-1-sstabellini@kernel.org> <a19d22ca-33ef-b348-ac88-490010464bad@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 May 2022, Julien Grall wrote:
> Hi Stefano,
> 
> On 25/05/2022 01:35, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > Introduce a list of MISRA C rules that apply to the Xen hypervisor. The
> > list is in RST format.
> > 
> > Add a mention of the new list to CODING_STYLE.
> > 
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> NIT: I was under the impression that the first Signed-off-by is usually
> author. But the From doesn't match.
> 
> > ---
> >   CODING_STYLE         |  6 ++++
> >   docs/misra/rules.rst | 65 ++++++++++++++++++++++++++++++++++++++++++++
> >   2 files changed, 71 insertions(+)
> >   create mode 100644 docs/misra/rules.rst
> > 
> > diff --git a/CODING_STYLE b/CODING_STYLE
> > index 9f50d9cec4..1ef35ee8d0 100644
> > --- a/CODING_STYLE
> > +++ b/CODING_STYLE
> > @@ -235,3 +235,9 @@ callstack between the initial function call and the
> > failure, no error
> >   is returned.  Using domain_crash() requires careful inspection and
> >   documentation of the code to make sure all callers at the stack handle
> >   a newly-dead domain gracefully.
> > +
> > +MISRA C
> > +-------
> > +
> > +The Xen Project hypervisor follows the MISRA C coding rules and
> > +directives listed under docs/misra/rules.rst.
> > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > new file mode 100644
> > index 0000000000..c0ee58ab25
> > --- /dev/null
> > +++ b/docs/misra/rules.rst
> > @@ -0,0 +1,65 @@
> > +=====================
> > +MISRA C rules for Xen
> > +=====================
> > +
> > +**IMPORTANT** All MISRA C rules, text, and examples are copyrighted by the
> > +MISRA Consortium Limited and used with permission.
> > +
> > +Please refer to https://www.misra.org.uk/ to obtain a copy of MISRA C, or
> > for
> > +licensing options for other use of the rules.
> > +
> > +The following is the list of MISRA C rules that apply to the Xen Project
> > +hypervisor.
> I was under the impression that we would still allow deviations on those rules
> in some cases. In particular...
> > +- Rule: Dir 2.1
> > +  - Severity:  Required
> > +  - Summary:  All source files shall compile without any compilation errors
> > +  - Link:
> > https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_02_01.c
> > +- Rule: Dir 4.7
> > +  - Severity:  Required
> > +  - Summary:  If a function returns error information then that error
> > information shall be tested
> > +  - Link:
> > https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_07.c
> 
> 
> ... this one. We are using (void) + a comment when the return is ignored on
> purpose. This is technically not-compliant with MISRA but the best we can do
> in some situation.
> 
> With your proposed wording, we would technically have to remove them (or not
> introduce new one). So I think we need to document that we are allowing
> deviations so long they are commented.

Absolutely yes. All of these rules can have deviations as long as they
make sense and they are commented. Note that we still have to work out
a good tagging system so that ECLAIR and cppcheck can recognize the
deviations automatically but for now saying that they need to be
commented is sufficient I think.

So I'll add the following on top of the file:

"""
It is possible that in specific circumstances it is best not to follow a
rule because it is not possible or because the alternative leads to
better code quality. Those cases are called "deviations". They are
permissible as long as they are documented with an in-code comment.
"""

