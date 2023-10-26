Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580F87D7A0D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 03:18:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623387.971227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvozk-0001W5-Co; Thu, 26 Oct 2023 01:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623387.971227; Thu, 26 Oct 2023 01:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvozk-0001TS-9q; Thu, 26 Oct 2023 01:17:08 +0000
Received: by outflank-mailman (input) for mailman id 623387;
 Thu, 26 Oct 2023 01:17:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2QB=GI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qvozi-0001TM-Gh
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 01:17:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d49f842-739d-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 03:17:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5C02C62461;
 Thu, 26 Oct 2023 01:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4ECC433C7;
 Thu, 26 Oct 2023 01:16:58 +0000 (UTC)
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
X-Inumbo-ID: 5d49f842-739d-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698283020;
	bh=rRGZu0zoE846AQrYCuTEVLdxg5WF6CtbSj53VvPXFv8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HYBRFyiNQpSC++Opv7WY5TKBQ21wk1qPQbBF5jyY7v1XmG41b1lsP0u4KLQPlPnAI
	 OWxdU2R4qqnC4+BYCWGhG7y56uzOrGhQKhwK7q0MAGirwTQt5idg7TeHVqHRZAvdih
	 dARjvqm+MVWwMXx0kfX+rK3Ao4md2T6rF5FJPoonwG+EWKnfutuhrs4rfsM6L/Thg0
	 xvlWa9UwTbQLpDG86PErsUI2ScoiPWfMfOrq8UYMh4xRLRE5tanTxuE+6q4C1ccYxy
	 uvTpus8GEho1fe0gvLHhbXrg6dDxh5kxRoYnkXn0+8ytKssC26mJEWiJghTSylEDyp
	 XMgS3S+SPknwQ==
Date: Wed, 25 Oct 2023 18:16:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org, 
    bertrand.marquis@arm.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    george.dunlap@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: add R14.4 R21.1 R21.2
In-Reply-To: <1e2991d7-b7b5-2fdd-38e0-ee1eff607f0e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310251759560.271731@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2310231628500.3516@ubuntu-linux-20-04-desktop> <967caedc-3d10-dee4-6614-1b9dcc0c1c66@suse.com> <alpine.DEB.2.22.394.2310241753220.271731@ubuntu-linux-20-04-desktop> <1e2991d7-b7b5-2fdd-38e0-ee1eff607f0e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Oct 2023, Jan Beulich wrote:
> On 25.10.2023 03:15, Stefano Stabellini wrote:
> > On Tue, 24 Oct 2023, Jan Beulich wrote:
> >> On 24.10.2023 01:31, Stefano Stabellini wrote:> --- a/docs/misra/rules.rst
> >>> +++ b/docs/misra/rules.rst
> >>> @@ -422,6 +422,13 @@ maintainers if you want to suggest a change.
> >>>  
> >>>         while(0) and while(1) and alike are allowed.
> >>>  
> >>> +   * - `Rule 14.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_04.c>`_
> >>> +     - Required
> >>> +     - The controlling expression of an if statement and the controlling
> >>> +       expression of an iteration-statement shall have essentially
> >>> +       Boolean type
> >>> +     - Implicit conversions to boolean are allowed
> >>
> >> What, if anything, remains of this rule with this exception?
> > 
> > Not much, but there is a difference between following a rule with a
> > deviation (in this case we allow implicit conversions of integers and
> > pointers to bool because we claim all Xen developers know how they work)
> > and not follow the rule at all, at least for the assessors. Also,
> > anything that doesn't implicitly convert to a boolean is not allowed,
> > although I guess probably it wouldn't compile either.
> > 
> > We could also try to find a better wording to reduce the deviation only
> > to integer and pointers. Any suggestions?
> 
> Since compound types can't be converted anyway, I think only floating
> point types (and their relatives) remain, which we don't use anyway
> (and if we did, excepting them as well would only be logical imo). I
> therefore see little point in making "integers and pointers" explicit.
> 
> Instead I wonder if we shouldn't make ourselves honest and say we
> deviate this rule as a whole.

