Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8E22B0B43
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 18:27:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25987.54095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdGNU-0007dv-PG; Thu, 12 Nov 2020 17:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25987.54095; Thu, 12 Nov 2020 17:27:20 +0000
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
	id 1kdGNU-0007dZ-MF; Thu, 12 Nov 2020 17:27:20 +0000
Received: by outflank-mailman (input) for mailman id 25987;
 Thu, 12 Nov 2020 17:27:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B7ei=ES=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kdGNT-0007dR-1o
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 17:27:19 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e96cbcf8-23a9-44d6-8384-86f866a3b82c;
 Thu, 12 Nov 2020 17:27:16 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0ACHR9M6028250
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Thu, 12 Nov 2020 18:27:10 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id AFF4F2E9CA8; Thu, 12 Nov 2020 18:27:04 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=B7ei=ES=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kdGNT-0007dR-1o
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 17:27:19 +0000
X-Inumbo-ID: e96cbcf8-23a9-44d6-8384-86f866a3b82c
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e96cbcf8-23a9-44d6-8384-86f866a3b82c;
	Thu, 12 Nov 2020 17:27:16 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0ACHR9M6028250
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 12 Nov 2020 18:27:10 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id AFF4F2E9CA8; Thu, 12 Nov 2020 18:27:04 +0100 (MET)
Date: Thu, 12 Nov 2020 18:27:04 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: dom0 PVH: 'entry->arch.pirq != INVALID_PIRQ' failed at vmsi.c:843
Message-ID: <20201112172704.GA5899@antioche.eu.org>
References: <20201112155715.GA5003@antioche.eu.org>
 <20201112163240.6xswol2iswikdzef@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112163240.6xswol2iswikdzef@Air-de-Roger>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Thu, 12 Nov 2020 18:27:11 +0100 (MET)

On Thu, Nov 12, 2020 at 05:32:40PM +0100, Roger Pau Monné wrote:
> On Thu, Nov 12, 2020 at 04:57:15PM +0100, Manuel Bouyer wrote:
> > Hello,
> > I'm trying to add dom0 PVH support to NetBSD. I'm tesing with Xen 4.13
> > on a brand new Intel x86 server (Dell R440).
> 
> I would recommend using 4.14, PVH dom0 is still very much in
> progress, and while I don't recall any specific fix going in 4.14 that
> could be related to this there have been changes.

packaging Xen on NetBSD requires quite a bit of work; so I don't package
every releases. I still need to get NetBSD patches in shape to contribute
back ...


> [...]
> > This is when it configures the broadcom network interface, which interrupts
> > at "msix3 vec 0". It is the first MSI-X device configured; the previous
> > ones are MSI only.
> > 
> > Is it a bug on the Xen side, or something missing on the NetBSD side ?
> 
> Looks like a bug on the Xen side, do you see any relevant messages
> before hitting the assert?

nothing from Xen

> 
> Can you give a try to the following debug patch and paste what you
> get?
> 
> Thanks, Roger.
> ---8<---
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 64dd0a929c..7ff76b7f59 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -371,7 +371,12 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
>              entry->updated = false;
>          }
>          else
> +        {
> +            printk("%pp offset %u len %u new_masked %d enabled %d masked %d updated %d\n",
> +                   &pdev->sbdf, offset, len, new_masked, msix->enabled, msix->masked,
> +                   entry->updated);
>              vpci_msix_arch_mask_entry(entry, pdev, entry->masked);
> +        }
>  
>          break;
>      }

I get
(XEN) ffff83083feaf500p offset 12 len 4 new_masked 0 enabled 0 masked 0 updated 1
(XEN) Assertion 'entry->arch.pirq != INVALID_PIRQ' failed at vmsi.c:843

You can find the full serial console log at
http://www-soc.lip6.fr/~bouyer/xen-log.txt

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

