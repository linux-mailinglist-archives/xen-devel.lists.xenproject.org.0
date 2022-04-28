Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B2651351B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 15:28:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316536.535459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk4BN-0001IL-FP; Thu, 28 Apr 2022 13:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316536.535459; Thu, 28 Apr 2022 13:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk4BN-0001Es-CG; Thu, 28 Apr 2022 13:27:45 +0000
Received: by outflank-mailman (input) for mailman id 316536;
 Thu, 28 Apr 2022 13:27:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2LgV=VG=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1nk4BL-0001Em-Px
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 13:27:43 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb51b3da-c6f6-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 15:27:42 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C602768C7B; Thu, 28 Apr 2022 15:27:38 +0200 (CEST)
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
X-Inumbo-ID: fb51b3da-c6f6-11ec-8fc3-03012f2f19d4
Date: Thu, 28 Apr 2022 15:27:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, jgross@suse.com,
	xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux-foundation.org, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH] swiotlb-xen: fix DMA_ATTR_NO_KERNEL_MAPPING on arm
Message-ID: <20220428132737.GA13999@lst.de>
References: <20220423171422.1831676-1-hch@lst.de> <alpine.DEB.2.22.394.2204261605420.915916@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2204261605420.915916@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Apr 26, 2022 at 04:07:45PM -0700, Stefano Stabellini wrote:
> > Reported-by: Rahul Singh <Rahul.Singh@arm.com>
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Do you want to take this through the Xen tree or should I pick it up?
Either way I'd love to see some testing on x86 as well.

