Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B98D254A2BB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 01:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348512.574748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0tUl-0004lN-Fr; Mon, 13 Jun 2022 23:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348512.574748; Mon, 13 Jun 2022 23:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0tUl-0004iY-CL; Mon, 13 Jun 2022 23:29:19 +0000
Received: by outflank-mailman (input) for mailman id 348512;
 Mon, 13 Jun 2022 23:29:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWck=WU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o0tUk-0004iR-Bx
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 23:29:18 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3d2ec50-eb70-11ec-8901-93a377f238d6;
 Tue, 14 Jun 2022 01:29:16 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 87D65B81123;
 Mon, 13 Jun 2022 23:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6D6C34114;
 Mon, 13 Jun 2022 23:29:13 +0000 (UTC)
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
X-Inumbo-ID: a3d2ec50-eb70-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655162954;
	bh=ctOhg685xuEJy2ublrMljlYEr1+w8lY7lbA7BJBiVnE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QXEfZu031fBPKpFJGk4bSkcGIkwVFPWYa8XqdE8bfV5K4I4K7EfKsjDiZP6TiY5QL
	 Wj5ZGh/zTs6DyrAfwGFJPEudBFn23AdHOx4j9y8byFsjkupvxBi1/oPKS2tbvj8NWz
	 37EUXcHbzj44nI0une26YasAyG1gLpPzCQJVUqZP7tjmVnr5PUBiFnputYH8dy6YrV
	 PCAOPZAi+xT4m9PO7NtundBlBjGGSW4htHzFZAc9YtEqnA+Rfj6WG6Dr9KS+82P3wX
	 SI6tEJHz8FMrjBGm8c11iXVDwxWUpHrMNP8KQapbGUWFXDOcelyf5IHB88iXfAUOhi
	 jKMGaotq83LtQ==
Date: Mon, 13 Jun 2022 16:29:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, George.Dunlap@citrix.com, 
    roger.pau@citrix.com, Artem_Mygaiev@epam.com, Andrew.Cooper3@citrix.com, 
    julien@xen.org, Bertrand.Marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] add more MISRA C rules to docs/misra/rules.rst
In-Reply-To: <2c4b41e4-7381-7424-de72-43f55c448665@suse.com>
Message-ID: <alpine.DEB.2.22.394.2206131627050.1837490@ubuntu-linux-20-04-desktop>
References: <20220610212755.1051640-1-sstabellini@kernel.org> <2c4b41e4-7381-7424-de72-43f55c448665@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Jun 2022, Jan Beulich wrote:
> On 10.06.2022 23:27, Stefano Stabellini wrote:
> > +   * - `Rule 5.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_03.c>`_
> > +     - Required
> > +     - An identifier declared in an inner scope shall not hide an
> > +       identifier declared in an outer scope
> > +     - Using macros as macro parameters at invocation time is allowed
> > +       even if both macros use identically named local variables, e.g.
> > +       max_t(var0, min_t(var1, var2))
> 
> Nit: I would have been okay with the prior use of MIN() and MAX() in this
> example, but now that you have switched to min_t() / max_t() I think the
> example also wants to match our macros of these names. Hence I'd like to
> suggest that either you switch to using min() / max() (which also use
> local variables), or you add the missing "type" arguments in both macro
> invocations.

I see your point. I'll use min/max as follows:

max(var0, min(var1, var2))

If you are OK with that and there are no other suggestions this tiny
change could be done on commit.

