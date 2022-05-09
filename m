Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6BD51F453
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 08:18:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324213.546169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnwib-0007wE-Lt; Mon, 09 May 2022 06:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324213.546169; Mon, 09 May 2022 06:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnwib-0007sq-J2; Mon, 09 May 2022 06:18:05 +0000
Received: by outflank-mailman (input) for mailman id 324213;
 Mon, 09 May 2022 06:18:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tv/a=VR=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1nnwia-0007sk-Fu
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 06:18:04 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c80371db-cf5f-11ec-a406-831a346695d4;
 Mon, 09 May 2022 08:18:03 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id EFE0668AFE; Mon,  9 May 2022 08:18:00 +0200 (CEST)
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
X-Inumbo-ID: c80371db-cf5f-11ec-a406-831a346695d4
Date: Mon, 9 May 2022 08:18:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Christoph Hellwig <hch@lst.de>, jgross@suse.com,
	xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux-foundation.org, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH] swiotlb-xen: fix DMA_ATTR_NO_KERNEL_MAPPING on arm
Message-ID: <20220509061800.GC17190@lst.de>
References: <20220423171422.1831676-1-hch@lst.de> <alpine.DEB.2.22.394.2204261605420.915916@ubuntu-linux-20-04-desktop> <20220428132737.GA13999@lst.de> <alpine.DEB.2.22.394.2204281449060.915916@ubuntu-linux-20-04-desktop> <27d39d5a-3b79-bdda-b7e4-f4477667919f@oracle.com> <alpine.DEB.2.22.394.2204281548320.915916@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2204281548320.915916@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Apr 28, 2022 at 03:49:53PM -0700, Stefano Stabellini wrote:
> On one hand, Linux doesn't boot on a platform without this fix. On the
> other hand, I totally see that this patch could introduce regressions on
> x86 so I think it is fair that we are careful with it.
> 
> >From my point of view, it might be better to wait for 5.19 and mark it
> as backport.

Sounds good to me.  Based on the other mails I assume you want me to
take it through the dma-mapping tree, so I will do that tomorrow unless
I hear otherwise.

