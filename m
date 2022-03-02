Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 134394C9EEF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 09:08:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282024.480570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPK1Z-00081B-C7; Wed, 02 Mar 2022 08:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282024.480570; Wed, 02 Mar 2022 08:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPK1Z-0007ys-8u; Wed, 02 Mar 2022 08:07:53 +0000
Received: by outflank-mailman (input) for mailman id 282024;
 Wed, 02 Mar 2022 08:07:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rYeN=TN=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1nPK1X-0007ym-Vb
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 08:07:51 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da8fb3f7-99ff-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 09:07:50 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F380B68AFE; Wed,  2 Mar 2022 09:07:46 +0100 (CET)
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
X-Inumbo-ID: da8fb3f7-99ff-11ec-8539-5f4723681683
Date: Wed, 2 Mar 2022 09:07:46 +0100
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
	x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
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
Subject: Re: [PATCH 07/11] x86: remove the IOMMU table infrastructure
Message-ID: <20220302080746.GA23075@lst.de>
References: <20220227143055.335596-1-hch@lst.de> <20220227143055.335596-8-hch@lst.de> <Yh5j5q5n/GyU0/1n@0xbeefdead.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yh5j5q5n/GyU0/1n@0xbeefdead.lan>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Mar 01, 2022 at 01:20:22PM -0500, Konrad Rzeszutek Wilk wrote:
> I think you also need to check for IBM Calgary?

The IBM Calgary IOMMU support is long gone.

