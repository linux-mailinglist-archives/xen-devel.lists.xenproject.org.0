Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5C1798B77
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 19:22:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598123.932656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qefBe-00018v-Pt; Fri, 08 Sep 2023 17:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598123.932656; Fri, 08 Sep 2023 17:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qefBe-00017E-ML; Fri, 08 Sep 2023 17:22:30 +0000
Received: by outflank-mailman (input) for mailman id 598123;
 Fri, 08 Sep 2023 17:22:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmm/=EY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qefBd-000178-S6
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 17:22:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48ba94df-4e6c-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 19:22:28 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C9ED6148B;
 Fri,  8 Sep 2023 17:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137E5C433CA;
 Fri,  8 Sep 2023 17:22:24 +0000 (UTC)
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
X-Inumbo-ID: 48ba94df-4e6c-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694193746;
	bh=1HxiDNugrtoYFiAR/Dn2f5iRc1IMqiJhRm0moIwf6m0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ds9fcsw7MveILDtX17e1Tr8F0vSWuGFwKdIgoWSGjTX79YjkM8I/LreCLBQLCycwg
	 oKwdYYH7h/am3cTqNcxa55IPxvKXFp8a34PMumBwPPOIPgUS5PSS7Th7cYsWHe3hBM
	 cZbLCU+N+lEtbpye5KuNo4ZXHNtg9+6gGEh2LJMyLpzfNBEjjxSnlGEn9yVCLzngtU
	 Lp0E1YyrZC9CfdNoKTU9eMHksLqafb5fgpVveuO1AtxFa8tLXbuMw92ROOnVBDnm2H
	 Xzh+iW/ZVmArKg9rgi9TEKr5zOwd3PPRulvQE2gqkKPBdqbHgNhlqr4XwNSjiKRbVc
	 crFhAO3tIM+5A==
Date: Fri, 8 Sep 2023 10:22:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/3] docs/misra: add documentation skeleton for MISRA
 C:2012 Dir 4.1
In-Reply-To: <f83504f2-c12c-c359-a1d5-8c20ce3de334@suse.com>
Message-ID: <alpine.DEB.2.22.394.2309081012061.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693558913.git.nicola.vetrini@bugseng.com> <e74433904abe30e2e9e030f663a7a87813dabd24.1693558913.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2309071659440.6458@ubuntu-linux-20-04-desktop>
 <f83504f2-c12c-c359-a1d5-8c20ce3de334@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Sep 2023, Jan Beulich wrote:
> On 08.09.2023 02:20, Stefano Stabellini wrote:
> > On Fri, 1 Sep 2023, Nicola Vetrini wrote:
> >> +Documentation for MISRA C:2012 Dir 4.1: read from uninitialized allocated object
> >> +________________________________________________________________________________
> >> +
> >> +To be written.
> >> +Example:
> >> +The code does not use dynamically allocated storage.
> > 
> > We do use dynamically allocated storage with xzalloc but xzalloc
> > initializes the object to zero
> 
> Just at the example of this: I'm not sure in how far the examples given
> were actually meant to (remotely) apply to our code base.

I thought they were generic examples as Nicola later confirmed. But
surprisingly many of them apply to our code base. I tried to highlight
the ones that are obviously wrong.


> As to your reply - there's also xmalloc() which doesn't, and the page
> allocator, and other more specialized ones.

Yes my reply was wrong in this case: I vastly underestimated the amount
of callers to xmalloc() that we have (and I grepped wrongly).

I think we should say instead:

The amount of dynamically allocated objects is limited at runtime in
static configurations. We make sure to initialize dynamically allocated
objects before reading them, and we utilize static analysis tools to
help check for that.

