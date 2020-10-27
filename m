Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B91829A5F7
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 08:59:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12668.32919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXJse-00024l-I8; Tue, 27 Oct 2020 07:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12668.32919; Tue, 27 Oct 2020 07:58:56 +0000
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
	id 1kXJse-00024M-EI; Tue, 27 Oct 2020 07:58:56 +0000
Received: by outflank-mailman (input) for mailman id 12668;
 Tue, 27 Oct 2020 07:58:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCir=EC=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kXJsc-00024H-Sx
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 07:58:54 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f4eff0c-fda4-4723-a3cd-d46d127a364c;
 Tue, 27 Oct 2020 07:58:53 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 463BD67373; Tue, 27 Oct 2020 08:58:51 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=XCir=EC=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kXJsc-00024H-Sx
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 07:58:54 +0000
X-Inumbo-ID: 7f4eff0c-fda4-4723-a3cd-d46d127a364c
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7f4eff0c-fda4-4723-a3cd-d46d127a364c;
	Tue, 27 Oct 2020 07:58:53 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 463BD67373; Tue, 27 Oct 2020 08:58:51 +0100 (CET)
Date: Tue, 27 Oct 2020 08:58:51 +0100
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, konrad.wilk@oracle.com, hch@lst.de
Subject: Re: [PATCH] fix swiotlb panic on Xen
Message-ID: <20201027075851.GD22487@lst.de>
References: <alpine.DEB.2.21.2010261653320.12247@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2010261653320.12247@sstabellini-ThinkPad-T480s>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good for now:

Reviewed-by: Christoph Hellwig <hch@lst.de>

But we really need to clean up the mess with all these magic variables
eventually.

