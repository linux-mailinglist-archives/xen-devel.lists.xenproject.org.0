Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A23D969558
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 09:28:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788700.1198150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slNxB-0003rj-L0; Tue, 03 Sep 2024 07:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788700.1198150; Tue, 03 Sep 2024 07:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slNxB-0003ol-Hc; Tue, 03 Sep 2024 07:27:53 +0000
Received: by outflank-mailman (input) for mailman id 788700;
 Tue, 03 Sep 2024 07:27:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uk9L=QB=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1slNx9-0003nG-Ih
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 07:27:51 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03b6ceca-69c6-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 09:27:46 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C1D91227A8E; Tue,  3 Sep 2024 09:27:44 +0200 (CEST)
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
X-Inumbo-ID: 03b6ceca-69c6-11ef-99a1-01e77a169b0f
Date: Tue, 3 Sep 2024 09:27:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	"Michael S . Tsirkin " <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: clearly mark DMA_OPS support as an architecture feature v2
Message-ID: <20240903072744.GA2082@lst.de>
References: <20240828061104.1925127-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828061104.1925127-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

I've pulled this into the dma-mapping for-next tree, although I'd
love to see one of the vdpa maintainers look over patch 1.  I'm
pretty sure it's correct, but a confirmation would be good.


