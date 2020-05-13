Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE381D1FAA
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 21:51:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYxPf-0006HT-CA; Wed, 13 May 2020 19:51:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVKH=63=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jYxPd-0006HO-QC
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 19:51:29 +0000
X-Inumbo-ID: 228f6ba4-9553-11ea-a401-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 228f6ba4-9553-11ea-a401-12813bfff9fa;
 Wed, 13 May 2020 19:51:28 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EA27205ED;
 Wed, 13 May 2020 19:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589399488;
 bh=q9pL9MyiDPkzpcxwhyoVVNHmRZJxL8DD6AP9lH+W12s=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=J7HusWoQ5Y+Ge5/d62uQu1IC/VMSsxA/jdUbWqcKoHAtUTTXmvlkay3w1N628GUFH
 jW5D8I/W+l47BKN32/ANeTJk1sCaj/JeLAxR8Tw72xsJjbCYwlDOXpYRbevZr9QvCF
 hTSITLg/iQHink6MqfgFvfx/NGc3X4l+ETO9m/Io=
Date: Wed, 13 May 2020 12:51:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
In-Reply-To: <d19f82a9-160e-ccc5-ebf9-8eb397dbeb08@xen.org>
Message-ID: <alpine.DEB.2.21.2005131249570.26167@sstabellini-ThinkPad-T480s>
References: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
 <CAMmSBy-yymEGQcuUBHZi-tL9ra7x9nDv+ms8SLiZr1H=BpHUiQ@mail.gmail.com>
 <alpine.DEB.2.21.2005051508180.14706@sstabellini-ThinkPad-T480s>
 <9ee0fb6f-98df-d993-c42e-f47270bf2eaa@suse.com>
 <DB6PR0402MB2760AF88FE7E3DF47401BE5988A40@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CADz_WD5Ln7Pe1WAFp73d2Mz9wxspzTE3WgAJusp5S8LX4=83Bw@mail.gmail.com>
 <2187cd7c-4d48-986b-77d6-4428e8178404@oracle.com>
 <CADz_WD68bYj-0CSm_zib+LRiMGd1+1eoNLgiJj=vHog685Khsw@mail.gmail.com>
 <alpine.DEB.2.21.2005060956120.14706@sstabellini-ThinkPad-T480s>
 <CAMmSBy_wcSD3BVcVFJVR1y1CtvxA9xMkobKwbsdf8dGxS5Hcbw@mail.gmail.com>
 <alpine.DEB.2.21.2005121723240.26167@sstabellini-ThinkPad-T480s>
 <42253259-9663-67e8-117f-8ba631243585@xen.org>
 <alpine.DEB.2.21.2005130810270.26167@sstabellini-ThinkPad-T480s>
 <d940d405-5706-c749-f546-c0c60528394d@xen.org>
 <d19f82a9-160e-ccc5-ebf9-8eb397dbeb08@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1236722027-1589399488=:26167"
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "minyard@acm.org" <minyard@acm.org>, roman@zededa.com,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 boris.ostrovsky@oracle.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1236722027-1589399488=:26167
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 13 May 2020, Julien Grall wrote:
> On 13/05/2020 19:19, Julien Grall wrote:
> > Hi,
> > 
> > On 13/05/2020 16:11, Stefano Stabellini wrote:
> > > On Wed, 13 May 2020, Julien Grall wrote:
> > > > Hi,
> > > > 
> > > > On 13/05/2020 01:33, Stefano Stabellini wrote:
> > > > > I worked with Roman to do several more tests and here is an update on
> > > > > the situation. We don't know why my patch didn't work when Boris'
> > > > > patch
> > > > > [1] worked.  Both of them should have worked the same way.
> > > > > 
> > > > > Anyway, we continued with Boris patch to debug the new mmc error which
> > > > > looks like this:
> > > > > 
> > > > > [    3.084464] mmc0: unrecognised SCR structure version 15
> > > > > [    3.089176] mmc0: error -22 whilst initialising SD card
> > > > > 
> > > > > I asked to add a lot of trancing, see attached diff.
> > > > 
> > > > Please avoid attachment on mailing list and use pastebin for diff.
> > > > 
> > > > > We discovered a bug
> > > > > in xen_swiotlb_init: if io_tlb_start != 0 at the beginning of
> > > > > xen_swiotlb_init, start_dma_addr is not set correctly. This oneline
> > > > > patch fixes it:
> > > > > 
> > > > > diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> > > > > index 0a40ac332a4c..b75c43356eba 100644
> > > > > --- a/drivers/xen/swiotlb-xen.c
> > > > > +++ b/drivers/xen/swiotlb-xen.c
> > > > > @@ -191,6 +191,7 @@ int __ref xen_swiotlb_init(int verbose, bool
> > > > > early)
> > > > >            * IO TLB memory already allocated. Just use it.
> > > > >            */
> > > > >           if (io_tlb_start != 0) {
> > > > > +               start_dma_addr = io_tlb_start;
> > > > >                   xen_io_tlb_start = phys_to_virt(io_tlb_start);
> > > > >                   goto end;
> > > > >           }
> > > > > 
> > > > > Unfortunately it doesn't solve the mmc0 error.
> > > > > 
> > > > > 
> > > > > As you might notice from the logs, none of the other interesting
> > > > > printks
> > > > > printed anything, which seems to mean that the memory allocated by
> > > > > xen_swiotlb_alloc_coherent and mapped by xen_swiotlb_map_page should
> > > > > be
> > > > > just fine.
> > > > > 
> > > > > I am starting to be out of ideas. Do you guys have any suggestions on
> > > > > what could be the issue or what could be done to discover it?
> > > > 
> > > > Sorry if my suggestions are going to be obvious, but I can't confirm
> > > > whether
> > > > this was already done:
> > > >      1) Does the kernel boot on baremetal (i.e without Xen)? This should
> > > > help
> > > > to confirm whether the bug is Xen is related.
> > > 
> > > Yes it boots
> > > 
> > > >      2) Swiotlb should not be necessary for basic dom0 boot on Arm. Did
> > > > you try
> > > > to disable it? This should help to confirm whether swiotlb is the
> > > > problem or
> > > > not.
> > > 
> > > It boots disabling swiotlb-xen
> > 
> > Thank you for the answer! swiotlb-xen should basically be a NOP for dom0. So
> > this suggests swiotlb is doing some transformation on the DMA address.
> > 
> > I have an idea what may have gone wrong. AFAICT, xen-swiotlb seems to assume
> > the DMA address space and CPU address space is the same. Is RPI using the
> > same address space?
> 
> Another question, is the DMA request bounced? If so, are we sure the bounce
> buffer is in the first GB?

Yes, it is. This is actually where we spent the last few days, and I
found another little related bug in the initialization of the
swiotlb-xen but now I am sure the memory is under 1GB (0x34000000-0x38000000)
--8323329-1236722027-1589399488=:26167--

