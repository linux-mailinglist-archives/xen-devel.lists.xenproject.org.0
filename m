Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1917C79E0
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 00:36:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616159.957957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr4Hs-0003Ds-Am; Thu, 12 Oct 2023 22:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616159.957957; Thu, 12 Oct 2023 22:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr4Hs-0003AU-6x; Thu, 12 Oct 2023 22:36:12 +0000
Received: by outflank-mailman (input) for mailman id 616159;
 Thu, 12 Oct 2023 22:36:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/p7=F2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qr4Hq-0003A5-CN
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 22:36:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc42183d-694f-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 00:36:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0999C61F86;
 Thu, 12 Oct 2023 22:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC3FC433C8;
 Thu, 12 Oct 2023 22:36:05 +0000 (UTC)
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
X-Inumbo-ID: bc42183d-694f-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697150166;
	bh=YrJgAq64dFlspBEjwgwqX1JVs6u8zVTFJ02hRDZ853Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jgOFlsN4Egg8hR4qGVPM8dHitlNtZOUnP8dasUfdmVmhHwihQ+kAlisgjQfsv0j/e
	 EzUAx7KDJFcckr1IjjjunhirD6KMhpcFl2LHtYKLydzOukrVNOdi2UVChBLjIw8fyE
	 8qykAtThaVvKDK25n3I8nyLE83EoFU8eANLuvatwmpxwH8v61ApFITlpuOYRjLGhHj
	 JuFFdkKL4FY9Hki/Of9YnlYga3CdkTa6Ke3VqyLjydbs9F8bUi8z+p3YheXQQbVoB9
	 qJSdZGiijruyGxRXeqJVW70nIdtAg/QjWAXslkaWRMIA/w20bYC2xCSZ2H612CoZ9w
	 69Xx43vsa/kOg==
Date: Thu, 12 Oct 2023 15:36:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: George Dunlap <george.dunlap@cloud.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Henry Wang <Henry.Wang@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    "community.manager@xenproject.org" <community.manager@xenproject.org>
Subject: Re: Xen 4.18 release: Reminder about code freeze
In-Reply-To: <CA+zSX=ZbeUFrfAUJShooJFJ+d89f4xdXfJJ9HoJKRh4UStkTFQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com> <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop> <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com> <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZbeUFrfAUJShooJFJ+d89f4xdXfJJ9HoJKRh4UStkTFQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Oct 2023, George Dunlap wrote:
> > > Stop tinkering in the hope that it hides the problem.  You're only
> > > making it harder to fix properly.
> >
> > Making it harder to fix properly would be a valid reason not to commit
> > the (maybe partial) fix. But looking at the fix again:
> >
> > diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> > index a6cd199fdc..9cd6678015 100644
> > --- a/tools/xenstored/domain.c
> > +++ b/tools/xenstored/domain.c
> > @@ -989,6 +989,7 @@ static struct domain *introduce_domain(const void *ctx,
> >                 talloc_steal(domain->conn, domain);
> >
> >                 if (!restore) {
> > +                       domain_conn_reset(domain);
> >                         /* Notify the domain that xenstore is available */
> >                         interface->connection = XENSTORE_CONNECTED;
> >                         xenevtchn_notify(xce_handle, domain->port);
> > @@ -1031,8 +1032,6 @@ int do_introduce(const void *ctx, struct connection *conn,
> >         if (!domain)
> >                 return errno;
> >
> > -       domain_conn_reset(domain);
> > -
> >         send_ack(conn, XS_INTRODUCE);
> >
> > It is a 1-line movement. Textually small. Easy to understand and to
> > revert. It doesn't seem to be making things harder to fix? We could
> > revert it any time if a better fix is offered.
> >
> > Maybe we could have a XXX note in the commit message or in-code
> > comment?
> 
> It moves a line from one function (do_domain_introduce()) into a
> completely different function (introduce_domain()), nested inside two
> if() statements; with no analysis on how the change will impact
> things.

I am not the original author of the patch, and I am not the maintainer
of the code, so I don't feel I have the qualifications to give you the
answers you are seeking. Julien as author of the patch and xenstore
reviewer might be in a better position to answer. Or Juergen as xenstore
maintainer.

From what I can see the patch is correct.

We are removing a call to domain_conn_reset in do_introduce.
We are adding a call to domain_conn_reset in introduce_domain, which is
called right before in introduce_domain. Yes there are 2 if statements
but the domain_conn_reset is added in the right location: the
non-already-introduced non-restore code path.


> Are there any paths through do_domain_introduce() that now *won't* get
> a domain_conn_reset() call?  Is that OK?

Yes, the already-introduced and the restore code paths. The operations in
the already-introduced or the restore code paths seem simple enough not
to require a domain_conn_reset. Julien and Juergen should confirm.


> Is introduce_domain() called in other places?  Will those places now
> get extra domain_conn_reset() calls they weren't expecting?  Is that
> OK?

introduce_domain is called by dom0_init, but I am guessing that dom0 is
already-introduced so it wouldn't get an extra domain_conn_reset. Julien
and Jurgen should confirm.


> I mean, it certainly seems strange to set the state to CONNECTED, send
> off an event channel, and then after that delete all watches /
> transactions / buffered data and so on; but we need at least a basic
> understanding of what's going on to know that this change isn't going
> to break comething.
> 
> Not knowing much about the xenstore protocol: In the
> (!domain->introduced) case, will there be anything to actually delete?
>  It seems like it would only be necessary / useful on the
> (domain->introduced) case.

Doesn't it seem weird to you that we set a connection to CONNECTED,
notify the domain that it is ready to go, and only *after* that we reset
the connection to zero?

What happens if a domain starts using the connection as soon as it
receives the event channel notification and before domain_conn_reset is
called?

