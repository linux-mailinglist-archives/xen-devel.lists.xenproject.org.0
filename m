Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1725D2B37E9
	for <lists+xen-devel@lfdr.de>; Sun, 15 Nov 2020 19:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27569.56212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keMuN-0001ww-32; Sun, 15 Nov 2020 18:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27569.56212; Sun, 15 Nov 2020 18:37:51 +0000
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
	id 1keMuM-0001wX-W4; Sun, 15 Nov 2020 18:37:50 +0000
Received: by outflank-mailman (input) for mailman id 27569;
 Sun, 15 Nov 2020 18:37:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b2Sd=EV=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1keMuM-0001wS-9x
 for xen-devel@lists.xenproject.org; Sun, 15 Nov 2020 18:37:50 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0948d722-74ef-47cf-a835-30967c955561;
 Sun, 15 Nov 2020 18:37:47 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AFIbe8H005976
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Sun, 15 Nov 2020 19:37:41 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id D37C92E9CA8; Sun, 15 Nov 2020 19:37:35 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=b2Sd=EV=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1keMuM-0001wS-9x
	for xen-devel@lists.xenproject.org; Sun, 15 Nov 2020 18:37:50 +0000
X-Inumbo-ID: 0948d722-74ef-47cf-a835-30967c955561
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0948d722-74ef-47cf-a835-30967c955561;
	Sun, 15 Nov 2020 18:37:47 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AFIbe8H005976
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 15 Nov 2020 19:37:41 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id D37C92E9CA8; Sun, 15 Nov 2020 19:37:35 +0100 (MET)
Date: Sun, 15 Nov 2020 19:37:35 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: netbsd PVH dom0: xen clock event stops
Message-ID: <20201115183735.GC1096@antioche.eu.org>
References: <20201115174938.GA3562@antioche.eu.org>
 <20201115182416.GA30231@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201115182416.GA30231@Air-de-Roger>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Sun, 15 Nov 2020 19:37:42 +0100 (MET)

On Sun, Nov 15, 2020 at 07:24:16PM +0100, Roger Pau Monné wrote:
> On Sun, Nov 15, 2020 at 06:49:38PM +0100, Manuel Bouyer wrote:
> > Hello,
> > I spent some more time debugging NetBSD as a PVH dom0 on Xen,
> > With Roger's patch to avoid a Xen panic, the NetBSD kernel stalls
> > configuring devices. At first I though it was an issue with hardware
> > interrupts, but it more likely is an issue with Xen timer events.
> > Specifically: virtual CPU 0 stops receiving timer events, while other
> > CPUs keep receiving them. I tried to force a timer rearm but this didn't help.
> > The event is not masked nor pending on Xen or NetBSD, as confirmed by 'q'.
> > Others events (the Xen console, the debug event) are properly received
> > by CPU0. I don't know how to debug this more at this point.
> 
> You could try to use dom0_vcpus_pin command line option and then dump
> the timers using the 'a' debug key, this way you can see if CPU0 has a
> timer pending (which would be the vCPU0 timer).
> 
> What timer is NetBSD using, is it the PV vCPU single shot timer, the
> periodic one, or the emulated local APIC timer?

It is the PV single shot timer, I guess. But used as a periodic
timer by rearming it in the handler:
        next = ci->ci_xen_hardclock_systime_ns + NS_PER_TICK;
	error = HYPERVISOR_set_timer_op(next);

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

