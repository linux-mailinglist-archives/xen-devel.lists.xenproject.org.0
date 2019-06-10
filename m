Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A39573BDA3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 22:42:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haR5L-0006sV-Mh; Mon, 10 Jun 2019 20:40:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O/RI=UJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1haR5K-0006pE-AS
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 20:40:06 +0000
X-Inumbo-ID: ed423c7b-8bbf-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ed423c7b-8bbf-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 20:40:05 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C143206E0;
 Mon, 10 Jun 2019 20:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560199204;
 bh=YYbI4EegQbBWF4j7rTrW6+Q8QI89YkL9+NPAgQ540No=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=pvhiHa0Fh1jMykWllZN5ZyReFFnTlnh534/rtHUEc2UH1q2uglqcXfNA9CiGrPqhx
 heGKnYz0uvy87y0jdsVxGwgwd+Ocj/28n/2VdaB08QDZgM7en1iW+lT4g5n7V+yJAu
 ag8hSUUDeP++qLZVjAliJQZeT1EJJuszsPrABsDg=
Date: Mon, 10 Jun 2019 13:40:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <c2e73bc5-4390-7436-21f7-deff8d85db1d@arm.com>
Message-ID: <alpine.DEB.2.21.1906101337160.8691@sstabellini-ThinkPad-T480s>
References: <20190514121132.26732-1-julien.grall@arm.com>
 <20190514121132.26732-2-julien.grall@arm.com>
 <alpine.DEB.2.21.1905201143390.16404@sstabellini-ThinkPad-T480s>
 <42c29444-01b0-cb6a-a8e7-3642175402f7@arm.com>
 <0172ad95-1a78-8f2f-9f11-a74089829fb9@arm.com>
 <c2e73bc5-4390-7436-21f7-deff8d85db1d@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2105667026-1560199204=:8691"
Subject: Re: [Xen-devel] [PATCH MM-PART1 v3 1/8] xen/arm: Don't boot Xen on
 platform using AIVIVT instruction caches
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com,
 "committers@xenproject.org" <committers@xenproject.org>,
 xen-devel@lists.xenproject.org, nd@arm.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2105667026-1560199204=:8691
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi Julien,

I expressed my preference below. We don't agree. Is there anything else
you would like me to add to this thread? Do you have a specific
question? The only question I see below is "Users of what?" but I take
it was just rhetorical.


On Mon, 10 Jun 2019, Julien Grall wrote:
> (+ Committers)
> 
> Ping again... I have quite a few patches blocked on this work.
> 
> Cheers,
> 
> On 29/05/2019 17:44, Julien Grall wrote:
> > Gentle ping.
> > 
> > On 20/05/2019 20:53, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 20/05/2019 19:56, Stefano Stabellini wrote:
> > > > On Tue, 14 May 2019, Julien Grall wrote:
> > > > > The AIVIVT is a type of instruction cache available on Armv7. This is
> > > > > the only cache not implementing the IVIPT extension and therefore
> > > > > requiring specific care.
> > > > > 
> > > > > To simplify maintenance requirements, Xen will not boot on platform
> > > > > using AIVIVT cache.
> > > > > 
> > > > > This should not be an issue because Xen Arm32 can only boot on a small
> > > > > number of processors (see arch/arm/arm32/proc-v7.S). All of them are
> > > > > not using AIVIVT cache.
> > > > > 
> > > > > Signed-off-by: Julien Grall <julien.grall@arm.com>
> > > > 
> > > > As we have already discussed, I am OK with this and neither of us
> > > > foresee any issues. Given that it could be considered as a drop in
> > > > support for something, I think it would be nice to send an email outside
> > > > of the series to say we won't support AIVIVT processors any longer,
> > > > using words easier to understand to users (not necessarily developers).
> > > 
> > > Users of what? Xen upstream will *panic* on every processor not listed in
> > > arch/arm/arm32/proc-v7.S even without this patch.
> > > 
> > > > Would you be able to do that? I can help you with the text.
> > > While in theory this sounds sensible, for reaching the panic added in this
> > > patch, you would need out-of-tree patches. So in practice you are saying
> > > we should care about out-of-tree users.
> > > 
> > > I have already enough to care about Xen upstream itself that out-of-tree
> > > is my last concern. If someone were using out-of-tree then then too bad
> > > they will see the panic.
> > > 
> > > TBH, I am pretty sure we don't currently properly follow the maintenance
> > > requirements... So we are making them a favor to add a panic. Before they
> > > could just see random corruption...
> > > 
> > > Anyway, feel free to send the message yourself.
> > > 
> > > > 
> > > > 
> > > > > ---
> > > > > 
> > > > >      Changes in v3:
> > > > >          - Patch added
> > > > > ---
> > > > >   xen/arch/arm/setup.c            | 5 +++++
> > > > >   xen/include/asm-arm/processor.h | 5 +++++
> > > > >   2 files changed, 10 insertions(+)
> > > > > 
> > > > > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > > > > index ccb0f181ea..faaf029b99 100644
> > > > > --- a/xen/arch/arm/setup.c
> > > > > +++ b/xen/arch/arm/setup.c
> > > > > @@ -526,10 +526,15 @@ static void __init setup_mm(unsigned long
> > > > > dtb_paddr, size_t dtb_size)
> > > > >       unsigned long boot_mfn_start, boot_mfn_end;
> > > > >       int i;
> > > > >       void *fdt;
> > > > > +    const uint32_t ctr = READ_CP32(CTR);
> > > > >       if ( !bootinfo.mem.nr_banks )
> > > > >           panic("No memory bank\n");
> > > > > +    /* We only supports instruction caches implementing the IVIPT
> > > > > extension. */
> > > > 
> > > > Please mention that IVIPT can only be implemented by PIPT and VIPT
> > > > caches, not by AIVIVT caches. That should make it straightforward to
> > > > understand the reason for the panic below.
> > > 
> > > I would prefer to add "This is not the case of AIVIVT" rather than
> > > spelling out the other caches.
> > > 
> > > Cheers,
> > > 
> > > 
> > 
> 
> -- 
> Julien Grall
> 
--8323329-2105667026-1560199204=:8691
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-2105667026-1560199204=:8691--

