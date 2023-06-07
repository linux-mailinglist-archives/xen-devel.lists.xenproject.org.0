Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C307270E7
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 23:53:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545028.851203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q715d-0006iF-3B; Wed, 07 Jun 2023 21:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545028.851203; Wed, 07 Jun 2023 21:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q715d-0006fz-03; Wed, 07 Jun 2023 21:53:13 +0000
Received: by outflank-mailman (input) for mailman id 545028;
 Wed, 07 Jun 2023 21:53:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ksrr=B3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q715b-0006ft-Mr
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 21:53:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afb8f1f3-057d-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 23:53:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD2366171A;
 Wed,  7 Jun 2023 21:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 063D5C433EF;
 Wed,  7 Jun 2023 21:53:04 +0000 (UTC)
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
X-Inumbo-ID: afb8f1f3-057d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686174786;
	bh=fMldTn9JrUTXMck43SR/8GKlLRZh+XwUq7tjXmYV7tE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rjl/y4tO5ICMKXA3vTGxXoO6l7GMCtLNeMe2aNKEbx81kxt5QSz9qK7m8RqtMQQ97
	 9BlYizvY4uYk+wRS/fwcOiBkEC6eF8QDD1cBdI8dVc83mBVeMayWckrIKDQBmligJz
	 aEanxCnc1H5Mfg/6927dQpnUJTW4jLvc29drJHQUTxa9k1NZAYcNS+QTkFRc+oB+4r
	 0w/EJcUOHmz2AyzdBgMwZZnOpZYuuUsYK7RdvufZmFXHwOE539nrmp60/MZKTKiY+Z
	 5sQxOu36UX7938h63dQs3F2DZce01tlCdrfqvdjMr31KAgtoZs/iVdFju4OMU5YEsA
	 aEsBFW0y9wUoQ==
Date: Wed, 7 Jun 2023 14:53:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, roberto.bagnara@bugseng.com, 
    julien@xen.org, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    bertrand.marquis@arm.com, Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: new rules addition
In-Reply-To: <955f134b-75b8-f8a4-2e02-ae6def536ffb@suse.com>
Message-ID: <alpine.DEB.2.22.394.2306071430160.3567387@ubuntu-linux-20-04-desktop>
References: <20230607013810.3385316-1-sstabellini@kernel.org> <955f134b-75b8-f8a4-2e02-ae6def536ffb@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Jun 2023, Jan Beulich wrote:
> On 07.06.2023 03:38, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > For Dir 1.1, a document describing all implementation-defined behaviour
> > (i.e. gcc-specific behavior) will be added to docs/misra, also including
> > implementation-specific (gcc-specific) appropriate types for bit-field
> > relevant to Rule 6.1.
> > 
> > Rule 21.21 is lacking an example on gitlab but the rule is
> > straightforward: we don't use stdlib at all in Xen.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > We also discussed Rules 2.1, 5.5 and 7.4 but they require more work
> > before we can decide one way or the other.
> 
> Since I wasn't able to attend yesterday's meeting, please forgive a
> couple of remarks:

No problem


> > @@ -133,6 +146,16 @@ existing codebase are work-in-progress.
> >         headers (xen/include/public/) are allowed to retain longer
> >         identifiers for backward compatibility.
> >  
> > +   * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
> > +     - Required
> > +     - A typedef name shall be a unique identifier
> > +     -
> 
> Considering that the rule requires uniqueness across the entire code
> base (and hence precludes e.g. two functions having identically named
> local typedefs), I'm a little puzzled this was adopted. I for one
> question that a use like the one mentioned is really at risk of being
> confusing. Instead I think that the need to change at least one of
> the names is at risk of making the code less readable then, even if
> ever so slightly. (All of this said - I don't know if we have any
> violations of this rule.)

I don't think we have many local typedefs and I think we have only few
violations if I remember right. I'll let Roberto confirm how many. This
rule was considered not a difficult rule (some difficult rules were
found, namely 2.1, 5.5 and 7.4.)


> > +   * - `Rule 6.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_01.c>`_
> > +     - Required
> > +     - Bit-fields shall only be declared with an appropriate type
> > +     -
> 
> This requires you have settled on what "an appropriate type" is, i.e.
> whether our uses of e.g. types wider than int is meant to become a
> deviation, or will need eliminating. I suppose the outcome of this
> could do with mentioning as a remark here.

Yes, Roberto showed the "appropriate types" for gcc and there were
plenty including unsigned long if I remember right. I didn't write the
full list down.

Roberto do you have the list ready? I can add it in the Notes section
here.


> > @@ -143,6 +166,12 @@ existing codebase are work-in-progress.
> >       - Octal constants shall not be used
> >       -
> >  
> > +   * - `Rule 7.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_02.c>`_
> > +     - Required
> > +     - A "u" or "U" suffix shall be applied to all integer constants
> > +       that are represented in an unsigned type
> > +     -
> 
> "Represented in an unsigned type" means there is a dependency on the
> target architecture and compiler capabilities: Representation can only
> be determined once knowing the underlying binary ABI, and uses in #if
> and alike require knowing the widest integer type's size that the
> compiler supports. As a consequence this looks like it may require, in
> certain cases, to add u/U conditionally. Any such conditionals pose a
> risk of cluttering the code.

I don't think there is any plan to add u/U conditionally, and I can see
that would be undesirable. I think the idea is to add u/U to all
constants meant to be unsigned. But also here I'll Roberto chime in --
he said they already have a draft patch to fix this.


> > @@ -314,6 +343,11 @@ existing codebase are work-in-progress.
> >         used following a subsequent call to the same function
> >       -
> >  
> > +   * - Rule 21.21
> > +     - Required
> > +     - The Standard Library function system of <stdlib.h> shall not be used
> > +     -
> 
> I wish inapplicable (to us) rules would also be marked as such.
 
Yes, actually it could be a good idea to say "inapplicable" in the Notes
section for all the rules like this one. I can write a patch for it.

