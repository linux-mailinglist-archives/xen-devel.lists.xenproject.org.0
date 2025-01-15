Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6434A126AF
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 15:59:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872677.1283655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY4rf-0001ja-0C; Wed, 15 Jan 2025 14:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872677.1283655; Wed, 15 Jan 2025 14:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY4re-0001hs-Tv; Wed, 15 Jan 2025 14:59:26 +0000
Received: by outflank-mailman (input) for mailman id 872677;
 Wed, 15 Jan 2025 14:59:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1tY4rd-0001hm-HT
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 14:59:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tY4rX-0062OJ-12;
 Wed, 15 Jan 2025 14:59:19 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1tY4rX-006YdT-14;
 Wed, 15 Jan 2025 14:59:19 +0000
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
	bh=g6ZccKN3Kv3NK06xynw/0uxO3uPMnSlSJGwP6KYqqZs=; b=2+KpnbdwkNahfVqDBjZWAm5bAx
	vyY72fWuZTi7YeGogBEkEv4ksh3u3wPc0Zmg9U9/ELiFGmdLaubhHk58xSw2/ShT0Wk6PaBu5RTeC
	7jag/X/NfGJdw0UnZB5Mjqt5kfw7xUFZEr0JHb2Yw262zmjr07zb1s2WVxikc5319Mf4=;
Date: Wed, 15 Jan 2025 15:59:17 +0100
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
Subject: Re: [PATCH 3/4] hw/xen: Use xs_node_read() from xen_netdev_get_name()
Message-ID: <Z4fNRZUwa5hTmo6q@l14>
References: <fc9b22c55eaaa79a3ef9829c270bc4b4e93be7a0.camel@infradead.org>
 <20250110100326.527101-1-dwmw2@infradead.org>
 <20250110100326.527101-3-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110100326.527101-3-dwmw2@infradead.org>

On Fri, Jan 10, 2025 at 10:03:25AM +0000, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Now that xs_node_read() can construct a node path, no need to open-code it.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

