Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90783CD093
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jul 2021 11:23:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158242.291427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5PU2-0004wh-4W; Mon, 19 Jul 2021 09:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158242.291427; Mon, 19 Jul 2021 09:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5PU2-0004tl-0c; Mon, 19 Jul 2021 09:22:42 +0000
Received: by outflank-mailman (input) for mailman id 158242;
 Mon, 19 Jul 2021 09:22:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hDlA=ML=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1m5PU0-0004tN-0g
 for xen-devel@lists.xenproject.org; Mon, 19 Jul 2021 09:22:40 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2591b7ea-1cdd-4593-87b5-9c117b49d171;
 Mon, 19 Jul 2021 09:22:38 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 11E6C67373; Mon, 19 Jul 2021 11:22:36 +0200 (CEST)
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
X-Inumbo-ID: 2591b7ea-1cdd-4593-87b5-9c117b49d171
Date: Mon, 19 Jul 2021 11:22:35 +0200
From: Christoph Hellwig <hch@lst.de>
To: Roman Skakun <rm.skakun@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Andrii Anisov <andrii_anisov@epam.com>,
	Roman Skakun <Roman_Skakun@epam.com>
Subject: Re: [PATCH v2] dma-mapping: use vmalloc_to_page for vmalloc
 addresses
Message-ID: <20210719092235.GA31566@lst.de>
References: <20210715170011.GA17324@lst.de> <20210716083934.154992-1-rm.skakun@gmail.com> <20210716093551.GA17981@lst.de> <CADu_u-OYA+Z_y-DBLxyUYGhmLVMtLggmZ_SnRiEtw9EGrO4oGg@mail.gmail.com> <alpine.DEB.2.21.2107160828430.3916@sstabellini-ThinkPad-T480s> <CADu_u-Psn5QpOyZ18_NCPx14DYxmGmSqVod=_RBC3A_A93tGUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADu_u-Psn5QpOyZ18_NCPx14DYxmGmSqVod=_RBC3A_A93tGUw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sat, Jul 17, 2021 at 11:39:21AM +0300, Roman Skakun wrote:
> > We can merge this patch and create a new one for
> > xen_swiotlb_free_coherent() later.
> > Yeah, no worries, I didn't know that exposing dma_common_vaddr_to_page
> > was problematic.
> >
> > This patch is fine by me.
> 
> Good. I'm agreed too. Waiting for Christoph.

Fine with.  I've queued up the modified patch.

