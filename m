Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 604843E487C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 17:16:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165047.301616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD70t-0003SY-US; Mon, 09 Aug 2021 15:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165047.301616; Mon, 09 Aug 2021 15:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD70t-0003Qi-R9; Mon, 09 Aug 2021 15:16:27 +0000
Received: by outflank-mailman (input) for mailman id 165047;
 Mon, 09 Aug 2021 15:16:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nCtp=NA=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1mD70r-0003Qc-M3
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 15:16:25 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c241b464-f924-11eb-9f20-12813bfff9fa;
 Mon, 09 Aug 2021 15:16:24 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6D60467357; Mon,  9 Aug 2021 17:16:22 +0200 (CEST)
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
X-Inumbo-ID: c241b464-f924-11eb-9f20-12813bfff9fa
Date: Mon, 9 Aug 2021 17:16:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org,
	xen-devel@lists.xenproject.org, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Stephen Bates <sbates@raithlin.com>,
	Martin Oliveira <martin.oliveira@eideticom.com>
Subject: Re: [PATCH v3 00/21] .map_sg() error cleanup
Message-ID: <20210809151622.GB22445@lst.de>
References: <20210729201539.5602-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729201539.5602-1-logang@deltatee.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks,

I've applied this to the dma-mapping tree with a few minor cosmetic
tweaks.

