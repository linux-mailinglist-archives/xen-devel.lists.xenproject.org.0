Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A28C91ED388
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 17:37:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgVS6-0002Xb-8q; Wed, 03 Jun 2020 15:37:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0WRj=7Q=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jgVS4-0002XW-6Y
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 15:37:12 +0000
X-Inumbo-ID: 172a2c5a-a5b0-11ea-ad4f-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 172a2c5a-a5b0-11ea-ad4f-12813bfff9fa;
 Wed, 03 Jun 2020 15:37:11 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 46ADA20679;
 Wed,  3 Jun 2020 15:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591198630;
 bh=qMrrpXKqDomN/H9XypBdOxNN+kTZteJOVlUEUDdt0Bs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=00ilQPtQMJCCZMfdLU0AypaH0oAU8L/iH2sXRkmS03kJQOGsokmxcBRsC1LU7LnbG
 NznBp81SdxV6A+LY3z209EFJZ0oBlL6yg57pmmizOJgWkGlYfopkRHJUAc9D42B8Up
 dQ8jwKW6w7S72MMa5VMkXuW/kB3xjoVVq+dzoT3Y=
Date: Wed, 3 Jun 2020 08:37:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Corey Minyard <minyard@acm.org>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
In-Reply-To: <20200603152914.GJ2880@minyard.net>
Message-ID: <alpine.DEB.2.21.2006030835170.6774@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2005060956120.14706@sstabellini-ThinkPad-T480s>
 <CAMmSBy_wcSD3BVcVFJVR1y1CtvxA9xMkobKwbsdf8dGxS5Hcbw@mail.gmail.com>
 <alpine.DEB.2.21.2005121723240.26167@sstabellini-ThinkPad-T480s>
 <42253259-9663-67e8-117f-8ba631243585@xen.org>
 <alpine.DEB.2.21.2005130810270.26167@sstabellini-ThinkPad-T480s>
 <d940d405-5706-c749-f546-c0c60528394d@xen.org>
 <d19f82a9-160e-ccc5-ebf9-8eb397dbeb08@xen.org>
 <alpine.DEB.2.21.2005131249570.26167@sstabellini-ThinkPad-T480s>
 <20200602183420.GE2880@minyard.net>
 <alpine.DEB.2.21.2006021222490.6774@sstabellini-ThinkPad-T480s>
 <20200603152914.GJ2880@minyard.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1675369806-1591198630=:6774"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 roman@zededa.com,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 boris.ostrovsky@oracle.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1675369806-1591198630=:6774
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 3 Jun 2020, Corey Minyard wrote:
> On Tue, Jun 02, 2020 at 12:24:05PM -0700, Stefano Stabellini wrote:
> > On Tue, 2 Jun 2020, Corey Minyard wrote:
> > > Snip
> > > 
> > > > > > > > whether
> > > > > > > > this was already done:
> > > > > > > >      1) Does the kernel boot on baremetal (i.e without Xen)? This should
> > > > > > > > help
> > > > > > > > to confirm whether the bug is Xen is related.
> > > > > > > 
> > > > > > > Yes it boots
> > > > > > > 
> > > > > > > >      2) Swiotlb should not be necessary for basic dom0 boot on Arm. Did
> > > > > > > > you try
> > > > > > > > to disable it? This should help to confirm whether swiotlb is the
> > > > > > > > problem or
> > > > > > > > not.
> > > > > > > 
> > > > > > > It boots disabling swiotlb-xen
> > > > > > 
> > > > > > Thank you for the answer! swiotlb-xen should basically be a NOP for dom0. So
> > > > > > this suggests swiotlb is doing some transformation on the DMA address.
> > > > > > 
> > > > > > I have an idea what may have gone wrong. AFAICT, xen-swiotlb seems to assume
> > > > > > the DMA address space and CPU address space is the same. Is RPI using the
> > > > > > same address space?
> > > > > 
> > > > > Another question, is the DMA request bounced? If so, are we sure the bounce
> > > > > buffer is in the first GB?
> > > > 
> > > > Yes, it is. This is actually where we spent the last few days, and I
> > > > found another little related bug in the initialization of the
> > > > swiotlb-xen but now I am sure the memory is under 1GB (0x34000000-0x38000000)
> > > 
> > > Was anything ever resolved on this issue?  It just kind of ended for me,
> > > and I looked in the main kernel and didn't find anything that looked
> > > related.
> > 
> > Yes, we have a patch series on the list for the Linux kernel to fix this
> > issue but it hasn't been merged yet:
> > 
> > https://marc.info/?l=linux-kernel&m=159001831406263&w=2
> 
> Just FYI, I pulled the changes on top of
>   https://github.com/raspberrypi/linux.git rpi-5.4.y
> Along with change
>   56e35f9c5b87ec dma-mapping: drop the dev argument to arch_sync_dma_for_*
> before the series so it applies on 5.4, and I was able to boot and
> create a domU.  So:
> 
> Tested-by: Corey Minyard <cminyard@mvista.com>
> 
> At least on 5.4.  If you think it would be valuable, I can test on
> rpi-5.7.y.

I'd feel better adding your Tested-by to my next upstream submission of
the series if you could also test on 5.7. Thank you in advance!


> I'll be integrating this in with our Pi Xen yocto layer at
> https://github.com/MontaVista-OpenSourceTechnology/meta-raspberrypi-xen

That's great!
--8323329-1675369806-1591198630=:6774--

