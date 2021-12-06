Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1473F46981D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:09:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239037.414297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEgK-0002A7-H9; Mon, 06 Dec 2021 14:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239037.414297; Mon, 06 Dec 2021 14:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEgK-00028K-Dv; Mon, 06 Dec 2021 14:09:28 +0000
Received: by outflank-mailman (input) for mailman id 239037;
 Mon, 06 Dec 2021 14:09:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0EtG=QX=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1muEgJ-00028E-26
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:09:27 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dd87902-569e-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 15:09:25 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6C59868B05; Mon,  6 Dec 2021 15:09:17 +0100 (CET)
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
X-Inumbo-ID: 1dd87902-569e-11ec-8a4d-196798b21f7b
Date: Mon, 6 Dec 2021 15:09:16 +0100
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, jgross@suse.com,
	sstabellini@kernel.org, boris.ostrovsky@oracle.com, joro@8bytes.org,
	will@kernel.org, davem@davemloft.net, kuba@kernel.org,
	jejb@linux.ibm.com, martin.petersen@oracle.com, arnd@arndb.de,
	hch@infradead.org, m.szyprowski@samsung.com, robin.murphy@arm.com,
	thomas.lendacky@amd.com, Tianyu.Lan@microsoft.com,
	xen-devel@lists.xenproject.org, michael.h.kelley@microsoft.com,
	iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
	vkuznets@redhat.com, brijesh.singh@amd.com, konrad.wilk@oracle.com,
	hch@lst.de, parri.andrea@gmail.com, dave.hansen@intel.com
Subject: Re: [PATCH V4 1/5] Swiotlb: Add Swiotlb bounce buffer remap
 function for HV IVM
Message-ID: <20211206140916.GB5100@lst.de>
References: <20211205081815.129276-1-ltykernel@gmail.com> <20211205081815.129276-2-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211205081815.129276-2-ltykernel@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Please spell swiotlb with a lower case s.  Otherwise this look good

Acked-by: Christoph Hellwig <hch@lst.de>

Feel free to carry this in whatever tree is suitable for the rest of the
patches.

