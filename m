Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7804C7E28B6
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 16:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628170.979337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01Yx-0002yy-UU; Mon, 06 Nov 2023 15:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628170.979337; Mon, 06 Nov 2023 15:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01Yx-0002wt-Ro; Mon, 06 Nov 2023 15:30:51 +0000
Received: by outflank-mailman (input) for mailman id 628170;
 Mon, 06 Nov 2023 15:30:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=anSp=GT=redhat.com=msnitzer@srs-se1.protection.inumbo.net>)
 id 1r01Yw-0002wm-Vj
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 15:30:50 +0000
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 757f98e9-7cb9-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 16:30:48 +0100 (CET)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-41cc537ed54so29556031cf.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 07:30:48 -0800 (PST)
Received: from localhost (pool-68-160-141-91.bstnma.fios.verizon.net.
 [68.160.141.91]) by smtp.gmail.com with ESMTPSA id
 bb29-20020a05622a1b1d00b00418122186ccsm3481815qtb.12.2023.11.06.07.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 07:30:46 -0800 (PST)
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
X-Inumbo-ID: 757f98e9-7cb9-11ee-9b0e-b553b5be7939
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699284647; x=1699889447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrjYpFY8E2oiY2xxYzQ2GUG1YMJAJZ45VGuFmmeRh4c=;
        b=GLWdG282KOSnvg8TfymEytv/r272E+kA1/OZqwSoOlFQ/aTqsybTUL3zzxlOnSbbPh
         xKSoH+loN6J/uE9YqHdyzqxyD6HEg5dO31IjmwW6IJ4dEItRIU6pN/6vLATfjvef0ygk
         XhrrX0IaEoRYemgcE/OEF9oHCcLYjKerKpLZ/mkouiOkWtOPbYZ1VmJpAXDEO6aceBTc
         BpiL6B6SRJ/le0ENET42cutncjEVWI+I8xJZLAIWzQaTRGvR2BDu6cSMelnlz4CaKFO4
         fniXA5gO+1cSXobzw7LED4Zl/7ADaAXDeka5cI/2neTZ260U8CgSDiP1iLWKt3yU/bvW
         VNtA==
X-Gm-Message-State: AOJu0Yxtmdvj7n4ni4go2fQ62+iByCRbCUZBEYjTaLj6sMQOXfKJoMeM
	FqUJuCXkRj9r1Y6mNLID06M8
X-Google-Smtp-Source: AGHT+IEM/+zw76Fcxpj1WquMbJygUaMozC9Wk7yN5zbxmT5CSz4J9onVl5IQCkCNvJJhkdQNmfPFUA==
X-Received: by 2002:ac8:7d50:0:b0:41c:bbf3:b24b with SMTP id h16-20020ac87d50000000b0041cbbf3b24bmr35421169qtb.27.1699284647197;
        Mon, 06 Nov 2023 07:30:47 -0800 (PST)
Date: Mon, 6 Nov 2023 10:30:45 -0500
From: Mike Snitzer <snitzer@kernel.org>
To: Keith Busch <kbusch@kernel.org>
Cc: Mikulas Patocka <mpatocka@redhat.com>, Christoph Hellwig <hch@lst.de>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
	Marek Marczykowski-G'orecki <marmarek@invisiblethingslab.com>,
	Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
	Jan Kara <jack@suse.cz>, Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Michal Hocko <mhocko@suse.com>, stable@vger.kernel.org,
	regressions@lists.linux.dev, Alasdair Kergon <agk@redhat.com>,
	dm-devel@lists.linux.dev, linux-mm@kvack.org
Subject: Re: swiotlb-xen: provide the "max_mapping_size" method
Message-ID: <ZUkGpblDX637QV9y@redhat.com>
References: <3cb4133c-b6db-9187-a678-11ed8c9456e@redhat.com>
 <ZUUctamEFtAlSnSV@mail-itl>
 <ZUUlqJoS6_1IznzT@kbusch-mbp.dhcp.thefacebook.com>
 <ZUVYT1Xp4+hFT27W@mail-itl>
 <ZUV3TApYYoh_oiRR@kbusch-mbp.dhcp.thefacebook.com>
 <11a9886d-316c-edcd-d6da-24ad0b9a2b4@redhat.com>
 <ZUZOKitOAqqKiJ4n@kbusch-mbp.dhcp.thefacebook.com>
 <20231106071008.GB17022@lst.de>
 <928b5df7-fada-cf2f-6f6a-257a84547c3@redhat.com>
 <ZUkDUXDF6g4P86F3@kbusch-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUkDUXDF6g4P86F3@kbusch-mbp.dhcp.thefacebook.com>

On Mon, Nov 06 2023 at 10:16P -0500,
Keith Busch <kbusch@kernel.org> wrote:

> On Mon, Nov 06, 2023 at 03:59:40PM +0100, Mikulas Patocka wrote:
> > There's a bug that when using the XEN hypervisor with dm-crypt on NVMe, 
> > the kernel deadlocks [1].
> > 
> > The deadlocks are caused by inability to map a large bio vector -
> > dma_map_sgtable always returns an error, this gets propagated to the block
> > layer as BLK_STS_RESOURCE and the block layer retries the request
> > indefinitely.
> > 
> > XEN uses the swiotlb framework to map discontiguous pages into contiguous
> > runs that are submitted to the PCIe device. The swiotlb framework has a
> > limitation on the length of a mapping - this needs to be announced with
> > the max_mapping_size method to make sure that the hardware drivers do not
> > create larger mappings.
> > 
> > Without max_mapping_size, the NVMe block driver would create large
> > mappings that overrun the maximum mapping size.
> > 
> > [1] https://lore.kernel.org/stable/ZTNH0qtmint%2FzLJZ@mail-itl/
> 
> This should be a "Link:" tag.
> 
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > Reported-by: Marek Marczykowski-G'orecki <marmarek@invisiblethingslab.com>
> > Tested-by: Marek Marczykowski-G'orecki <marmarek@invisiblethingslab.com>
> > Suggested-by: Keith Busch <kbusch@kernel.org>
> 
> I was about to send the same thing. I did a little more than suggest
> this: it's is the very patch I wrote for testing, minus the redundant
> nvme bits! But since you already have a commit message for it...
> 
> Acked-by: Keith Busch <kbusch@kernel.org>

No, this patch should be attributed to you Keith.

Mikulas, I like that you ran with getting a fix prepared but please
update the patch so Keith is the author and use Link: as suggested for
the v2. Note: you'll still use your Signed-off-by since you had a role
in getting this patch together (but please move yours to the end of
the header).

Mike


> 
> > Suggested-by: Christoph Hellwig <hch@lst.de>
> > Cc: stable@vger.kernel.org
> > 
> > ---
> >  drivers/xen/swiotlb-xen.c |    1 +
> >  1 file changed, 1 insertion(+)
> > 
> > Index: linux-stable/drivers/xen/swiotlb-xen.c
> > ===================================================================
> > --- linux-stable.orig/drivers/xen/swiotlb-xen.c	2023-11-03 17:57:18.000000000 +0100
> > +++ linux-stable/drivers/xen/swiotlb-xen.c	2023-11-06 15:30:59.000000000 +0100
> > @@ -405,4 +405,5 @@ const struct dma_map_ops xen_swiotlb_dma
> >  	.get_sgtable = dma_common_get_sgtable,
> >  	.alloc_pages = dma_common_alloc_pages,
> >  	.free_pages = dma_common_free_pages,
> > +	.max_mapping_size = swiotlb_max_mapping_size,
> >  };
> 

