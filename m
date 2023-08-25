Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A389C7890B3
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 23:49:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590998.923376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZefa-00028z-IR; Fri, 25 Aug 2023 21:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590998.923376; Fri, 25 Aug 2023 21:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZefa-00026u-Ff; Fri, 25 Aug 2023 21:48:42 +0000
Received: by outflank-mailman (input) for mailman id 590998;
 Fri, 25 Aug 2023 21:48:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmKO=EK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qZefZ-00026o-03
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 21:48:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 259134b7-4391-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 23:48:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 16FA960DCA;
 Fri, 25 Aug 2023 21:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A198C433C8;
 Fri, 25 Aug 2023 21:48:34 +0000 (UTC)
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
X-Inumbo-ID: 259134b7-4391-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693000116;
	bh=0RKeHqcgICz/i4KvJh6skJ/6xRFfHJBAp4GqXfDGvVA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WcHIb7ma9YpuFwHizVziGiTN9grIbYaweTGrNW5MCZz0hTmKGSGcxhVXocUqb0whL
	 0Y6aG7k2FAy1SV2p3CJdqu4xyLg7hrYtsGcqylvpDmmXRennmBLOYtzf2qpCM8bNEC
	 glCZ5yMCqHODU7vA53ivcP0bsgMOiinC23qMqykw3wGnV4syylTJU2XcpuguznQxy9
	 cg7yvNkEQzEvavVlEw4mmWKkBkez6X9wU50OhsX1fW5b8tB/B4NQj4LWP+jD+XizVN
	 KBVZ46KdtCb8K4oQuXS6xpgXmslZSWFj/Vr4DEP5UwJGrtI+IDZWqWMFgFrYAUaFzM
	 evBBfNaNvSYFA==
Date: Fri, 25 Aug 2023 14:48:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, julien@xen.org, george.dunlap@citrix.com, 
    bertrand.marquis@arm.com, nicola.vetrini@bugseng.com, 
    roberto.bagnara@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: add rules 10.1 10.2 10.3 10.4
In-Reply-To: <4cf3053a-504e-514d-e940-a47e9498b1c4@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308251437290.6458@ubuntu-linux-20-04-desktop>
References: <20230823231451.2989262-1-sstabellini@kernel.org> <4cf3053a-504e-514d-e940-a47e9498b1c4@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Aug 2023, Jan Beulich wrote:
> On 24.08.2023 01:14, Stefano Stabellini wrote:
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -318,6 +318,58 @@ maintainers if you want to suggest a change.
> >       - An element of an object shall not be initialized more than once
> >       -
> >  
> > +   * - `Rule 10.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_10_01.c>`_
> > +     - Required
> > +     - Operands shall not be of an inappropriate essential type
> > +     - The following are allowed:
> > +         - Value-preserving conversions of integer constants
> > +         - Bitwise and, or, xor, one's complement, bitwise and assignment,
> > +           bitwise or assignment, bitwise xor assignment (bitwise and, or, xor
> > +           are safe on non-negative integers; also Xen assumes two's complement
> > +           representation)
> > +         - Left shift, right shift, left shift assignment, right shift
> > +           assignment (see C-language-toolchain.rst for assumptions on
> > +           compilers' extensions)
> 
> Is "assumptions" the right term here? We don't just assume these are there,
> we actually checked their doc and behavior. Maybe simply "uses of" instead?

yes, I'll use "uses of"


> > +         - Implicit conversions to boolean for logical operators' arguments
> 
> What is "logical operators" here? Perhaps this wants to be "conditionals"
> instead, to cover all of ?:, if(), while(), for() (did I forget any?), of
> which only the first is an operator?

There are also ! || && which are the logical operators

I'll write it as follows:

Implicit conversions to boolean for conditionals (?: if
while for) and logical operators (! || &&)


> > +   * - `Rule 10.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_10_03.c>`_
> > +     - Required
> > +     - The value of an expression shall not be assigned to an object
> > +       with a narrower essential type or of a dierent essential type
> 
> Nit: ff missing?

yep, thanks


> > +       category
> > +     - Please beware that this rule has many violations in the Xen
> > +       codebase today, and its adoption is aspirational. However, when
> > +       submitting new patches please try to decrease the number of
> > +       violations when possible.
> > +
> > +       gcc has a helpful warning that can help you spot and remove
> > +       violations of this kind: conversion. For instance, you can use
> > +       it as follows:
> > +
> > +       cd xen; CFLAGS="-Wconversion -Wno-error=sign-conversion -Wno-error=conversion" make
> 
> Maybe slightly shorter as
> 
> CFLAGS="-Wconversion -Wno-error=sign-conversion -Wno-error=conversion" make -C xen
> 
> ?

I'll make the change here and also in the other instance of the same

