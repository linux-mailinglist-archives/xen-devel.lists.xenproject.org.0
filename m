Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CF82C666F
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 14:11:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39266.72097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kidW0-0006I7-Nz; Fri, 27 Nov 2020 13:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39266.72097; Fri, 27 Nov 2020 13:10:20 +0000
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
	id 1kidW0-0006Hk-KX; Fri, 27 Nov 2020 13:10:20 +0000
Received: by outflank-mailman (input) for mailman id 39266;
 Fri, 27 Nov 2020 13:10:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/b8=FB=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kidVy-0006Hf-9j
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:10:18 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d56ab460-164c-47e9-b0a4-d1d8c51af2d1;
 Fri, 27 Nov 2020 13:10:17 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0ARDA9mg023757
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 14:10:10 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id B8DCC2E9CAC; Fri, 27 Nov 2020 14:10:04 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=N/b8=FB=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kidVy-0006Hf-9j
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:10:18 +0000
X-Inumbo-ID: d56ab460-164c-47e9-b0a4-d1d8c51af2d1
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d56ab460-164c-47e9-b0a4-d1d8c51af2d1;
	Fri, 27 Nov 2020 13:10:17 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0ARDA9mg023757
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2020 14:10:10 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id B8DCC2E9CAC; Fri, 27 Nov 2020 14:10:04 +0100 (MET)
Date: Fri, 27 Nov 2020 14:10:04 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201127131004.GH1717@antioche.eu.org>
References: <20201124154917.l3jwa6w4ejumjuqw@Air-de-Roger>
 <20201124160914.GQ2020@antioche.eu.org>
 <20201126133444.r2oi24i3umh7shb3@Air-de-Roger>
 <20201126141608.GA4123@antioche.eu.org>
 <20201126142635.uzi643co3mxp5h42@Air-de-Roger>
 <20201126150937.jhbfp7iefkmtedx7@Air-de-Roger>
 <20201126172034.GA7642@antioche.eu.org>
 <20201127105948.ji5gxv4e7axrvgpo@Air-de-Roger>
 <20201127111904.GG1717@antioche.eu.org>
 <89aecc1b-bfe5-26fb-9d11-bec4f0aa7b84@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89aecc1b-bfe5-26fb-9d11-bec4f0aa7b84@suse.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Fri, 27 Nov 2020 14:10:11 +0100 (MET)

On Fri, Nov 27, 2020 at 12:21:23PM +0100, Jan Beulich wrote:
> On 27.11.2020 12:19, Manuel Bouyer wrote:
> > On Fri, Nov 27, 2020 at 11:59:48AM +0100, Roger Pau Monné wrote:
> >>>
> >>> I had to restart from a clean source tree to apply this patch, so to make
> >>> sure we're in sync I attached the diff from my sources
> >>
> >> I'm quite confused about why your trace don't even get into
> >> hvm_do_IRQ_dpci, so I've added some more debug info.
> >>
> >> Here is the new patch, sorry for so many rounds of testing.
> > 
> > No problem, it's expected for this kind of debug :)
> > 
> > http://www-soc.lip6.fr/~bouyer/xen-log11.txt
> 
> Hmm, this one now has hvm_do_IRQ_dpci entries. Maybe the previous one
> was again from a stale binary?

But I do see hvm_do_IRQ_dpci in the previous one too (xen-log10.txt)

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

