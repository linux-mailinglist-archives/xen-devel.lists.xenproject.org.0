Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B2A786347
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 00:20:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589623.921622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYwCs-0003E0-Od; Wed, 23 Aug 2023 22:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589623.921622; Wed, 23 Aug 2023 22:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYwCs-0003Cc-Kx; Wed, 23 Aug 2023 22:20:06 +0000
Received: by outflank-mailman (input) for mailman id 589623;
 Wed, 23 Aug 2023 22:20:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0q6w=EI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qYwCr-0001zt-4z
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 22:20:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34d479b0-4203-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 00:20:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C3FB63380;
 Wed, 23 Aug 2023 22:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00198C433C7;
 Wed, 23 Aug 2023 22:20:00 +0000 (UTC)
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
X-Inumbo-ID: 34d479b0-4203-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692829202;
	bh=+BvySKB3zySm940naGwU4h0llPrfXLkKVWAeiXOt8Bs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JIveYnEz34Z1NpIBpOUa3igO97WDDO2amk6H/6RN1QOqq4ZW23Mqo5WBxxWiJwOJP
	 JPDiUN1bYxM+v6JX/SEXsB/QATQ6I8fho4zumiEU4+DH6V7V/VRtJdEzaPs5+U1I9N
	 Tuvi0GUQT0N88crGqOx5VboT+jRPKW+Fm4lZ3vBNxD+fZ/qniwPSGQpdiyg9bIFlHr
	 TTSztrk5pUh174JzoUdcq7nzwlHY4LAv/fFZ5RkvXx2tWqVceCpuehLuXi/xnyBRUn
	 lSAy0sqdQ9E+3/mEf5SglPwzw8TEILRFZEPxEaXUTH1ylMSj4FEMwX+Mg8PVs4NUaq
	 gX0LdkX9d6grg==
Date: Wed, 23 Aug 2023 15:19:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, julien@xen.org, george.dunlap@citrix.com, 
    bertrand.marquis@arm.com, nicola.vetrini@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: add rule 2.1 exceptions
In-Reply-To: <6776ed41-de83-91f5-d7f8-e84f65c65db7@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308231512490.6458@ubuntu-linux-20-04-desktop>
References: <20230823002458.2738365-1-sstabellini@kernel.org> <6776ed41-de83-91f5-d7f8-e84f65c65db7@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Aug 2023, Jan Beulich wrote:
> On 23.08.2023 02:24, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > During the discussions that led to the acceptable of Rule 2.1, we
> 
> Nit (as before): "acceptance"?
> 
> > decided on a few exceptions that were not properly recorded in
> > rules.rst. Add them now.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> >  docs/misra/rules.rst | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > index b6d87e076b..8f38227994 100644
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -107,7 +107,18 @@ maintainers if you want to suggest a change.
> >     * - `Rule 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
> >       - Required
> >       - A project shall not contain unreachable code
> > -     -
> > +     - The following are allowed:
> > +         - Invariantly constant conditions, e.g. if(IS_ENABLED(CONFIG_HVM)) { S; }
> > +         - Switch with a controlling value statically determined not to
> > +           match one or more case statements
> > +         - Functions that are intended to be never referenced from C
> > +           code (e.g. 'do_trap_fiq')
> 
> Maybe better put it the other way around, "only referenced from assembly
> code"? This is because "never referenced from C" also includes truly
> unreferenced functions/data.
> 
> > +         - Unreachability caused by the certain macros/functions is
> > +           deliberate, e.g. BUG, assert_failed, panic, etc.
> 
> I think the "the" here wants dropping, and even then the result doesn't
> read very well imo. How about "Deliberate unreachability caused by
> certain macros/functions, e.g. BUG, assert_failed, panic, etc"?
> 
> > +         - asm-offsets.c, as they are not linked deliberately, because
> > +           they are used to generate definitions for asm modules
> > +         - declarations without initializer are safe, as they are not
> > +           executed
> 
> Provided additionally this sub-sub-bullet-list then also translates
> correctly to the various derived formats, then:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Yes I checked. Also thanks for the good suggestions, I'll make the
changes and resend.

