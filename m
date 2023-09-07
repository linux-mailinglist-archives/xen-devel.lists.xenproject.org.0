Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F4A797E10
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 23:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597642.931884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeMor-0003Pc-6V; Thu, 07 Sep 2023 21:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597642.931884; Thu, 07 Sep 2023 21:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeMor-0003Nv-2a; Thu, 07 Sep 2023 21:45:45 +0000
Received: by outflank-mailman (input) for mailman id 597642;
 Thu, 07 Sep 2023 21:45:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Shnx=EX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qeMoq-0003Np-4Q
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 21:45:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3b33809-4dc7-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 23:45:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3FC8C61387;
 Thu,  7 Sep 2023 21:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A11C433C8;
 Thu,  7 Sep 2023 21:45:38 +0000 (UTC)
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
X-Inumbo-ID: e3b33809-4dc7-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694123139;
	bh=i5qV3ODWpssPlpo/XFzf12AWAWgnlD+O3LKHQu6YMNI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P69AP3K0ieAo6nUqEzX5ctbBbWcsWJJcR6C080LPXD7Hueykmmvn2e1h0ubC/xwKr
	 0Fly2dt5Yf50uXpKt1EwZQKnv4B6R9Ubaaz40k5nYRJUO+KgQVY0Qk7TRP2frFlhNZ
	 zOt3ZqqxtRaMUVGx21vL8Nvd0n7NtHK0CT1a3mEs6YD6uFpdPhNxyz1ujZKFrqehaq
	 n39OFp6Qc2qADU1OArgTnzVebawQHBZrnVjrAJIlZ5c9DcIPDRPS7iyPuQOEricE4s
	 LU7x17IvM1//SJOFTo1eLOVGs9mk+21BpYnFcAJrCYn7fHMnT3FX4m1DoKPa2Z0mdn
	 w+HtpRa1wNq2w==
Date: Thu, 7 Sep 2023 14:45:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, julien@xen.org, george.dunlap@citrix.com, 
    bertrand.marquis@arm.com, roberto.bagnara@bugseng.com, 
    nicola.vetrini@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] docs/misra: add 14.3
In-Reply-To: <36b888b2-e7e3-bf70-f599-d22ca34e2dfe@suse.com>
Message-ID: <alpine.DEB.2.22.394.2309071441400.6458@ubuntu-linux-20-04-desktop>
References: <20230907012203.1238090-1-sstabellini@kernel.org> <36b888b2-e7e3-bf70-f599-d22ca34e2dfe@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Sep 2023, Jan Beulich wrote:
> On 07.09.2023 03:22, Stefano Stabellini wrote:
> > @@ -385,6 +386,17 @@ maintainers if you want to suggest a change.
> >       - A loop counter shall not have essentially floating type
> >       -
> >  
> > +   * - `Rule 14.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_03.c>`_
> > +     - Required
> > +     - Controlling expressions shall not be invariant
> > +     - Due to the extensive usage of IS_ENABLED, sizeof compile-time
> > +       checks, and other constructs that are detected as errors by MISRA
> > +       C scanners, managing the configuration of a MISRA C scanner for
> > +       this rule would be unmanageable. Thus, this rule is adopted with
> > +       a project-wide deviation on if ?: and switch statements.
> 
> Do we want to go as far as permitting this uniformly for all switch()? In
> my earlier reply I had included sizeof() for a reason.
 
I agree with you that it would be better to restrict it to only some
switch uses, rather than all of them.

But if we are going to restrict the deviation to switch(sizeof()), which
I think is a good idea and I am in favor, wouldn't it be better to
handle these cases as individual deviations? E.g. docs/misra/safe.json?
I am assuming there are only few cases like that and adding it here
makes the rule more complicated.

I am happy either way but I wanted to provide that as an option.


> Also (nit) there's at least a comma missing after "if". To make clear it's
> keywords that are meant, maybe better use if() / switch()?

OK I'll do that

