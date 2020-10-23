Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2662979CE
	for <lists+xen-devel@lfdr.de>; Sat, 24 Oct 2020 02:00:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11352.30095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kW6y6-00054k-Qs; Fri, 23 Oct 2020 23:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11352.30095; Fri, 23 Oct 2020 23:59:34 +0000
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
	id 1kW6y6-00054K-M7; Fri, 23 Oct 2020 23:59:34 +0000
Received: by outflank-mailman (input) for mailman id 11352;
 Fri, 23 Oct 2020 23:59:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3H45=D6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kW6y4-00054F-N5
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 23:59:32 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 160cfefc-cd1f-4082-aa50-e9853c344ade;
 Fri, 23 Oct 2020 23:59:32 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E4E9E207FF;
 Fri, 23 Oct 2020 23:59:30 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3H45=D6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kW6y4-00054F-N5
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 23:59:32 +0000
X-Inumbo-ID: 160cfefc-cd1f-4082-aa50-e9853c344ade
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 160cfefc-cd1f-4082-aa50-e9853c344ade;
	Fri, 23 Oct 2020 23:59:32 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E4E9E207FF;
	Fri, 23 Oct 2020 23:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603497571;
	bh=y3kGqPmVV53FhWuLmgb7cUA1bbmAXvKK3QPz8nZavXE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BN3Z/HVkAPHohBekWTeqa4kylNQi8CzAdDiQ6sQNr9BGIVe/ShzvCaOtyji0sbWa+
	 5q44vgKiPL5WhmtqVL8rvXN/oKYcU7RJgRfUi+9/p34HioadKYOmCD/mXxQareLPeQ
	 Dh4yEqXN0fNM2E/sVPYr/NNzEUNogQmugZ/zYUiI=
Date: Fri, 23 Oct 2020 16:59:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Elliott Mitchell <ehem+xen@m5p.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    roman@zededa.com, xen-devel@lists.xenproject.org
Subject: Re: Xen on RP4
In-Reply-To: <20201023211941.GA90171@mattapan.m5p.com>
Message-ID: <alpine.DEB.2.21.2010231647290.12247@sstabellini-ThinkPad-T480s>
References: <20201011051933.GA77136@mattapan.m5p.com> <alpine.DEB.2.21.2010121138480.10386@sstabellini-ThinkPad-T480s> <20201012215751.GB89158@mattapan.m5p.com> <c38d78bd-c011-404b-5f59-d10cd7d7f006@xen.org> <20201016003024.GA13290@mattapan.m5p.com>
 <23885c28-dee5-4e9a-dc43-6ccf19a94df6@xen.org> <20201022021655.GA74011@mattapan.m5p.com> <alpine.DEB.2.21.2010221620230.12247@sstabellini-ThinkPad-T480s> <20201023005629.GA83870@mattapan.m5p.com> <alpine.DEB.2.21.2010221801490.12247@sstabellini-ThinkPad-T480s>
 <20201023211941.GA90171@mattapan.m5p.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+ xen-devel

On Fri, 23 Oct 2020, Elliott Mitchell wrote:
> On Thu, Oct 22, 2020 at 06:02:46PM -0700, Stefano Stabellini wrote:
> > On Thu, 22 Oct 2020, Elliott Mitchell wrote:
> > > On Thu, Oct 22, 2020 at 04:27:23PM -0700, Stefano Stabellini wrote:
> > > > On Wed, 21 Oct 2020, Elliott Mitchell wrote:
> > > > > Due to experimenting with "proper" console on serial port, I ended up
> > > > > getting output.  Apparently domain 0 was panicing when trying to setup
> > > > > xen-blkback due to the swiotlb code being unable to allocate a bounce
> > > > > buffer.
> > > > > 
> > > > > Stefano, what is the status of swiotlb in the 5.8 kernel series?
> > > > 
> > > > The swiotlb fixes for RPi4 are not in 5.8. Linux 5.9 has just been
> > > > released, and it should come with everything you need.
> > > 
> > > I had 13 patches applied to Debian's 5.8 kernel source.  Two of the
> > > batch I had against 5.6 had gotten into mainline.  No issues were visible
> > > during normal operation.
> > > 
> > > Problem showed up when trying to start a domain.  By using Xen's console
> > > device I managed to get the messages:
> > > 
> > > xen-blkback: backend/vbd/3/51712: using 2 queues, protocol 1 (arm-abi) persistent grants
> > > Kernel panic - not syncing: Can not allocate SWIOTLB buffer earlier and can't now provide you with the DMA bounce buffer
> > > 
> > > Worth noting that by the time when I was starting this domain, the device
> > > had an uptime of more than an hour.  There could be a problem of swiotlb
> > > needing the ability to claim DMA-viable pages after they've been in use
> > > for other purposes.
> >  
> > I'll have a look
> 
> Finally came up with one detail of a change I'd made in the right time
> frame to trigger this issue.  As such I can now control this behavior and
> get it to occur or not.
> 
> I have some suspicion my planned workload approach differs from others.
> 
> During the runs where I was able to successfully boot a child domain,
> domain 0 had been allocated 512MB of memory.  During the unsuccessful run
> where the above message occurred, domain 0 had been allocated 2GB of
> memory.  This appears to reliably control the occurrence of this bug.

This is what is going on. kernel/dma/swiotlb.c:swiotlb_init gets called
and tries to allocate a buffer for the swiotlb. It does so by calling

  memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);

In your case, the allocation must fail, no_iotlb_memory is set, and I
expect you see this warning among the boot messages:

  Cannot allocate buffer

Later during initialization swiotlb-xen comes in
(drivers/xen/swiotlb-xen.c:xen_swiotlb_init) and given that io_tlb_start
is != 0 it thinks the memory is ready to use when actually it is not.

When the swiotlb is actually needed, swiotlb_tbl_map_single gets called
and since no_iotlb_memory is set the kernel panics.


The reason why you are only seeing it with a 2G dom0 is because
swiotlb_init is only called when:

  max_pfn > PFN_DOWN(arm64_dma_phys_limit ? : arm64_dma32_phys_limit))

see arch/arm64/mm/init.c:mem_init. So when dom0 is 512MB swiotlb_init is
not called at all. swiotlb-xen does the allocation itself with
memblock_alloc and it succeeds.

Note that I tried to repro the issue here at my end but it works for me
with device tree. So the swiotlb_init memory allocation failure probably
only shows on ACPI, maybe because ACPI is reserving too much low memory.

In any case, I think the issue might be "fixed" by this patch:



diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index c19379fabd20..84e15e7d3929 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -231,6 +231,7 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
 	}
 	io_tlb_index = 0;
+	no_iotlb_memory = false;
 
 	if (verbose)
 		swiotlb_print_info();
@@ -263,8 +264,11 @@ swiotlb_init(int verbose)
 		return;
 
 	if (io_tlb_start)
+	{
 		memblock_free_early(io_tlb_start,
 				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
+		io_tlb_start = 0;
+	}
 	pr_warn("Cannot allocate buffer");
 	no_iotlb_memory = true;
 }
@@ -362,6 +366,7 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
 	}
 	io_tlb_index = 0;
+	no_iotlb_memory = false;
 
 	swiotlb_print_info();

