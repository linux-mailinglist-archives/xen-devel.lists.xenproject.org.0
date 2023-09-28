Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0E27B0FD5
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 02:19:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609206.948150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlejT-0001Ej-OT; Thu, 28 Sep 2023 00:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609206.948150; Thu, 28 Sep 2023 00:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlejT-0001CX-Lh; Thu, 28 Sep 2023 00:18:19 +0000
Received: by outflank-mailman (input) for mailman id 609206;
 Thu, 28 Sep 2023 00:18:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjmF=FM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qlejS-0001C4-8P
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 00:18:18 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84081435-5d94-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 02:18:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D7734CE1AAB;
 Thu, 28 Sep 2023 00:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2921C433C8;
 Thu, 28 Sep 2023 00:18:08 +0000 (UTC)
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
X-Inumbo-ID: 84081435-5d94-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695860290;
	bh=+itPXB9mEbWrLqd/o6VLy66qwlS5iwG8iN+9UE4WHio=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OBpQrOha/mgPVJKCjunPE0c2ZaoZp6TremyR9QFZ3jQ9yGzuI8uQzPFM5v6qKXF4p
	 HpPmFeuhfHDoNzEWnHY+32CunWYZYBmkKCuC/63Ci7tuljIKMEIdOR8ZSBJh7zYHAO
	 1FM2EsItXPy+YQkqfy+aPlhZk8yP27DXpXL0/SEjpa32JL2glLnevXyEY7HNO+CNWZ
	 d2YI2afQZzEV/wthCRdRblYo+Ky8SBzTACVA8+ZiKequo4W2i5eIgJtKPjsmw+qq2P
	 +RBv7VkEdjktHNa74H37kS0kNm5Y/CALKgKX/4ZNzcjFhZx0sWm32WOB4PII9L6q9I
	 IbOefvpxTnSbg==
Date: Wed, 27 Sep 2023 17:18:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Henry Wang <Henry.Wang@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, "jgross@suse.com" <jgross@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    "community.manager@xenproject.org" <community.manager@xenproject.org>
Subject: Re: Xen 4.18 release: Reminder about code freeze
In-Reply-To: <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com> <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop> <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1362337263-1695859553=:1403502"
Content-ID: <alpine.DEB.2.22.394.2309271706050.1403502@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1362337263-1695859553=:1403502
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2309271706051.1403502@ubuntu-linux-20-04-desktop>

On Thu, 28 Sep 2023, Andrew Cooper wrote:
> On 28/09/2023 12:04 am, Stefano Stabellini wrote:
> > On Mon, 25 Sep 2023, Henry Wang wrote:
> >> 3. dom0less vs xenstored setup race Was: xen | Failed pipeline for staging | 6a47ba2f
> >>
> >> https://marc.info/?l=xen-devel&m=168312468808977
> >>
> >> https://marc.info/?l=xen-devel&m=168312687610283
> > For this issue I suggest to go with this fix unless someone can produce
> > a better fix before RC2. I don't think we should cut RC2 with this issue
> > unsolved.
> >
> > ---
> > [PATCH] xenstored: reset domain connection before XENSTORE_CONNECTED
> >
> > From: Julien Grall <julien@xen.org>
> >
> > xenstored will set interface->connection to XENSTORE_CONNECTED before
> > finalizing the connection which can cause initialization errors on the
> > guest side. Make sure to call domain_conn_reset(domain) before setting
> > XENSTORE_CONNECTED.
> >
> > Signed-off-by: Julien Grall <julien@xen.org>
> > [stefano: rebase, commit message]
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> No - this hasn't got any better at fixing the problem than the last time
> it failed to fix the problem.

It does solve one of the issues: the sporadic failure of the gitlab-ci
job. Even if the fix is not complete, if nothing else, it does that.

Of course, if someone comes up with a better fix all the better!

There hasn't been a lot of movement on this issue so I am being
pessimistic and I am offering the (maybe partial) solution we have
today. I don't mean to take anything away from the value of doing a
better fix.


> You cannot have 3 entities in parallel fight for control in a 2-way
> communication channel.
> 
> Failure to understand this is what created the problem to begin with.
> 
> You took an existing ABI from oxenstored, and implemented it
> incompatibly in other entities, had init-dom0less corrupt a shared comms
> buffer that it isn't the producer or consumer of, and added bug in Linux
> because you didn't write down the behaviour you wanted, let alone the
> behaviour you actually provided.

I think I could write a document covering the intended behavior at the
time of contributing the original feature. That might be good to have
regardless of the bug.


> Stop tinkering in the hope that it hides the problem.  You're only
> making it harder to fix properly.
 
Making it harder to fix properly would be a valid reason not to commit
the (maybe partial) fix. But looking at the fix again:

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index a6cd199fdc..9cd6678015 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -989,6 +989,7 @@ static struct domain *introduce_domain(const void *ctx,
                talloc_steal(domain->conn, domain);
 
                if (!restore) {
+                       domain_conn_reset(domain);
                        /* Notify the domain that xenstore is available */
                        interface->connection = XENSTORE_CONNECTED;
                        xenevtchn_notify(xce_handle, domain->port);
@@ -1031,8 +1032,6 @@ int do_introduce(const void *ctx, struct connection *conn,
        if (!domain)
                return errno;
 
-       domain_conn_reset(domain);
-
        send_ack(conn, XS_INTRODUCE);

It is a 1-line movement. Textually small. Easy to understand and to
revert. It doesn't seem to be making things harder to fix? We could
revert it any time if a better fix is offered.

Maybe we could have a XXX note in the commit message or in-code
comment?


> Tell me, when was the last time this failed...

I went through all the gitlab reports and this is the last one I found
which is from 1 month ago:
https://gitlab.com/xen-project/xen/-/pipelines/953569140

Even if the heinsenbug manifests only once a month I think it is bad.
Of course it is up to Henry but I don't think we should go far into the
release process without this problem being (at least partially) fixed.
--8323329-1362337263-1695859553=:1403502--

