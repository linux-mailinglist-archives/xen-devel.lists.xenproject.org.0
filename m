Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C29A89810
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 11:33:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952349.1347825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4cff-0007I2-Em; Tue, 15 Apr 2025 09:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952349.1347825; Tue, 15 Apr 2025 09:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4cff-0007GJ-Bk; Tue, 15 Apr 2025 09:33:35 +0000
Received: by outflank-mailman (input) for mailman id 952349;
 Tue, 15 Apr 2025 09:33:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1u4cfe-0007G8-9B
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 09:33:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u4cfd-00GvyC-2k;
 Tue, 15 Apr 2025 09:33:33 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1u4cfd-001cP8-15;
 Tue, 15 Apr 2025 09:33:33 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=7hehi1Eoc3aDwo8LczDZjj9RIm3LPB6mehqNwGGqHRA=; b=4/AQ+aqMmOd5SCkd8Zf83kP0kY
	MLhdvslq2BuT7pnYSTfG7ZU6sDi1BHz6jP7brUvnawDvmFRA5+UQx/JHk9tdiJsovTBJeRmYcgwII
	+rJ/f1Oksn/JP01urMfxh1LBYTfyT0fXdmu5KeNrK2ysTeVLO3xo5S4Ed4Bn+nCS8eb4=;
Date: Tue, 15 Apr 2025 11:33:31 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [XEN PATCH] tools/tests: Fix newly introduced Makefile
Message-ID: <Z_4n62dJ6qNhI5bD@l14>
References: <20250414141714.10166-1-anthony@xenproject.org>
 <Z_4cLBroEtnmD3sD@macbook.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_4cLBroEtnmD3sD@macbook.lan>

On Tue, Apr 15, 2025 at 10:43:24AM +0200, Roger Pau Monné wrote:
> On Mon, Apr 14, 2025 at 04:17:14PM +0200, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@vates.tech>
> > +
> > +-include $(DEPS_INCLUDE)
> 
> This include is likely also needed by vpci/Makefile?

No, because we don't build any object there, and build the binary
directly from source, for some reason. So there's no deps files been
generated.

Cheers,

-- 
Anthony PERARD

