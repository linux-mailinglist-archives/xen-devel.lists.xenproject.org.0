Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38B07260CF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 15:12:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544764.850750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6swS-0002t5-Bi; Wed, 07 Jun 2023 13:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544764.850750; Wed, 07 Jun 2023 13:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6swS-0002qN-8r; Wed, 07 Jun 2023 13:11:12 +0000
Received: by outflank-mailman (input) for mailman id 544764;
 Wed, 07 Jun 2023 13:11:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=27QN=B3=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1q6swQ-0002qH-7p
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 13:11:10 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3ce3a1d-0534-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 15:11:08 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 01FC26732D; Wed,  7 Jun 2023 15:11:05 +0200 (CEST)
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
X-Inumbo-ID: c3ce3a1d-0534-11ee-b232-6b7b168915f2
Date: Wed, 7 Jun 2023 15:11:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Lyude Paul <lyude@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>, xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/nouveau: stop using is_swiotlb_active
Message-ID: <20230607131104.GA19206@lst.de>
References: <20230518134253.909623-1-hch@lst.de> <20230518134253.909623-4-hch@lst.de> <b07c93bc7cb71a32091794cd97f7c702c34539da.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b07c93bc7cb71a32091794cd97f7c702c34539da.camel@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, May 18, 2023 at 04:30:49PM -0400, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Thanks for getting to this!

I've tentantively queued this up in the dma-mapping for-next tree.
Let me know if you'd prefer it to go through the nouveau tree.

