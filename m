Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B454CC2F9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 17:39:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283546.482600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPoUN-0001Gz-9u; Thu, 03 Mar 2022 16:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283546.482600; Thu, 03 Mar 2022 16:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPoUN-0001Eo-6k; Thu, 03 Mar 2022 16:39:39 +0000
Received: by outflank-mailman (input) for mailman id 283546;
 Thu, 03 Mar 2022 16:39:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JYFF=TO=alpha.franken.de=tsbogend@srs-se1.protection.inumbo.net>)
 id 1nPoUM-0001Ei-1G
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 16:39:38 +0000
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 831c5441-9b10-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 17:39:36 +0100 (CET)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1nPoU9-0008UX-00; Thu, 03 Mar 2022 17:39:25 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 23B82C28F1; Thu,  3 Mar 2022 17:39:00 +0100 (CET)
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
X-Inumbo-ID: 831c5441-9b10-11ec-8eba-a37418f5ba1a
Date: Thu, 3 Mar 2022 17:39:00 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux-foundation.org, x86@kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH 06/12] MIPS/octeon: use swiotlb_init instead of open
 coding it
Message-ID: <20220303163900.GA11971@alpha.franken.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-7-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301105311.885699-7-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Mar 01, 2022 at 12:53:05PM +0200, Christoph Hellwig wrote:
> Use the generic swiotlb initialization helper instead of open coding it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/mips/cavium-octeon/dma-octeon.c | 15 ++-------------
>  arch/mips/pci/pci-octeon.c           |  2 +-
>  2 files changed, 3 insertions(+), 14 deletions(-)

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

