Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40253C94A6
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 01:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156261.288330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3oa9-00068y-F6; Wed, 14 Jul 2021 23:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156261.288330; Wed, 14 Jul 2021 23:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3oa9-000673-Bx; Wed, 14 Jul 2021 23:46:25 +0000
Received: by outflank-mailman (input) for mailman id 156261;
 Wed, 14 Jul 2021 23:46:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvfX=MG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m3oa7-00066x-V5
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 23:46:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33d69dbe-40f5-4cc6-a70b-05129147c87e;
 Wed, 14 Jul 2021 23:46:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26C796100C;
 Wed, 14 Jul 2021 23:46:22 +0000 (UTC)
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
X-Inumbo-ID: 33d69dbe-40f5-4cc6-a70b-05129147c87e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626306382;
	bh=kIem1FVofAMA+RG0r/Ko3GpHLib3akY2KthjwU6/UNk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VNpGhCJu0t1h/Gqkxh1xRY7cMmy3FjAvJxOLq57+Vlgt/xGT0y4YZMI+CuBpYGQBw
	 YMP6nJaZC0sFUNRbhBQAu/BV07vo1p9yKBusJKZJ/WPS3wNa47ZWU25A1sEPl5T5P1
	 vhsPJO6DWQc8g8t2ZCQ9594QoggLIL4uaBFM6n/jLdt49+Biu92nSgSn3sVteESlhN
	 7m6SyXJ+Ot9AIhJOx75oqyomyqXfieHmN5ecH7AJuctvQhTT4dUHe716aQwXmQ6oBB
	 q3Ylu5H6hkJ+66ty+T+8YOvTl5Mj7f8RHQm9ADeBlhFp5DEyDGI5gsACzIGl3Cu7jP
	 QcYdDKbL+XDNg==
Date: Wed, 14 Jul 2021 16:46:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, iwj@xenproject.org, 
    wl@xen.org
Subject: Re: [PATCH] SUPPORT.md: add Dom0less as Supported
In-Reply-To: <f443ca4f-a942-7765-a8c0-072d2844a0d9@xen.org>
Message-ID: <alpine.DEB.2.21.2107141645150.3916@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2107131734170.23286@sstabellini-ThinkPad-T480s> <47749630-ff78-e00f-63c0-8ff71a6a04c9@xen.org> <alpine.DEB.2.21.2107141224550.23286@sstabellini-ThinkPad-T480s> <f443ca4f-a942-7765-a8c0-072d2844a0d9@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Jul 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 14/07/2021 20:28, Stefano Stabellini wrote:
> > On Wed, 14 Jul 2021, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > On 14/07/2021 01:39, Stefano Stabellini wrote:
> > > > Add Dom0less to SUPPORT.md to clarify its support status. The feature is
> > > > mature enough and small enough to make it security supported.
> > > > 
> > > > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > > > 
> > > > diff --git a/SUPPORT.md b/SUPPORT.md
> > > > index 317392d8f3..c777f3da72 100644
> > > > --- a/SUPPORT.md
> > > > +++ b/SUPPORT.md
> > > > @@ -832,6 +832,12 @@ OVMF firmware implements the UEFI boot protocol.
> > > >          Status, qemu-xen: Supported
> > > >    +## Dom0less
> > > > +
> > > > +Guest creation from the hypervisor at boot without Dom0 intervention.
> > > > +
> > > > +    Status, ARM: Supported
> > > > +
> > > 
> > > After XSA-372, we will not scrubbed memory assigned to dom0less DomU when
> > > bootscrub=on.
> > 
> > Do you mean *before* XSA-372, right?
> 
> No, I really meant *after* XSA-372.
> 
> > I thought the XSA-372 patches take
> > care of the problem?
> 
> It didn't. We have an open question for the bootscrub=on one. From the commit
> message of patch #1:
> 
>         2) The memory allocated for a domU will not be scrubbed anymore when
> an
>         admin select bootscrub=on. This is not something we advertised, but if
>         this is a concern we can introduce either force scrub for all domUs or
>         a per-domain flag in the DT. The behavior for bootscrub=off and
>         bootscrub=idle (default) has not changed.
>
> > > Do we want to exclude this combination or mention that XSAs will
> > > not be issued if the domU can read secret from unscrubbed memory?
> > 
> > I could say that if bootscrub=off then we won't issue XSAs for domUs reading
> > secrets from unscrubbed memory. But it is kind of obvious anyway? I am
> > happy to add it if you think it is good to clarify.
> 
> Right, it is pretty clear that bootscrub=off will not scrub the memory and the
> "problem" would not be specific to dom0less.
> 
> The one I asked to clarify is bootscrub=on because one may think the memory is
> scrubbed for dom0less domU for all the cases but bootscrub=off.
> 
> IIRC when we discussed about it on security@xen.org, we suggested that it
> would be fine to rely on the bootloader to scrub it. But I think this needs to
> be written down rather waiting for it to be re-discovered.

Ah right, I remember what you are talking about. I'll update the patch.

