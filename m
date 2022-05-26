Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C4A5347E6
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 03:12:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337408.561999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nu23J-0006SY-Rf; Thu, 26 May 2022 01:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337408.561999; Thu, 26 May 2022 01:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nu23J-0006QN-Of; Thu, 26 May 2022 01:12:37 +0000
Received: by outflank-mailman (input) for mailman id 337408;
 Thu, 26 May 2022 01:12:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nu23I-0006QG-6V
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 01:12:36 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec40b790-dc90-11ec-837f-e5687231ffcc;
 Thu, 26 May 2022 03:12:34 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97807B81EB7;
 Thu, 26 May 2022 01:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CD7C385B8;
 Thu, 26 May 2022 01:12:31 +0000 (UTC)
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
X-Inumbo-ID: ec40b790-dc90-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653527552;
	bh=EuAA4/ALIXULFw4CT6MK/y3YySWi72e1tUl+4aO/eDs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XqSNXJr/J5NQUIekR622nKqTyIv1ziY1wogio9Y1/hE+WqDnXftOCpfxMzDAwNY2c
	 5pUBHX6SqSBX7kL+QdBLHerDgwLKU119qk1zcHhXr2ywgJ6JB9qfPGNbwJ9nPr9GI8
	 GU/Pvo3Tk0FnEOKseAtrf/FIaQWAC0kWQxA67+CXJHjNpex14Y8CVKzssz4hsxam8j
	 fUVHPscnyDp9IA6XdzOA59f21JDdBefFgNpsiJk2+VqA0n3KBKvndcv20jIKe03EGg
	 CNVplDHf9kzl0HZkWWl5syiF8Nno9eus+JXtl4I8lzU0pmnwIHdANggdtqGdOAojtk
	 BcgeWy6K8uqKQ==
Date: Wed, 25 May 2022 18:12:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, julien@xen.org, Bertrand.Marquis@arm.com, 
    George.Dunlap@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
In-Reply-To: <62f142e3-02c7-22e0-3917-3a29fa2630b1@suse.com>
Message-ID: <alpine.DEB.2.22.394.2205251746250.1905099@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop> <20220525003505.304617-1-sstabellini@kernel.org> <62f142e3-02c7-22e0-3917-3a29fa2630b1@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 May 2022, Jan Beulich wrote:
> On 25.05.2022 02:35, Stefano Stabellini wrote:
> > --- a/CODING_STYLE
> > +++ b/CODING_STYLE
> > @@ -235,3 +235,9 @@ callstack between the initial function call and the failure, no error
> >  is returned.  Using domain_crash() requires careful inspection and
> >  documentation of the code to make sure all callers at the stack handle
> >  a newly-dead domain gracefully.
> > +
> > +MISRA C
> > +-------
> > +
> > +The Xen Project hypervisor follows the MISRA C coding rules and
> > +directives listed under docs/misra/rules.rst.
> 
> Putting this at the very bottom isn't helpful, I'm afraid. I'd rather
> see this go directly after the initial paragraphs, before "Indentation".

I can do that


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
> > +Please refer to https://www.misra.org.uk/ to obtain a copy of MISRA C, or for
> > +licensing options for other use of the rules.
> > +
> > +The following is the list of MISRA C rules that apply to the Xen Project
> > +hypervisor.
> > +
> > +- Rule: Dir 2.1
> > +  - Severity:  Required
> > +  - Summary:  All source files shall compile without any compilation errors
> > +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_02_01.c
> > +- Rule: Dir 4.7
> > +  - Severity:  Required
> > +  - Summary:  If a function returns error information then that error information shall be tested
> > +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_07.c
> > +- Rule: Dir 4.10
> > +  - Severity:  Required
> > +  - Summary:  Precautions shall be taken in order to prevent the contents of a header file being included more than once
> > +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_10.c
> 
> Like Julien has already pointed out for 4.7, this and perhaps other ones
> also want clarifying somewhere that we expect certain exceptions. Without
> saying so explicitly, someone could come forward with a patch eliminating
> some uses (and perhaps crippling the code) just to satisfy such a rule.
> This would then be a waste of both their and our time.

Yes, and also Julien pointed out something similar. I'll add a statement
at the top of the file to say that there can be deviations as long as
they are commented.

I wouldn't go as far as adding a note to each specific rule where we
expect deviations because I actually imagine that many of them will end
up having at least one deviation or two. It would be easier to mark the
ones where we expect to have 100% compliance and intend to keep it that
way (once we reach 100% compliance).

We are still in the early days of this process. For now, what about
adding the following statement at the top of the file (in addition to
the one saying that deviations are permissible):

"""
The existing codebase is not 100% compliant with the rules. Some of the
violations are meant to be documented as deviations, while some others
should be fixed. Both compliance and documenting deviations on the
existing codebase is work-in-progress.
"""


> > +- Rule: Dir 4.14
> > +  - Severity:  Required
> > +  - Summary:  The validity of values received from external sources shall be checked
> > +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_14.c
> > +- Rule: Rule 1.3
> > +  - Severity:  Required
> > +  - Summary:  There shall be no occurrence of undefined or critical unspecified behaviour
> > +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_01_03.c
> > +- Rule: Rule 3.2
> > +  - Severity:  Required
> > +  - Summary:  Line-splicing shall not be used in // comments
> > +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_03_02.c
> 
> To aid easily looking up presence of a rule here, I think the table wants
> sorting numerically.

They are sorted numerically, first the "Dir" (directives) then the
"Rules".


> > +- Rule: Rule 6.2
> > +  - Severity:  Required
> > +  - Summary:  Single-bit named bit fields shall not be of a signed type
> > +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_02.c
> > +- Rule: Rule 8.1
> > +  - Severity:  Required
> > +  - Summary:  Types shall be explicitly specified
> > +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_01.c
> > +- Rule: Rule 8.4
> > +  - Severity:  Required
> > +  - Summary:  A compatible declaration shall be visible when an object or function with external linkage is defined
> > +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_04.c
> > +- Rule: Rule 8.5
> > +  - Severity:  Required
> > +  - Summary:  An external object or function shall be declared once in one and only one file
> > +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_05_2.c
> > +- Rule: Rule 8.6
> > +  - Severity:  Required
> > +  - Summary:  An identifier with external linkage shall have exactly one external definition
> > +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_06_2.c
> 
> I don't think this was uncontroversial, as we've got a lot of uses of
> declarations when we expect DCE to actually take out all uses. There
> are also almost a thousand violations, which - imo - by itself speaks
> against adoption.

Ah yes, good catch. We spoke about DCE in the context of Rule 2.1, not
this one. My preference would be to keep Rule 8.6 with a note allowing
DCE:

- Note: declarations without definitions are allowed (specifically when
  the definition is compiled-out or optimized-out by the compiler)

But if this is controversial, I can move it to be discussed later
together with Rule 2.1.

