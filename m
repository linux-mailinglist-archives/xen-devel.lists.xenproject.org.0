Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FC792B00D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 08:26:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755850.1164345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR4Ia-0006n3-QU; Tue, 09 Jul 2024 06:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755850.1164345; Tue, 09 Jul 2024 06:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR4Ia-0006ks-Nf; Tue, 09 Jul 2024 06:26:00 +0000
Received: by outflank-mailman (input) for mailman id 755850;
 Tue, 09 Jul 2024 06:25:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5/C9=OJ=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sR4IZ-0006kk-QZ
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 06:25:59 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ac98c0b-3dbc-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 08:25:58 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E823568AFE; Tue,  9 Jul 2024 08:25:55 +0200 (CEST)
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
X-Inumbo-ID: 1ac98c0b-3dbc-11ef-bbfb-fd08da9f4363
Date: Tue, 9 Jul 2024 08:25:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: mhklinux@outlook.com
Cc: robin.murphy@arm.com, joro@8bytes.org, will@kernel.org, jgross@suse.com,
	sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, hch@lst.de,
	m.szyprowski@samsung.com, petr@tesarici.cz, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/1] swiotlb: Reduce swiotlb pool lookups
Message-ID: <20240709062555.GB16797@lst.de>
References: <20240708194100.1531-1-mhklinux@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708194100.1531-1-mhklinux@outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Hi Michael,

I've applied this, but I've made a few changes before that directly as
we're getting close to the end of the merge window.

Most of it is very slight formatting tweaks, but I've also kept the
dma_uses_io_tlb field under ifdef CONFIG_SWIOTLB_DYNAMIC as I
don't want to touch the device structure layout.

Let me me know if this is ok for you.  If I can get reviews today
or tomorrow I'd also love to add them, but given that all this has
been extensively discussed I went ahead with applying it.

Thanks for all your work!

