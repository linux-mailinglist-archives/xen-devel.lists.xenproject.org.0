Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEDD2B8006
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 16:03:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29981.59687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfOzc-0000Kr-BT; Wed, 18 Nov 2020 15:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29981.59687; Wed, 18 Nov 2020 15:03:32 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfOzc-0000KQ-7Y; Wed, 18 Nov 2020 15:03:32 +0000
Received: by outflank-mailman (input) for mailman id 29981;
 Wed, 18 Nov 2020 15:03:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QZvP=EY=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kfOza-0000G5-Vq
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 15:03:31 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7821a0e9-7244-430c-9f00-0faf94907314;
 Wed, 18 Nov 2020 15:03:22 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AIF3EkA010941
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 16:03:15 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id B1EDF2E9CA8; Wed, 18 Nov 2020 16:03:09 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=QZvP=EY=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kfOza-0000G5-Vq
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 15:03:31 +0000
X-Inumbo-ID: 7821a0e9-7244-430c-9f00-0faf94907314
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7821a0e9-7244-430c-9f00-0faf94907314;
	Wed, 18 Nov 2020 15:03:22 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AIF3EkA010941
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 18 Nov 2020 16:03:15 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id B1EDF2E9CA8; Wed, 18 Nov 2020 16:03:09 +0100 (MET)
Date: Wed, 18 Nov 2020 16:03:09 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201118150309.GG3126@antioche.eu.org>
References: <20201117150949.GA3791@antioche.eu.org>
 <20201117155807.a7jgmftnj6njg6oz@Air-de-Roger>
 <20201117164033.GB3093@antioche.eu.org>
 <20201118085738.wpnfmjagxjf6cofp@Air-de-Roger>
 <20201118092425.GC1085@antioche.eu.org>
 <20201118100025.ic7r3kfsbdnr6muz@Air-de-Roger>
 <20201118121403.GC3126@antioche.eu.org>
 <20201118143928.hvamuf7t7jycsrzb@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201118143928.hvamuf7t7jycsrzb@Air-de-Roger>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Wed, 18 Nov 2020 16:03:16 +0100 (MET)

On Wed, Nov 18, 2020 at 03:39:28PM +0100, Roger Pau Monné wrote:
> > [...]
> > I can get the same effect by just doing ^A^A^A so my guess is that it's
> > not accessing the iopic's register which changes the IOAPIC_REDLO_RIRR bit,
> > but the XEN printf. Also, from NetBSD, using a dump fuinction which
> > doesn't access undefined registers - and so doesn't trigger XEN printfs -
> > doens't change the IOAPIC_REDLO_RIRR bit either.
> 
> I'm thinking about further ways to debug this. I see that all active
> IO-APIC pins are routed to vCPU0, but does it make a difference if you
> boot with dom0_max_vcpus=1 on the Xen command line? (thus limiting
> NertBSD dom0 to a single CPU)

No, the same issue happens

> 
> I can also prepare a patch that will periodically dump the same stuff
> as the 'i' debug key without you having to press anything, but I'm not
> sure if it would help much.

I think the key is to read all the interresting stuff before printing,
as it seems that printing to console is what change states.

> 
> Also, does the system work fine when you reach multiuser, or it also
> randomly freezes and requires further poking?

I let it run overnight, with some cron jobs firing and it didn't wedge.
I guess that once the kernel autoconf is done, the window in which
the interrupt is masked at the ioapic level is much shorter, making the
problem much less likely to happen.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

