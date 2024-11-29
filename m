Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 625DB9DEBD0
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 18:37:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846047.1261318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tH4v9-0004NJ-Vo; Fri, 29 Nov 2024 17:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846047.1261318; Fri, 29 Nov 2024 17:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tH4v9-0004LU-Se; Fri, 29 Nov 2024 17:36:47 +0000
Received: by outflank-mailman (input) for mailman id 846047;
 Fri, 29 Nov 2024 17:36:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NII6=SY=bounce.vates.tech=bounce-md_30504962.6749fba9.v1-b9d7cae373384516aaaa8034e390a343@srs-se1.protection.inumbo.net>)
 id 1tH4v8-0004LO-LS
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 17:36:46 +0000
Received: from mail180-27.suw31.mandrillapp.com
 (mail180-27.suw31.mandrillapp.com [198.2.180.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ed052c2-ae78-11ef-a0cf-8be0dac302b0;
 Fri, 29 Nov 2024 18:36:42 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-27.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4Y0L2d0l3Fz6CQDrq
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2024 17:36:41 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b9d7cae373384516aaaa8034e390a343; Fri, 29 Nov 2024 17:36:41 +0000
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
X-Inumbo-ID: 7ed052c2-ae78-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE4MC4yNyIsImhlbG8iOiJtYWlsMTgwLTI3LnN1dzMxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjdlZDA1MmMyLWFlNzgtMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyOTAxODAyLjkwMzc5LCJzZW5kZXIiOiJib3VuY2UtbWRfMzA1MDQ5NjIuNjc0OWZiYTkudjEtYjlkN2NhZTM3MzM4NDUxNmFhYWE4MDM0ZTM5MGEzNDNAYm91bmNlLnZhdGVzLnRlY2giLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732901801; x=1733162301;
	bh=2DFaOg6NuCFtrE/G4yKsOhsAMmOaVP7yOxEacPXZjy8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=n+purXCCvPT7Mh6jL/Hofbk4MNnlQvWPYMGBZkdJb1p3vJUurufsCIswJsIECGh4i
	 rO5BY3LHzeBbPLNb5gcEM54x0g0nLCGPqzm267ErHEyi4dqWLT7JaHPwkbRVLqXzk1
	 ceszh/rIhomYi04yhrqd5Z4jmKK4Nfj8zAfIcXy9bwBNvezbXVc2SOeDJjEnVZKVY4
	 WKlwLygfREYurDH101VCh5Af5aOtq3lpQySJhs/GOq5Jcyr0bJhnZxSprmdkjTZFB5
	 P7FUAkT++nbC7oIhUBIdPew1ckJu3SAg9t2NQ1neJhKhSFGlott/g/8tueZkz5kGIa
	 6vTSgMUsDHLfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732901801; x=1733162301; i=thierry.escande@vates.tech;
	bh=2DFaOg6NuCFtrE/G4yKsOhsAMmOaVP7yOxEacPXZjy8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=pM1PdLasCaDY9qGJFRDrpduvkkNtPlKq9Mmq3ABo0BwJSRz/Y/DC8kZrCJ1fGT8gq
	 j69VTLooXWwMq550umE8JAQO7de2+VlhUEIDVqYljuJmxLIakpmnGdQQ6PngX9Y8mh
	 k56hmwQH0wXAQBzCajnBKfnDCjOKY7R1UdAv5F6qqyddx9uKERM1RDCBCQrg3uCy8T
	 JLhbxW3zJ6Z0p5ZmgcsyDgoZksYbhqLaGtyz6kxPjfJUKtI9nZKF74ty7PbR+fkhJX
	 yDm5GOjpsSxQK8bV+IkiewPIXfOrbYm1x3eEUFLfunMtWuz57MZ8MBkZvMnKbD82hr
	 i1tYoRtZ/SNGQ==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=201/2]=20xen/swiotlb:=20add=20alignment=20check=20for=20dma=20buffers?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732901799832
Message-Id: <e6ceb22d-3fa7-430c-9410-3c5ffd9ded2d@vates.tech>
To: "Juergen Gross" <jgross@suse.com>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Cc: "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>, xen-devel@lists.xenproject.org, jbeulich@suse.com
References: <20240916064748.18071-1-jgross@suse.com> <20240916064748.18071-2-jgross@suse.com>
In-Reply-To: <20240916064748.18071-2-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b9d7cae373384516aaaa8034e390a343?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241129:md
Date: Fri, 29 Nov 2024 17:36:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

On 16/09/2024 08:47, Juergen Gross wrote:
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 35155258a7e2..ddf5b1df632e 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -78,9 +78,15 @@ static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
>  {
>  	unsigned long next_bfn, xen_pfn = XEN_PFN_DOWN(p);
>  	unsigned int i, nr_pages = XEN_PFN_UP(xen_offset_in_page(p) + size);
> +	phys_addr_t algn = 1ULL << (get_order(size) + PAGE_SHIFT);
>  
>  	next_bfn = pfn_to_bfn(xen_pfn);
>  
> +	/* If buffer is physically aligned, ensure DMA alignment. */
> +	if (IS_ALIGNED(p, algn) &&
> +	    !IS_ALIGNED(next_bfn << XEN_PAGE_SHIFT, algn))
> +		return 1;

There is a regression in the mpt3sas driver because of this change.
When, in a dom0, this driver creates its DMA pool at probe time and
calls dma_pool_zalloc() (see [1]), the call to
range_straddles_page_boundary() (from xen_swiotlb_alloc_coherent())
returns 1 because of the alignment checks added by this patch. Then the
call to xen_create_contiguous_region() in xen_swiotlb_alloc_coherent()
fails because the passed size order is too big (> MAX_CONTIG_ORDER).
This driver sets the pool allocation block size to 2.3+ MBytes.

From previous discussions on the v1 patch, these checks are not
necessary from xen_swiotlb_alloc_coherent() that already ensures
alignment, right?

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/scsi/mpt3sas/mpt3sas_base.c?h=v6.12.1#n6227

Regards,
Thierry

