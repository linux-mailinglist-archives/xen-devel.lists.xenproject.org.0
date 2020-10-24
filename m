Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFDA297A40
	for <lists+xen-devel@lfdr.de>; Sat, 24 Oct 2020 03:58:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11405.30244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kW8nf-0005tw-Or; Sat, 24 Oct 2020 01:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11405.30244; Sat, 24 Oct 2020 01:56:55 +0000
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
	id 1kW8nf-0005tY-J0; Sat, 24 Oct 2020 01:56:55 +0000
Received: by outflank-mailman (input) for mailman id 11405;
 Sat, 24 Oct 2020 01:56:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Iak=D7=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kW8nd-0005tT-S1
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 01:56:53 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de66172b-b1eb-497c-862e-ed9e9a4dce1a;
 Sat, 24 Oct 2020 01:56:50 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09O1udLq093473
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 23 Oct 2020 21:56:45 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09O1udR5093472;
 Fri, 23 Oct 2020 18:56:39 -0700 (PDT) (envelope-from ehem)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+Iak=D7=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kW8nd-0005tT-S1
	for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 01:56:53 +0000
X-Inumbo-ID: de66172b-b1eb-497c-862e-ed9e9a4dce1a
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id de66172b-b1eb-497c-862e-ed9e9a4dce1a;
	Sat, 24 Oct 2020 01:56:50 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09O1udLq093473
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 23 Oct 2020 21:56:45 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09O1udR5093472;
	Fri, 23 Oct 2020 18:56:39 -0700 (PDT)
	(envelope-from ehem)
Date: Fri, 23 Oct 2020 18:56:38 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, roman@zededa.com,
        xen-devel@lists.xenproject.org
Subject: Re: Xen on RP4
Message-ID: <20201024015638.GC90171@mattapan.m5p.com>
References: <20201012215751.GB89158@mattapan.m5p.com>
 <c38d78bd-c011-404b-5f59-d10cd7d7f006@xen.org>
 <20201016003024.GA13290@mattapan.m5p.com>
 <23885c28-dee5-4e9a-dc43-6ccf19a94df6@xen.org>
 <20201022021655.GA74011@mattapan.m5p.com>
 <alpine.DEB.2.21.2010221620230.12247@sstabellini-ThinkPad-T480s>
 <20201023005629.GA83870@mattapan.m5p.com>
 <alpine.DEB.2.21.2010221801490.12247@sstabellini-ThinkPad-T480s>
 <20201023211941.GA90171@mattapan.m5p.com>
 <alpine.DEB.2.21.2010231647290.12247@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2010231647290.12247@sstabellini-ThinkPad-T480s>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Fri, Oct 23, 2020 at 04:59:30PM -0700, Stefano Stabellini wrote:
> This is what is going on. kernel/dma/swiotlb.c:swiotlb_init gets called
> and tries to allocate a buffer for the swiotlb. It does so by calling
> 
>   memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
> 
> In your case, the allocation must fail, no_iotlb_memory is set, and I
> expect you see this warning among the boot messages:
> 
>   Cannot allocate buffer
> 
> Later during initialization swiotlb-xen comes in
> (drivers/xen/swiotlb-xen.c:xen_swiotlb_init) and given that io_tlb_start
> is != 0 it thinks the memory is ready to use when actually it is not.
> 
> When the swiotlb is actually needed, swiotlb_tbl_map_single gets called
> and since no_iotlb_memory is set the kernel panics.
> 
> 
> The reason why you are only seeing it with a 2G dom0 is because
> swiotlb_init is only called when:
> 
>   max_pfn > PFN_DOWN(arm64_dma_phys_limit ? : arm64_dma32_phys_limit))
> 
> see arch/arm64/mm/init.c:mem_init. So when dom0 is 512MB swiotlb_init is
> not called at all. swiotlb-xen does the allocation itself with
> memblock_alloc and it succeeds.
> 
> Note that I tried to repro the issue here at my end but it works for me
> with device tree. So the swiotlb_init memory allocation failure probably
> only shows on ACPI, maybe because ACPI is reserving too much low memory.
> 
> In any case, I think the issue might be "fixed" by this patch:
> 
> 
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index c19379fabd20..84e15e7d3929 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -231,6 +231,7 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
>  		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
>  	}
>  	io_tlb_index = 0;
> +	no_iotlb_memory = false;
>  
>  	if (verbose)
>  		swiotlb_print_info();
> @@ -263,8 +264,11 @@ swiotlb_init(int verbose)
>  		return;
>  
>  	if (io_tlb_start)
> +	{
>  		memblock_free_early(io_tlb_start,
>  				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
> +		io_tlb_start = 0;
> +	}
>  	pr_warn("Cannot allocate buffer");
>  	no_iotlb_memory = true;
>  }
> @@ -362,6 +366,7 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
>  		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
>  	}
>  	io_tlb_index = 0;
> +	no_iotlb_memory = false;
>  
>  	swiotlb_print_info();

This does indeed appear to take care of the domain 0 panic.

Last issue is the framebuffer and this project has reached usability.
My impression was framebuffer was an issue for device-tree as well.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



