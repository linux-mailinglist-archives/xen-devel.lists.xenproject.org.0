Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E317D5F6E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 03:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622628.969641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvSUJ-0000af-2Z; Wed, 25 Oct 2023 01:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622628.969641; Wed, 25 Oct 2023 01:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvSUI-0000Xq-Vj; Wed, 25 Oct 2023 01:15:10 +0000
Received: by outflank-mailman (input) for mailman id 622628;
 Wed, 25 Oct 2023 01:15:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/NE+=GH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qvSUI-0000Xi-36
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 01:15:10 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee4ee3ad-72d3-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 03:15:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D3F42CE34D2;
 Wed, 25 Oct 2023 01:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F41BDC433C8;
 Wed, 25 Oct 2023 01:15:00 +0000 (UTC)
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
X-Inumbo-ID: ee4ee3ad-72d3-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698196502;
	bh=WLDxZTCWWsuPXyE6piV7qfhC7FOWlxFdzHGgbi1qn/I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BA35kB2X1uFxuMqbuLRmJHeB0VOY3DSsH35aF+uNTyFbwmiR3JORLC7hfsUMEWhci
	 FtLL0FOv6IFHET0bI/W/APBBGvDC8TIOjGg/29VGjNlSy+sptBHRtaNZ/+1X1CQPgG
	 9N4Nc+IiSeemsH52xSNn2VyNcMilvoGe+H8MLc+znL+SMbsGdT6vU/8HCNveBXu08S
	 8sYZHEbvB9PUHtzCnDeb4rQ9FM0htT1IHm6uGN9OsEyaHZyfv1RlMCvSSuZPkfZN6J
	 92bWam/ieT8rmrAbnA5XdRWe8VDveP65330S9EyFbOVq93eXDjpG2pZm9uluzxRyGV
	 FhsSGxcCk1RTQ==
Date: Tue, 24 Oct 2023 18:15:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org, 
    bertrand.marquis@arm.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    george.dunlap@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: add R14.4 R21.1 R21.2
In-Reply-To: <967caedc-3d10-dee4-6614-1b9dcc0c1c66@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310241753220.271731@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2310231628500.3516@ubuntu-linux-20-04-desktop> <967caedc-3d10-dee4-6614-1b9dcc0c1c66@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Oct 2023, Jan Beulich wrote:
> On 24.10.2023 01:31, Stefano Stabellini wrote:> --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -422,6 +422,13 @@ maintainers if you want to suggest a change.
> >  
> >         while(0) and while(1) and alike are allowed.
> >  
> > +   * - `Rule 14.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_04.c>`_
> > +     - Required
> > +     - The controlling expression of an if statement and the controlling
> > +       expression of an iteration-statement shall have essentially
> > +       Boolean type
> > +     - Implicit conversions to boolean are allowed
> 
> What, if anything, remains of this rule with this exception?

Not much, but there is a difference between following a rule with a
deviation (in this case we allow implicit conversions of integers and
pointers to bool because we claim all Xen developers know how they work)
and not follow the rule at all, at least for the assessors. Also,
anything that doesn't implicitly convert to a boolean is not allowed,
although I guess probably it wouldn't compile either.

We could also try to find a better wording to reduce the deviation only
to integer and pointers. Any suggestions?


> > @@ -479,6 +486,24 @@ maintainers if you want to suggest a change.
> >         they are related
> >       -
> >  
> > +   * - `Rule 21.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_01.c>`_
> > +     - Required
> > +     - #define and #undef shall not be used on a reserved identifier or
> > +       reserved macro name
> > +     - No identifiers should start with _BUILTIN to avoid clashes with
> 
> DYM "__builtin_"? Also gcc introduces far more than just __builtin_...()
> into the name space.

Yes agreed, but in my notes that is the only one I wrote down. I recall
that the complete list is a couple of pages long, I don't think we can
possibly add it here in full and if I recall it is not available in the
GCC documentation. More on this below.


> > +       GCC reserved identifiers. In general, all identifiers starting with
> > +       an underscore are reserved, and are best avoided.
> 
> This isn't precise enough. A leading underscore followed by a lower-case
> letter or a number is okay to use for file-scope symbols. Imo we should
> not aim at removing such uses, but rather encourage more use.

More on this below


> In this context, re-reading some of the C99 spec, I have to realize that
> my commenting on underscore-prefixed macro parameters (but not underscore-
> prefixed locals in macros) was based on ambiguous information in the spec.
> I will try to remember to not comment on such anymore going forward.
>
> > However, Xen
> > +       makes extensive usage of leading underscores in header guards,
> > +       bitwise manipulation functions, and a few other places. They are
> > +       considered safe as checks have been done against the list of
> > +       GCC's reserved identifiers. They don't need to be replaced.
> 
> This leaves quite vague what wants and what does not want replacing, nor
> what might be okay to introduce subsequently despite violation this rule.
 
My goals here were to convey the following:
1) avoid clashes with gcc reserved identifiers
2) in general try to reduce the usage of leading underscores except for
   known existing locations (header guards, bitwise manipulation
   functions)

However, for 1) the problem is that we don't have the full list and for
2) the problem is that it is too vague.

Instead I suggest we do the following:
- we get the full list of gcc reserved identifiers from Roberto and we
  commit it to xen.git as a seprate file under docs/misra
- we reference the list here saying one should avoid clashes with those
  identifiers as reserved by gcc


And if we can find a clear general comment about the usage of leading
underscores in Xen I am happy to add it too (e.g. header guards), but
from MISRA point of view the above is sufficient.

