Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607AF897BF6
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 01:20:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700637.1094090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs9tu-0005aG-FB; Wed, 03 Apr 2024 23:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700637.1094090; Wed, 03 Apr 2024 23:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs9tu-0005Yk-CT; Wed, 03 Apr 2024 23:20:14 +0000
Received: by outflank-mailman (input) for mailman id 700637;
 Wed, 03 Apr 2024 23:20:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8MKa=LI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rs9ts-0005Ye-Tg
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 23:20:12 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b65da5c1-f210-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 01:20:10 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 67940CE0EC7;
 Wed,  3 Apr 2024 23:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF33EC433F1;
 Wed,  3 Apr 2024 23:20:04 +0000 (UTC)
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
X-Inumbo-ID: b65da5c1-f210-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712186405;
	bh=EW28XPGRb7hdIurpYOpgSO0xFJPqGSEGEEX7+G1+E/E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=N8XjWH4wgRSmYbvxRY+rrR9KKr13QuPnFE5Lp6APdZJXxsCgxNrAqK6defLs/N2al
	 TCFEBss8F48JxThyQGfVZQYG+0FGrfyeUDBS73ijke/DEqHKDi6/LHOkd26BtaQU8U
	 mb7/BfWZb41WmLMD72Rj6AaPO0tCwtSI/RZF4QddZkZjMPYUOJvr4aVyWSZ4yxH2OJ
	 nsxtRCCRgiE1AYafmFqCs3J0OBEUDwfjRnTnUflYQ5RB46UTFlb4mQ+IQxlfMRSIGN
	 xEzLcrIijoNjQrnwN02cCPAUSdxJ8jNaWgesnqujpe62RqYUXTorSiiJAPeKTmM44E
	 0wiePTBDnXmpA==
Date: Wed, 3 Apr 2024 16:20:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: add 13.6 to rules.rst
In-Reply-To: <217fdbe4-a4ba-4bea-b044-5677bf87717b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2404031614530.2245130@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2404021618030.2245130@ubuntu-linux-20-04-desktop> <217fdbe4-a4ba-4bea-b044-5677bf87717b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 Apr 2024, Jan Beulich wrote:
> On 03.04.2024 01:21, Stefano Stabellini wrote:
> > As agreed during MISRA C meetings, add Rule 13.6 to rules.rst.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > There was a request to expand the scope to also include alignof and
> > typeof. Depending on whether the MISRA C scanners support it, and under
> > which rules violations will be listed, rules.rst will be updated
> > accordingly (either updating the notes section of 13.6 or adding a new
> > entry.)
> 
> Hmm. Imo ...
> 
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -445,6 +445,12 @@ maintainers if you want to suggest a change.
> >       - Initializer lists shall not contain persistent side effects
> >       -
> >  
> > +   * - `Rule 13.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_13_06.c>`_
> > +     - Required
> > +     - The operand of the sizeof operator shall not contain any
> > +       expression which has potential side-effects
> > +     -
> 
> ... a note to this effect should be put here right away. We _want_ to
> respect the rule for the other two similar keywords, after all. What we
> don't know at this point is whether we can get help towards this from
> Eclair.
> 
> With such a note added:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Turns out 13.6 was already in rules.rst and I didn't notice it
immediately because it was not in order. So as I commit this patch I
took the opportunity to remove the older out of order entry, and also
add the note as requested

