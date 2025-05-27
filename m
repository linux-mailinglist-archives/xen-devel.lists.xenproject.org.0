Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349DBAC501B
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 15:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998451.1379176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJuZ9-000899-B7; Tue, 27 May 2025 13:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998451.1379176; Tue, 27 May 2025 13:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJuZ9-00087i-7s; Tue, 27 May 2025 13:42:03 +0000
Received: by outflank-mailman (input) for mailman id 998451;
 Tue, 27 May 2025 13:42:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uJuZ8-00087c-3q
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 13:42:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJuZ7-0053Lp-2i;
 Tue, 27 May 2025 13:42:01 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJuZ8-00A3a2-03;
 Tue, 27 May 2025 13:42:01 +0000
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
	bh=3jcIE3AZCA5b2l0xa8fnUJSl81DISlLs88JjwIVQqD4=; b=JzjaTRy3XVZFa/+5Nin9bS0M70
	yJfktD/zdDy3LDFJ/RcTKTGWGUKdUwx1eaAo+4ntJ9HQHoR9pLtmuiK609w5HTncEllX6uFToZFSk
	NNa+8CPDVlVc3CzP5eLyF79U+4PG4LlBI2ukS5snsKeyzILetLDPhD8I5eUxiv6v+vBQ=;
Date: Tue, 27 May 2025 15:41:59 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 1/3] CI/qubes: Deduplicate the handling of ${dom0_check}
Message-ID: <aDXBJ6ASFOl2Ndhp@l14>
References: <20250522173640.575452-1-andrew.cooper3@citrix.com>
 <20250522173640.575452-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522173640.575452-2-andrew.cooper3@citrix.com>

On Thu, May 22, 2025 at 06:36:38PM +0100, Andrew Cooper wrote:
> Make it clear that ${dom0_check} is unconditional.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

