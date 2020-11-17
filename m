Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEAD2B5CBD
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 11:19:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28881.58029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1key47-0000ZH-Qz; Tue, 17 Nov 2020 10:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28881.58029; Tue, 17 Nov 2020 10:18:23 +0000
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
	id 1key47-0000Ys-NP; Tue, 17 Nov 2020 10:18:23 +0000
Received: by outflank-mailman (input) for mailman id 28881;
 Tue, 17 Nov 2020 10:18:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUfM=EX=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1key45-0000Yn-TV
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 10:18:21 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e3471f0-0dcd-40bc-80a1-8a85e250acb2;
 Tue, 17 Nov 2020 10:18:20 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AHAIE8R013559
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 11:18:15 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 44B1F2E9CC6; Tue, 17 Nov 2020 11:18:09 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=EUfM=EX=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1key45-0000Yn-TV
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 10:18:21 +0000
X-Inumbo-ID: 9e3471f0-0dcd-40bc-80a1-8a85e250acb2
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9e3471f0-0dcd-40bc-80a1-8a85e250acb2;
	Tue, 17 Nov 2020 10:18:20 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AHAIE8R013559
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 17 Nov 2020 11:18:15 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 44B1F2E9CC6; Tue, 17 Nov 2020 11:18:09 +0100 (MET)
Date: Tue, 17 Nov 2020 11:18:09 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: netbsd PVH dom0: xen clock event stops
Message-ID: <20201117101809.GE1405@antioche.eu.org>
References: <20201115174938.GA3562@antioche.eu.org>
 <20201115182416.GA30231@Air-de-Roger>
 <20201116182211.GS840@antioche.eu.org>
 <20201117085448.2haekgpbcspwmqja@Air-de-Roger>
 <20201117090733.GC1405@antioche.eu.org>
 <20201117094534.z3usx6tsydtle53o@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201117094534.z3usx6tsydtle53o@Air-de-Roger>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Tue, 17 Nov 2020 11:18:15 +0100 (MET)

On Tue, Nov 17, 2020 at 10:45:34AM +0100, Roger Pau Monné wrote:
> On Tue, Nov 17, 2020 at 10:07:33AM +0100, Manuel Bouyer wrote:
> > On Tue, Nov 17, 2020 at 10:02:04AM +0100, Roger Pau Monné wrote:
> > > Great! So all interrupts are working as expected now?
> > 
> > No, I'm back at the problem where the PERC raid controller times out on
> > commands. I'm cleaing up my sources and will try to get more data
> > about this problem.
> 
> OK, the output of the 'M' debug key might be helpful in that case to
> see if the MSI-X entries are masked (IIRC you said this controller was
> using MSIX).

No, this one is ioapic

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

