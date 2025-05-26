Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED941AC431E
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 18:42:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997618.1378439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJauD-0005Wp-W0; Mon, 26 May 2025 16:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997618.1378439; Mon, 26 May 2025 16:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJauD-0005U0-T1; Mon, 26 May 2025 16:42:29 +0000
Received: by outflank-mailman (input) for mailman id 997618;
 Mon, 26 May 2025 16:42:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uJauC-0005Tu-PT
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 16:42:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJauC-003RYJ-1j;
 Mon, 26 May 2025 16:42:28 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJauC-00Elf8-2F;
 Mon, 26 May 2025 16:42:28 +0000
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
	bh=VSofmng+UEEd3Pj+eqQVa0l7wxDuJSywpc8oL7TRy7Q=; b=TUDiR9Zdtnj+uYmU/kzf2l7/yO
	pcE7JEWzAmvn0Y1UfRbsw7sC+XY4gP7V0Yvp7Akqvp1OGQCIH41z1kN65iLdhijhFPUcvn3CE2K+2
	5C9LSxKlNrsosOq11TjrEGqkI8xAvlACFoYOxsLuVCC5EpWXk2OLYH3PBUevMUeIm+Dw=;
Date: Mon, 26 May 2025 18:42:26 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 1/3] tools/tests: Drop depriv-fd-checker
Message-ID: <aDSZ8r3JhYn6LtPH@l14>
References: <20250520205239.203253-1-andrew.cooper3@citrix.com>
 <20250520205239.203253-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520205239.203253-2-andrew.cooper3@citrix.com>

On Tue, May 20, 2025 at 09:52:37PM +0100, Andrew Cooper wrote:
> Unlike the other tests, this is not standalone.  It requires poking at a live
> system, making it unweildly to use.
> 
> It hasn't been touched in 7 years, despite changes in libraries and kernel
> devices using the deprivilege infrastructure.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

