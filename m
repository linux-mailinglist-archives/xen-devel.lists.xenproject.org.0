Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C990D2B4F23
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 19:23:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28577.57672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kej95-0005DW-8h; Mon, 16 Nov 2020 18:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28577.57672; Mon, 16 Nov 2020 18:22:31 +0000
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
	id 1kej95-0005D7-5j; Mon, 16 Nov 2020 18:22:31 +0000
Received: by outflank-mailman (input) for mailman id 28577;
 Mon, 16 Nov 2020 18:22:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gc94=EW=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kej93-0005D2-7w
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 18:22:29 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcd55861-2ea1-461a-8051-edc5dc74dabc;
 Mon, 16 Nov 2020 18:22:26 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AGIMGrU026657
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Mon, 16 Nov 2020 19:22:17 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 8FC4F2E9CA8; Mon, 16 Nov 2020 19:22:11 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gc94=EW=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kej93-0005D2-7w
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 18:22:29 +0000
X-Inumbo-ID: fcd55861-2ea1-461a-8051-edc5dc74dabc
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fcd55861-2ea1-461a-8051-edc5dc74dabc;
	Mon, 16 Nov 2020 18:22:26 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AGIMGrU026657
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 16 Nov 2020 19:22:17 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 8FC4F2E9CA8; Mon, 16 Nov 2020 19:22:11 +0100 (MET)
Date: Mon, 16 Nov 2020 19:22:11 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: netbsd PVH dom0: xen clock event stops
Message-ID: <20201116182211.GS840@antioche.eu.org>
References: <20201115174938.GA3562@antioche.eu.org>
 <20201115182416.GA30231@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201115182416.GA30231@Air-de-Roger>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Mon, 16 Nov 2020 19:22:17 +0100 (MET)

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

thanks, this helped. This was a bug in the NetBSD kernel, which would show
up only when there are enough physical device interrupts (which explains why
I didn't notice it on PVH domUs)

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

