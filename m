Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED87E37F2D8
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 08:12:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126491.238141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh4Yy-0001wc-EH; Thu, 13 May 2021 06:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126491.238141; Thu, 13 May 2021 06:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh4Yy-0001uk-BA; Thu, 13 May 2021 06:11:12 +0000
Received: by outflank-mailman (input) for mailman id 126491;
 Thu, 13 May 2021 06:11:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Mxh=KI=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lh4Yx-0001tD-Lz
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 06:11:11 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ecd145f-da3d-4098-ba6e-29d43bf18a90;
 Thu, 13 May 2021 06:11:10 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id BED7D67373; Thu, 13 May 2021 08:11:08 +0200 (CEST)
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
X-Inumbo-ID: 4ecd145f-da3d-4098-ba6e-29d43bf18a90
Date: Thu, 13 May 2021 08:11:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
	jgross@suse.com, hch@lst.de,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2 3/3] xen/swiotlb: check if the swiotlb has already
 been initialized
Message-ID: <20210513061108.GB26335@lst.de>
References: <alpine.DEB.2.21.2105121313060.5018@sstabellini-ThinkPad-T480s> <20210512201823.1963-3-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210512201823.1963-3-sstabellini@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

