Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5072B7D74
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 13:14:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29781.59438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfMLt-0007Ai-IW; Wed, 18 Nov 2020 12:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29781.59438; Wed, 18 Nov 2020 12:14:21 +0000
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
	id 1kfMLt-0007AJ-FA; Wed, 18 Nov 2020 12:14:21 +0000
Received: by outflank-mailman (input) for mailman id 29781;
 Wed, 18 Nov 2020 12:14:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QZvP=EY=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kfMLr-0007AE-GN
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 12:14:19 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b430c0ea-5d18-4847-af2a-c4992c299d16;
 Wed, 18 Nov 2020 12:14:16 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AICE8Mk014008
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 13:14:09 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id DD7E62E9CA8; Wed, 18 Nov 2020 13:14:03 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=QZvP=EY=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kfMLr-0007AE-GN
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 12:14:19 +0000
X-Inumbo-ID: b430c0ea-5d18-4847-af2a-c4992c299d16
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b430c0ea-5d18-4847-af2a-c4992c299d16;
	Wed, 18 Nov 2020 12:14:16 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AICE8Mk014008
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 18 Nov 2020 13:14:09 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id DD7E62E9CA8; Wed, 18 Nov 2020 13:14:03 +0100 (MET)
Date: Wed, 18 Nov 2020 13:14:03 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201118121403.GC3126@antioche.eu.org>
References: <20201117150949.GA3791@antioche.eu.org>
 <20201117155807.a7jgmftnj6njg6oz@Air-de-Roger>
 <20201117164033.GB3093@antioche.eu.org>
 <20201118085738.wpnfmjagxjf6cofp@Air-de-Roger>
 <20201118092425.GC1085@antioche.eu.org>
 <20201118100025.ic7r3kfsbdnr6muz@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201118100025.ic7r3kfsbdnr6muz@Air-de-Roger>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Wed, 18 Nov 2020 13:14:10 +0100 (MET)

On Wed, Nov 18, 2020 at 11:00:25AM +0100, Roger Pau Monné wrote:
> On Wed, Nov 18, 2020 at 10:24:25AM +0100, Manuel Bouyer wrote:
> > On Wed, Nov 18, 2020 at 09:57:38AM +0100, Roger Pau Monné wrote:
> > > On Tue, Nov 17, 2020 at 05:40:33PM +0100, Manuel Bouyer wrote:
> > > > On Tue, Nov 17, 2020 at 04:58:07PM +0100, Roger Pau Monné wrote:
> > > > > [...]
> > > > > 
> > > > > I have attached a patch below that will dump the vIO-APIC info as part
> > > > > of the 'i' debug key output, can you paste the whole output of the 'i'
> > > > > debug key when the system stalls?
> > > > 
> > > > see attached file. Note that the kernel did unstall while 'i' output was
> > > > being printed, so it is mixed with some NetBSD kernel output.
> > > > The idt entry of the 'ioapic2 pin2' interrupt is 103 on CPU 0.
> > > > 
> > > > I also put the whole sequence at
> > > > http://www-soc.lip6.fr/~bouyer/xen-log3.txt
> > > 
> > > On one of the instances the pin shows up as masked, but I'm not sure
> > > if that's relevant since later it shows up as unmasked. Might just be
> > > part of how NetBSD handles such interrupts.
> > 
> > Yes, NetBSD can mask an interrupt source if the interrupts needs to be delayed.
> > It will be unmasked once the interrupt has been handled.
> 
> Yes, I think that's roughly the same model that FreeBSD uses for
> level IO-APIC interrupts: mask it until the handlers have been run.
> 
> > Would it be possible that Xen misses an unmask write, or fails to
> > call the vector if the interrupt is again pending at the time of the
> > unmask ?
> 
> Well, it should work properly, but we cannot discard anything.

I did some more instrumentation from the NetBSD kernel, including dumping
the iopic2 pin2 register.

At the time of the command timeout, the register value is 0x0000a067,
which, if I understant it properly, menas that there's no interrupt
pending (bit IOAPIC_REDLO_RIRR, 0x00004000, is not set).
From the NetBSD ddb, I can dump this register multiple times, waiting
several seconds, etc .., it doens't change).
Now if I call ioapic_dump_raw() from the debugger, which triggers some
XEN printf:
db{0}> call ioapic_dump_raw^M
Register dump of ioapic0^M
[ 203.5489060] 00 08000000 00170011 08000000(XEN) vioapic.c:124:d0v0 apic_mem_re
adl:undefined ioregsel 3
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 4
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 5
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 6
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 7
 00000000^M
[ 203.5489060] 08(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 8
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 9
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel a
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel b
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel c
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel d
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel e
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel f
 00000000^M
[ 203.5489060] 10 00010000 00000000 00010000 00000000 00010000 00000000 00010000 00000000^M
[...]
[ 203.5489060] Register dump of ioapic2^M
[ 203.5489060] 00 0a000000 00070011 0a000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 3
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 4
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 5
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 6
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 7
 00000000^M
[ 203.5489060] 08(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 8
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel 9
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel a
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel b
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel c
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel d
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel e
 00000000(XEN) vioapic.c:124:d0v0 apic_mem_readl:undefined ioregsel f
 00000000^M
[ 203.5489060] 10 00010000 00000000 00010000 00000000 0000e067 00000000 00010000 00000000^M

then the register switches to 0000e067, with the IOAPIC_REDLO_RIRR bit set.
From here, if I continue from ddb, the dom0 boots.

I can get the same effect by just doing ^A^A^A so my guess is that it's
not accessing the iopic's register which changes the IOAPIC_REDLO_RIRR bit,
but the XEN printf. Also, from NetBSD, using a dump fuinction which
doesn't access undefined registers - and so doesn't trigger XEN printfs -
doens't change the IOAPIC_REDLO_RIRR bit either.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

