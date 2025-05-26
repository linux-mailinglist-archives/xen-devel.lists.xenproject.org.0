Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 113A1AC4332
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 18:57:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997636.1378459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJb8F-0007hb-9u; Mon, 26 May 2025 16:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997636.1378459; Mon, 26 May 2025 16:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJb8F-0007fy-75; Mon, 26 May 2025 16:56:59 +0000
Received: by outflank-mailman (input) for mailman id 997636;
 Mon, 26 May 2025 16:56:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uJb8D-0007fs-QJ
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 16:56:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJb8D-003RoL-1l;
 Mon, 26 May 2025 16:56:57 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uJb8D-00FC3r-26;
 Mon, 26 May 2025 16:56:57 +0000
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
	bh=NYsP6hm3oXrQG7LZgr4CxkNpnBUs3ma87bQjcRHyHAk=; b=gKkqS9LPj/rD9dvRSWR+7uKo5v
	B5NsNGV32eVKHnk1IzXehNaT1bMXaS/JssEcqhZveHF7T9IIkcAL7tU+d+9KQr8gt/HpmSSdU8eHc
	ohavY2KLmuAr8SaEvciO8bstwwfVTZLYAWmrOrG8aNus6TqIQ/suPrnTB61Urk0+y+cM=;
Date: Mon, 26 May 2025 18:56:55 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 2/3] tools/tests: Install tests into $(LIBEXEC)/tests
Message-ID: <aDSdVx116mXNKJr5@l14>
References: <20250520205239.203253-1-andrew.cooper3@citrix.com>
 <20250520205239.203253-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520205239.203253-3-andrew.cooper3@citrix.com>

On Tue, May 20, 2025 at 09:52:38PM +0100, Andrew Cooper wrote:
> $(LIBEXEC_BIN) is a dumping ground of many things.  Separate the "clearly
> tests" from everything else so we can clean up how they're run in CI.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

