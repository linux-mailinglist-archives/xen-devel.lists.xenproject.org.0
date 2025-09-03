Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06960B42637
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 18:06:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108715.1458770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utpzr-0006fw-3k; Wed, 03 Sep 2025 16:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108715.1458770; Wed, 03 Sep 2025 16:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utpzr-0006eC-0x; Wed, 03 Sep 2025 16:06:07 +0000
Received: by outflank-mailman (input) for mailman id 1108715;
 Wed, 03 Sep 2025 16:06:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1utpzp-0006e4-Ii
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 16:06:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1utpzk-004fAB-3A;
 Wed, 03 Sep 2025 16:06:01 +0000
Received: from [2a01:cb15:80df:da00:7079:39df:8b4d:ea79] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1utpzk-00EXCz-2l;
 Wed, 03 Sep 2025 16:06:01 +0000
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
	bh=QBURlunJTq1qQGHrqwTGQ18AUOR39bZplNHJB3yn0to=; b=zp8YMSugmQVlJRMHC8e3hK0b1z
	tZW6E5vbZnb2Typxm5FEvqYbjZ0WTKqqrHziNtC4hOTZWa2gXQloK17MEoTMEZAor6imK3jiDNNmQ
	6faSHtIqhN6er5r+FMzZKPH6RiqS0KiO7azj8zVv2JczodPRKxYySK9xuFcxxtDSxYb0=;
Date: Wed, 3 Sep 2025 18:05:59 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jahan Murudi <jahan.murudi.zg@renesas.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v4 0/4]  xentop: add physical CPU usage support
Message-ID: <aLhnZ1AsqZoM8nPd@l14>
References: <20250903102323.2553142-1-jahan.murudi.zg@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903102323.2553142-1-jahan.murudi.zg@renesas.com>

Hi Jahan,

On Wed, Sep 03, 2025 at 03:53:19PM +0530, Jahan Murudi wrote:
> This is v4 of the patch series to add physical CPU monitoring to xentop.
> 
> Changes since v3:
> -   Split the single large patch into a logical series of 3 smaller patches
>     for easier review.

The single patch in v3 was fine to review. It didn't really need to be
cut into several patches. Having one file change per patch is certainly
the worse possible way to cut one patch into several.

It might have been possible to separate into several patch in another
way, but it's a bit too late for that, there's already been several
reviews. What I like to do when I review a patch series, is to look at
the difference since the last review I gave, tools like
`git range-diff` and https://patchew.org/Xen/ can help with that.

Anyway, squashing back all the patch is the way to go I think.

I'll have a look at the changes.

-- 
Anthony PERARD

