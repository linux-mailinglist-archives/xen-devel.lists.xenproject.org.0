Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C285EACFA4B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 02:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007722.1386982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNKcv-0002T1-K8; Fri, 06 Jun 2025 00:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007722.1386982; Fri, 06 Jun 2025 00:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNKcv-0002QN-HS; Fri, 06 Jun 2025 00:08:05 +0000
Received: by outflank-mailman (input) for mailman id 1007722;
 Fri, 06 Jun 2025 00:08:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRk0=YV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uNKcu-0002QH-OG
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 00:08:04 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 485d9e14-426a-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 02:07:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E347C4AA17;
 Fri,  6 Jun 2025 00:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB073C4CEEF;
 Fri,  6 Jun 2025 00:07:47 +0000 (UTC)
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
X-Inumbo-ID: 485d9e14-426a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749168468;
	bh=pFWt8ixJ5bjgXwtwhuvejUDxPeu3bdN7Wc76r3o+ct0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dSGoeiiEwe/9WvxgWLIwyw+UWy6uw8IxY/yuXS2qhvNb1rGw5NePhNfBkKfGgti7R
	 EfNXcUGI2oGPVY++pqeY+Ht5v7qstcDIO20HO9fBsI1FP0rh2ai8H9iwK/0CaMdF6j
	 p4eDrlUWnDAn/WTc91NPlKXEzlgPk2CSQyA8TUzXA3suzcugNuvUu3mJ9vfmJilWLc
	 f5OOzYl7gYKO+LBE2DRVkQzn7u5QpPfNpT3xqrUs3Tf0+OCsKwZJk2NYn5s6+tcy+F
	 JIfdz9nJUSok9Pn9I7Mv2GsSvSs/4alxlBX9Wujz6fT8I4xKRHiKkbJPzSXpCwx8/L
	 c5ghbVP9YiDhw==
Date: Thu, 5 Jun 2025 17:07:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, michal.orzel@amd.com, julien@xen.org, 
    roger.pau@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: add header guards to generated asm generic
 headers
In-Reply-To: <f5909546-ef4d-4ee3-95b2-1255f2de3652@suse.com>
Message-ID: <alpine.DEB.2.22.394.2506051649010.2495561@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2506041605090.2495561@ubuntu-linux-20-04-desktop> <f5909546-ef4d-4ee3-95b2-1255f2de3652@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Jun 2025, Jan Beulich wrote:
> On 05.06.2025 01:09, Stefano Stabellini wrote:
> > --- a/xen/scripts/Makefile.asm-generic
> > +++ b/xen/scripts/Makefile.asm-generic
> > @@ -32,7 +32,12 @@ old-headers := $(wildcard $(obj)/*.h)
> >  unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
> >  
> >  quiet_cmd_wrap = WRAP    $@
> > -      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
> > +      cmd_wrap = \
> > +	upper=$$(echo $*.h | tr a-z A-Z | tr '/.' '__'); \
> > +	printf "\#ifndef ASM_GENERIC_$${upper}\n" > $@; \
> > +	printf "\#define ASM_GENERIC_$${upper}\n" >> $@; \
> > +	printf "\#include <asm-generic/$*.h>\n" >> $@; \
> > +	printf "\#endif /* ASM_GENERIC_$${upper} */\n" >> $@
> 
> I'm curious: In what is now a0f56da94c3e I had to resort to "define" to
> get the rule to work (including a correct .*.cmd being generated). I
> can't claim I actually understood why things didn't work the "simple
> macro" way, and hence it's unclear to me whether the way it's done here
> will work with all make versions.

This works:

cmd_xlat_h = \
	printf "\#ifndef COMPAT_XLAT_H\n" >$@.new; \
	printf "\#define COMPAT_XLAT_H\n" >>$@.new; \
	cat $(filter %.h,$^) >>$@.new; \
	printf "" >>$@.new; \
	printf "\#endif /* COMPAT_XLAT_H */\n" >>$@.new; \
	mv -f $@.new $@

I made these changes:
- tab instead of spaces
- printf instead of echo
- escape # and add \n



> One further difference to that other commit: If make is interrupted in
> the middle of any of these printf-s, an incomplete file may remain. The
> cmd_xlat_h rule specifically uses "mv -f $@.new $@" to cover that corner
> case.

Good point I can fix it


> Finally - is ASM_GENERIC_$${upper} actually correct? Isn't that the
> guard that ought to be used _in_ asm-generic/$*.h?

You are right

