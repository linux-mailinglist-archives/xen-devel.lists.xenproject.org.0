Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 888DE523523
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 16:14:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326922.549586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1non5r-0000ZV-HA; Wed, 11 May 2022 14:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326922.549586; Wed, 11 May 2022 14:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1non5r-0000Wr-EA; Wed, 11 May 2022 14:13:35 +0000
Received: by outflank-mailman (input) for mailman id 326922;
 Wed, 11 May 2022 14:13:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ttdd=VT=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1non5p-0000Wl-Tu
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 14:13:33 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89c967f2-d134-11ec-a406-831a346695d4;
 Wed, 11 May 2022 16:13:32 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 260F668CFE; Wed, 11 May 2022 16:13:29 +0200 (CEST)
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
X-Inumbo-ID: 89c967f2-d134-11ec-a406-831a346695d4
Date: Wed, 11 May 2022 16:13:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Christoph Hellwig <hch@lst.de>, jgross@suse.com,
	xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux-foundation.org, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [PATCH] swiotlb-xen: fix DMA_ATTR_NO_KERNEL_MAPPING on arm
Message-ID: <20220511141328.GA31939@lst.de>
References: <20220423171422.1831676-1-hch@lst.de> <alpine.DEB.2.22.394.2204261605420.915916@ubuntu-linux-20-04-desktop> <20220428132737.GA13999@lst.de> <alpine.DEB.2.22.394.2204281449060.915916@ubuntu-linux-20-04-desktop> <27d39d5a-3b79-bdda-b7e4-f4477667919f@oracle.com> <alpine.DEB.2.22.394.2204281548320.915916@ubuntu-linux-20-04-desktop> <41c2483c-ab54-41be-7815-9d4a98e0249e@oracle.com> <alpine.DEB.2.22.394.2204291615130.1947187@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2204291615130.1947187@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Apr 29, 2022 at 04:15:38PM -0700, Stefano Stabellini wrote:
> Great! Christoph you can go ahead and pick it up in your tree if you are
> up for it.

The patch is in the dma-mapping for-next brancch now:

http://git.infradead.org/users/hch/dma-mapping.git/commitdiff/62cb1ca1654b57589c582efae2748159c74ee356

There were a few smaller merge conflicts with the swiotlb refactoring.
I think everything is fine, but please take another look if possible.

