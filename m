Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2342B7A48
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 10:24:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29643.59222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJhk-00063T-IZ; Wed, 18 Nov 2020 09:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29643.59222; Wed, 18 Nov 2020 09:24:44 +0000
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
	id 1kfJhk-000636-FZ; Wed, 18 Nov 2020 09:24:44 +0000
Received: by outflank-mailman (input) for mailman id 29643;
 Wed, 18 Nov 2020 09:24:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QZvP=EY=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kfJhj-000630-Bn
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:24:43 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b07cff6f-d614-4f7e-b4d9-18b0e88a0c1b;
 Wed, 18 Nov 2020 09:24:41 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AI9OVwe026567
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 10:24:31 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id E1CAD2E9CA8; Wed, 18 Nov 2020 10:24:25 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=QZvP=EY=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kfJhj-000630-Bn
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:24:43 +0000
X-Inumbo-ID: b07cff6f-d614-4f7e-b4d9-18b0e88a0c1b
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b07cff6f-d614-4f7e-b4d9-18b0e88a0c1b;
	Wed, 18 Nov 2020 09:24:41 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AI9OVwe026567
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 18 Nov 2020 10:24:31 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id E1CAD2E9CA8; Wed, 18 Nov 2020 10:24:25 +0100 (MET)
Date: Wed, 18 Nov 2020 10:24:25 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201118092425.GC1085@antioche.eu.org>
References: <20201117150949.GA3791@antioche.eu.org>
 <20201117155807.a7jgmftnj6njg6oz@Air-de-Roger>
 <20201117164033.GB3093@antioche.eu.org>
 <20201118085738.wpnfmjagxjf6cofp@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201118085738.wpnfmjagxjf6cofp@Air-de-Roger>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Wed, 18 Nov 2020 10:24:32 +0100 (MET)

On Wed, Nov 18, 2020 at 09:57:38AM +0100, Roger Pau Monné wrote:
> On Tue, Nov 17, 2020 at 05:40:33PM +0100, Manuel Bouyer wrote:
> > On Tue, Nov 17, 2020 at 04:58:07PM +0100, Roger Pau Monné wrote:
> > > [...]
> > > 
> > > I have attached a patch below that will dump the vIO-APIC info as part
> > > of the 'i' debug key output, can you paste the whole output of the 'i'
> > > debug key when the system stalls?
> > 
> > see attached file. Note that the kernel did unstall while 'i' output was
> > being printed, so it is mixed with some NetBSD kernel output.
> > The idt entry of the 'ioapic2 pin2' interrupt is 103 on CPU 0.
> > 
> > I also put the whole sequence at
> > http://www-soc.lip6.fr/~bouyer/xen-log3.txt
> 
> On one of the instances the pin shows up as masked, but I'm not sure
> if that's relevant since later it shows up as unmasked. Might just be
> part of how NetBSD handles such interrupts.

Yes, NetBSD can mask an interrupt source if the interrupts needs to be delayed.
It will be unmasked once the interrupt has been handled.

Would it be possible that Xen misses an unmask write, or fails to
call the vector if the interrupt is again pending at the time of the
unmask ?


> [...]
> On a maybe unrelated question, how do you setup the event channel
> callback, is it using HVM_PARAM_CALLBACK_IRQ and
> HVM_PARAM_CALLBACK_TYPE_VECTOR?

Yes, the code is at
https://github.com/NetBSD/src/blob/f9a54eaecfb47bce597f72f6cae8861f4d486eb4/sys/arch/xen/xen/hypervisor.c#L457

> 
> Are you EOI'ing such vector on the local APIC when servicing the
> interrupt?

I think it's OK. the code is at
https://github.com/NetBSD/src/blob/f9a54eaecfb47bce597f72f6cae8861f4d486eb4/sys/arch/amd64/amd64/vector.S#L770

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

