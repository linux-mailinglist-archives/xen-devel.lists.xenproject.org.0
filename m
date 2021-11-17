Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 658824545A7
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 12:27:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226776.392016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJ5z-0006Xk-Jr; Wed, 17 Nov 2021 11:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226776.392016; Wed, 17 Nov 2021 11:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJ5z-0006Ug-Cz; Wed, 17 Nov 2021 11:27:19 +0000
Received: by outflank-mailman (input) for mailman id 226776;
 Wed, 17 Nov 2021 11:27:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnJ5y-0006Ua-8j
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:27:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnJ5y-0006un-65
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:27:18 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnJ5y-0002JU-5B
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:27:18 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mnJ5u-0005DZ-Fs; Wed, 17 Nov 2021 11:27:14 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=YhFVBscsLtPAF/Ls0uW4TIPGjmxcUUUOUvNDO7Az+PE=; b=oCAKWhIQt1mn/em61lf+PQVACG
	0K8bNsIfEqLPPP+C0LJTGpaFNA0KX2xQTt0viOBNBlHx8SJvypTX/BGAd6zyQPkGSiQlYIN+wP88r
	Gi+bNgVIDTMfmBHf5BcAJo4KzG4qRHBV1tPmeOJ7mKY+A6+E7XRVf2ut4rbVLbwvk1ao=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24980.59153.643830.74053@mariner.uk.xensource.com>
Date: Wed, 17 Nov 2021 11:27:13 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.16 0/2] CHANGELOG: start to populate entries for 4.16
In-Reply-To: <20211117095338.14947-1-roger.pau@citrix.com>
References: <20211117095338.14947-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.16 0/2] CHANGELOG: start to populate entries for 4.16"):
> The following changes are preparation work for the 4.16 release. This
> is my first pass at the log for the release, it's likely missing more
> entries.
> 
> I'm Ccing all maintainers in this cover letter and also in patch #2 for
> further feedback on missing items.

Thanks!  Dropped the CC list for this mail:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

for both patches (including future versions).

Ian.

