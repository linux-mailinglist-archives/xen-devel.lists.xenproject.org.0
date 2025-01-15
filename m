Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA63A126D4
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 16:05:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872696.1283676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY4xP-0004Dy-Nt; Wed, 15 Jan 2025 15:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872696.1283676; Wed, 15 Jan 2025 15:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY4xP-0004C8-Kf; Wed, 15 Jan 2025 15:05:23 +0000
Received: by outflank-mailman (input) for mailman id 872696;
 Wed, 15 Jan 2025 15:05:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1tY4xO-0004C0-Ky
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 15:05:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tY4xJ-0062aL-2b;
 Wed, 15 Jan 2025 15:05:18 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tY4xJ-006ZVK-2c;
 Wed, 15 Jan 2025 15:05:18 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=vxU56dDafaB9f7pGV0rRAG3uArAQoTOK3XVg8j78Nzs=; b=gIq/iJCEBw/Q62KhDndJkJzity
	ocqigIsgafSERWlqfs3VlIoxEp1iCTeQxAZbArfTmdaAwsHn41oFLPWgfwvK8YHOuDwkmNAWNhv9U
	Zb1ufdLlIqImcPzruD+H68ukvObpRRaQ1jppHW+BYwZSw4c5pl15xn6W9J1kX2sEE18Y=;
Date: Wed, 15 Jan 2025 16:05:14 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Roger Pau Monne <roger.pau@citrix.com>, qemu-devel@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org
Subject: Re: [PATCH 4/4] hw/xen: Use xs_node_read() from xenstore_read_str()
 instead of open-coding it
Message-ID: <Z4fOqgffMsQ4xR-B@l14>
References: <fc9b22c55eaaa79a3ef9829c270bc4b4e93be7a0.camel@infradead.org>
 <20250110100326.527101-1-dwmw2@infradead.org>
 <20250110100326.527101-4-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110100326.527101-4-dwmw2@infradead.org>

On Fri, Jan 10, 2025 at 10:03:26AM +0000, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

