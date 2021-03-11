Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4828C337A0A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 17:52:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96699.183251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKOYA-0006B1-Tn; Thu, 11 Mar 2021 16:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96699.183251; Thu, 11 Mar 2021 16:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKOYA-0006Ac-Qt; Thu, 11 Mar 2021 16:52:38 +0000
Received: by outflank-mailman (input) for mailman id 96699;
 Thu, 11 Mar 2021 16:52:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UR/s=IJ=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lKOYA-0006AX-0e
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 16:52:38 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e89263c1-ddec-42b3-b5ba-90fd0fcd16f0;
 Thu, 11 Mar 2021 16:52:37 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8347C68B05; Thu, 11 Mar 2021 17:52:34 +0100 (CET)
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
X-Inumbo-ID: e89263c1-ddec-42b3-b5ba-90fd0fcd16f0
Date: Thu, 11 Mar 2021 17:52:34 +0100
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, Claire Chang <tientzu@chromium.org>,
	linuxppc-dev@lists.ozlabs.org,
	Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: swiotlb cleanups v2
Message-ID: <20210311165234.GA25023@lst.de>
References: <20210301074436.919889-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301074436.919889-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

Any comments? I would be good to make some progress on this series
as the base for the various additional pools.

On Mon, Mar 01, 2021 at 08:44:22AM +0100, Christoph Hellwig wrote:
> Hi Konrad,
> 
> this series contains a bunch of swiotlb cleanups, mostly to reduce the
> amount of internals exposed to code outside of swiotlb.c, which should
> helper to prepare for supporting multiple different bounce buffer pools.
> 
> Changes since v1:
>  - rebased to v5.12-rc1
>  - a few more cleanups
>  - merge and forward port the patch from Claire to move all the global
>    variables into a struct to prepare for multiple instances
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
---end quoted text---