Yes, I see your point. I think I'll remove Rule 14.4 from the patch and
put it in the bucket of all the rules deviated as a whole (which we
should track as a separate rst file but today we don't.)


> >>> @@ -479,6 +486,24 @@ maintainers if you want to suggest a change.
> >>>         they are related
> >>>       -
> >>>  
> >>> +   * - `Rule 21.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_01.c>`_
> >>> +     - Required
> >>> +     - #define and #undef shall not be used on a reserved identifier or
> >>> +       reserved macro name
> >>> +     - No identifiers should start with _BUILTIN to avoid clashes with
> >>
> >> DYM "__builtin_"? Also gcc introduces far more than just __builtin_...()
> >> into the name space.
> > 
> > Yes agreed, but in my notes that is the only one I wrote down. I recall
> > that the complete list is a couple of pages long, I don't think we can
> > possibly add it here in full and if I recall it is not available in the
> > GCC documentation. More on this below.
> > 
> > 
> >>> +       GCC reserved identifiers. In general, all identifiers starting with
> >>> +       an underscore are reserved, and are best avoided.
> >>
> >> This isn't precise enough. A leading underscore followed by a lower-case
> >> letter or a number is okay to use for file-scope symbols. Imo we should
> >> not aim at removing such uses, but rather encourage more use.
> > 
> > More on this below
> > 
> > 
> >> In this context, re-reading some of the C99 spec, I have to realize that
> >> my commenting on underscore-prefixed macro parameters (but not underscore-
> >> prefixed locals in macros) was based on ambiguous information in the spec.
> >> I will try to remember to not comment on such anymore going forward.
> >>
> >>> However, Xen
> >>> +       makes extensive usage of leading underscores in header guards,
> >>> +       bitwise manipulation functions, and a few other places. They are
> >>> +       considered safe as checks have been done against the list of
> >>> +       GCC's reserved identifiers. They don't need to be replaced.
> >>
> >> This leaves quite vague what wants and what does not want replacing, nor
> >> what might be okay to introduce subsequently despite violation this rule.
> >  
> > My goals here were to convey the following:
> > 1) avoid clashes with gcc reserved identifiers
> > 2) in general try to reduce the usage of leading underscores except for
> >    known existing locations (header guards, bitwise manipulation
> >    functions)
> > 
> > However, for 1) the problem is that we don't have the full list and for
> > 2) the problem is that it is too vague.
> > 
> > Instead I suggest we do the following:
> > - we get the full list of gcc reserved identifiers from Roberto and we
> >   commit it to xen.git as a seprate file under docs/misra
> 
> Such a full list can only be compiled for any specific gcc version. Even
> non-upstream backports by a distro may alter this list.
> 
> > - we reference the list here saying one should avoid clashes with those
> >   identifiers as reserved by gcc
> 
> With the list constantly changing (mostly expanding), that's pretty
> hopeless.
> 
> > And if we can find a clear general comment about the usage of leading
> > underscores in Xen I am happy to add it too (e.g. header guards), but
> > from MISRA point of view the above is sufficient.
> 
> But what we need isn't a description of the status quo, but one of
> what state we want to (slowly) move to. The status quo anyway is
> "no pattern, as in the past hardly anyone cared".

I guess you are suggesting something more like the following, but please
feel free to suggest your favorite wording (it might be easier for me to
understand what you mean if you provide a short example).

---
All identifiers starting with an underscore are reserved and should not
be used. Today Xen uses many, such as header guards and bitwise
manipulation functions. Upon analysis it turns out Xen identifiers do
not clash with the identifiers used by modern GCC, but that is not a
guarantee that there won't be a naming clash in the future or with
another compiler. For these reasons we discourage the introduction of
new reserved identifiers in Xen, and we see it as positive the reduction
of reserved identifiers. At the same time, certain identifiers starting
with an underscore are also commonly used in Linux (e.g. __set_bit) and
we don't think it would be an improvement to rename them.

