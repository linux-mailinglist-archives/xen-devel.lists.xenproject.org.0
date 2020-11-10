Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4A82AD22A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 10:14:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23101.49674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcPjQ-0003NM-0f; Tue, 10 Nov 2020 09:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23101.49674; Tue, 10 Nov 2020 09:14:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcPjP-0003Mx-TQ; Tue, 10 Nov 2020 09:14:27 +0000
Received: by outflank-mailman (input) for mailman id 23101;
 Tue, 10 Nov 2020 09:14:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5gKK=EQ=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kcPjO-0003Ms-2a
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 09:14:26 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7885558-6f25-4fd1-90cd-264bd6d40d02;
 Tue, 10 Nov 2020 09:14:24 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 352EF6736F; Tue, 10 Nov 2020 10:14:22 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5gKK=EQ=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kcPjO-0003Ms-2a
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 09:14:26 +0000
X-Inumbo-ID: b7885558-6f25-4fd1-90cd-264bd6d40d02
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b7885558-6f25-4fd1-90cd-264bd6d40d02;
	Tue, 10 Nov 2020 09:14:24 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 352EF6736F; Tue, 10 Nov 2020 10:14:22 +0100 (CET)
Date: Tue, 10 Nov 2020 10:14:21 +0100
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, xen-devel@lists.xenproject.org,
	iommu@lists.linux-foundation.org,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-5.10] swiotlb: remove the tbl_dma_addr argument to
 swiotlb_tbl_map_single
Message-ID: <20201110091421.GA23707@lst.de>
References: <20201023063309.3472987-1-hch@lst.de> <20201103094643.GA18936@lst.de> <20201104140438.GA16892@char.us.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104140438.GA16892@char.us.oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Nov 04, 2020 at 09:04:38AM -0500, Konrad Rzeszutek Wilk wrote:
> On Tue, Nov 03, 2020 at 10:46:43AM +0100, Christoph Hellwig wrote:
> > ping?
> 
> Hopefully this goes through. I am in the process of testing it but ran
> into testing issues that I believe are unrelated.

Did you manage to make any progress?  This fixes an issue with the
new support for systems with DMA offsets in 5.10..

