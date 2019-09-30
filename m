Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DEEC27A7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 23:02:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF2kr-0004oG-42; Mon, 30 Sep 2019 20:58:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/D4s=XZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iF2kp-0004oB-Lt
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 20:58:47 +0000
X-Inumbo-ID: 18520e52-e3c5-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 18520e52-e3c5-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 20:58:47 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 60CA9224FE;
 Mon, 30 Sep 2019 20:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569877126;
 bh=NYyjKNu4cDDyxbrpNZSo+wme307qwK+nZQmoagp0kxw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=BbRDMt8TlTzwgJUeP9jTIw+ykMhFF3BpFviW/a3XcKqbcj2SAqU2JoEGfwOrjPVPR
 Ji9BxfwO0JK1Dcy8VjHg1o1Jhi0DyZt86fIwr0U9UpbSZfb9utjkSdeRc5vYzCDk8v
 EceigTjMetqy7FH9UbS70mmlbatZFPXW4lHObN3U=
Date: Mon, 30 Sep 2019 13:58:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <Julien.Grall@arm.com>
In-Reply-To: <96bea916-74a0-fa8e-582c-a702d43483c2@arm.com>
Message-ID: <alpine.DEB.2.21.1909301339100.2594@sstabellini-ThinkPad-T480s>
References: <1569496834-7796-1-git-send-email-olekstysh@gmail.com>
 <6c7d9f90-227a-c20a-090a-560a0805eb6b@arm.com>
 <71f1a62c-551c-97e1-2e1a-94339ab6e7d9@gmail.com>
 <alpine.DEB.2.21.1909271544030.2594@sstabellini-ThinkPad-T480s>
 <CAPD2p-mO7msJexqbmnmGX7z5SmN00KKQCN7pVZc-+H6OjLcUqw@mail.gmail.com>
 <96bea916-74a0-fa8e-582c-a702d43483c2@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1993100507-1569876316=:2594"
Content-ID: <alpine.DEB.2.21.1909301356270.2594@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [PATCH V6 0/8] iommu/arm: Add Renesas IPMMU-VMSA
 support + Linux's iommu_fwspec
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, "volodymyr_babchuk@epam.com" <volodymyr_babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1993100507-1569876316=:2594
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1909301356271.2594@sstabellini-ThinkPad-T480s>

On Sat, 28 Sep 2019, Julien Grall wrote:
> On 28/09/2019 00:52, Oleksandr Tyshchenko wrote:
> > сб, 28 сент. 2019 г., 01:50 Stefano Stabellini <sstabellini@kernel.org 
> > <mailto:sstabellini@kernel.org>>:
> > 
> >     On Thu, 26 Sep 2019, Oleksandr wrote:
> >      > On 26.09.19 17:56, Julien Grall wrote:
> >      > > Hi,
> >      >
> >      > Hi Julien
> >      >
> >      >
> >      > >
> >      > > On 9/26/19 12:20 PM, Oleksandr Tyshchenko wrote:
> >      > > > Oleksandr Tyshchenko (8):
> >      > > >    iommu/arm: Add iommu_helpers.c file to keep common for
> >     IOMMUs stuff
> >      > > >    iommu/arm: Add ability to handle deferred probing request
> >      > > >    xen/common: Introduce _xrealloc function
> >      > > >    xen/common: Introduce xrealloc_flex_struct() helper macros
> >      > > >    iommu/arm: Add lightweight iommu_fwspec support
> >      > > >    iommu: Order the headers alphabetically in device_tree.c
> >      > > >    iommu/arm: Introduce iommu_add_dt_device API
> >      > > >    iommu/arm: Add Renesas IPMMU-VMSA support
> >      > >
> >      > > This series is now merged.
> >      >
> >      > Thank you!
> > 
> >     I just wanted to provide early feedback that this series causes problems
> >     with the legacy mmu-masters binding:
> > 
> > 
> > This series was developed in a way to add new functionality, but not to 
> > brake existing (legacy bindings). Probably, I missed something 
> > important. iommu_add_dt_device() could return an error (I assume, this 
> > is what you are facing) if the device node in DT contains "iommus" 
> > property (I mean, uses new bindings), but the IOMMU driver doesn't 
> > implement required callbacks yet. Do the device nodes in your DT contain 
> > "iommus" property? And to which domain these devices (in your log) are 
> > going to be assigned (dom0 or other domains?).
> 
> Looking at the bindings, I don't think it is legit to have a node using 
> both legacy and generic binding together. If this is what happens, then 
> I would consider it as unsupported.

I have just sent a fix for this.

The issue is that some Xilinx device trees expose both the legacy and
generic bindings, however, only one set of bindings is supposed to be
used, either the legacy or the generic bindings (not both!). Linux
solves this problem by probing for the existence of "mmu-masters" (the
legacy bindings property) very early on and disabling the generic
bindings if "mmu-masters" is present.

Something like that would work for Xen too, but I chatted with Julien
and came up with something simpler. (Also keeping in mind that a new
colleague of mine has just started working on generic bindings support
for the ARM SMMU driver in Xen so this issue will go away soon). See:

https://marc.info/?l=xen-devel&m=156987707614744
--8323329-1993100507-1569876316=:2594
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1993100507-1569876316=:2594--

