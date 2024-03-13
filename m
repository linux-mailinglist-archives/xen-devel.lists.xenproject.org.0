Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CFA87B50F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 00:05:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692812.1080300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkXej-0007Vu-PV; Wed, 13 Mar 2024 23:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692812.1080300; Wed, 13 Mar 2024 23:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkXej-0007TE-Mg; Wed, 13 Mar 2024 23:05:05 +0000
Received: by outflank-mailman (input) for mailman id 692812;
 Wed, 13 Mar 2024 23:05:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EqwV=KT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rkXei-0007T8-GR
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 23:05:04 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e0c5231-e18e-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 00:05:01 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DE02ECE1CA2;
 Wed, 13 Mar 2024 23:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1531EC433C7;
 Wed, 13 Mar 2024 23:04:54 +0000 (UTC)
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
X-Inumbo-ID: 1e0c5231-e18e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710371096;
	bh=294N+38gOOh3pZ1r4mUaNjHKsZxwVMcpbaIIT40Dm9o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=u5pc8ebSDw8TtxU13rFUCnQvDqGpffGofeKubzHKzG2bgZ6G98o8a8+VHthactvTP
	 WLKHUjgfGP1yq0AuW+N9VQQ0IbI5L//G4zmkXRz6glDcKHPcpLrFZcTyuvOQJB59ej
	 duR5l6pIqj1i7IKfcn7kAXP6FhA/Zv1BnQcvwyxbDZDoOTDHJJAARmw7POMC4/I+rs
	 oUSCJOC0Sq9n3XQoXaDfZXb98GZ+vPthI1Dh+Q7oIvki3SW6s3wnjOPYpd75xF1IvS
	 q5+V7yKjQ42koLkgzePMO4oPGof8r/3i5utAhtfl3oAlgmQ0JJS+pAfo8BK7DNHU9a
	 8Imnk8hNaHWfg==
Date: Wed, 13 Mar 2024 16:04:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, julien@xen.org, michal.orzel@amd.com, 
    roger.pau@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: add Rule 16.4
In-Reply-To: <136e4667-8c6d-45ec-b652-b6b690a16f34@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403131554100.853156@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2403121725370.853156@ubuntu-linux-20-04-desktop> <136e4667-8c6d-45ec-b652-b6b690a16f34@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Mar 2024, Jan Beulich wrote:
> On 13.03.2024 01:28, Stefano Stabellini wrote:
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -478,6 +478,30 @@ maintainers if you want to suggest a change.
> >       - In addition to break, also other unconditional flow control statements
> >         such as continue, return, goto are allowed.
> >  
> > +   * - `Rule 16.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_04.c>`_
> > +     - Required
> > +     - Every switch statement shall have a default label
> > +     - Switch statements with enums as controlling expression don't need
> > +       a default label as gcc -Wall enables -Wswitch which warns (and
> > +       breaks the build)
> 
> I think this could do with mentioning -Werror.

No problem


> > if one of the enum labels is missing from the
> > +       switch.
> > +
> > +       Switch statements with integer types as controlling expression
> > +       should have a default label:
> > +
> > +       - if the switch is expected to handle all possible cases
> > +         explicitly, then a default label shall be added to handle
> > +         unexpected error conditions, using BUG(), ASSERT(), WARN(),
> > +         domain_crash(), or other appropriate methods;
> > +
> > +       - if the switch is expected to handle a subset of all
> > +         possible cases, then a default label shall be added with an
> > +         in-code comment as follows::
> > +
> > +             /* only handle a subset of the possible cases */
> > +             default:
> > +                 break;
> 
> Unless it being made crystal clear that mechanically reproducing this
> comment isn't going to do, I'm going to have a hard time picking
> between actively vetoing or just accepting if someone else acks this.
> At the very least, though, the suggested (or, as requested, example)
> comment should match ./CODING_STYLE. And it may need placing
> differently if I understood correctly what Misra / Eclair demand
> (between default: and break; rather than ahead of both).
> 
> The only place I'd accept a pre-cooked comment is to cover the
> "notifier pattern".

Hi Jan, 

During the MISRA C call we discussed two distinct situations:

1) when the default is not supposed to happen (it could be an BUG_ON)
2) when we only handle a subset of cases on purpose

For 2), it is useful to have a comment to clarify that we are dealing
with 2) instead of 1). It is not a pre-cooked comment. The comment
should be reviewed and checked that it is actually true that for this
specific switch the default is expected and we should do nothing.

However, the comment is indeed pre-cooked in the sense that we don't
need to have several different variations of them to explain why we only
handle a subset of cases.

The majority of people on the call agreed with this (or so I understood).

