Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5B1315443
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 17:48:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83332.154780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WB9-00082D-21; Tue, 09 Feb 2021 16:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83332.154780; Tue, 09 Feb 2021 16:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WB8-00081o-UK; Tue, 09 Feb 2021 16:47:54 +0000
Received: by outflank-mailman (input) for mailman id 83332;
 Tue, 09 Feb 2021 16:47:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9WB7-00081j-Kn
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 16:47:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9WB7-0002ko-J0
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 16:47:53 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9WB7-0004Ij-HQ
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 16:47:53 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l9WB4-0005t8-8b; Tue, 09 Feb 2021 16:47:50 +0000
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
	bh=ivCnS8WYD44pUoy+GhX/fzJsXHsE/y5TvjI4Kph2Kng=; b=ocVUPCQ/xyFwkpOdeEyZyu+aW6
	ivp3p8yPu3RA2Y6GZXvI1Jj9jjcJjJRfw8HtQEcFzGhVWmRu99VONrZlzbyPlzy1Mn73etczAgixF
	eB0uaaj5Cu6/Dbdyk4VjK6v7ZP7sBzwswCv5lmN+yC5wfDbMoh2KH0CJZ3cyvoA2PuvM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24610.48309.568020.376765@mariner.uk.xensource.com>
Date: Tue, 9 Feb 2021 16:47:49 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    hongyxia@amazon.co.uk,
    Julien Grall <jgrall@amazon.com>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Paul Durrant <paul@xen.org>,
    Kevin Tian <kevin.tian@intel.com>
Subject: Re: [for-4.15][PATCH v2 0/5] xen/iommu: Collection of bug fixes for IOMMU teadorwn
In-Reply-To: <20210209152816.15792-1-julien@xen.org>
References: <20210209152816.15792-1-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[for-4.15][PATCH v2 0/5] xen/iommu: Collection of bug fixes for IOMMU teadorwn"):
> From: Julien Grall <jgrall@amazon.com>
...
> This series is a collection of bug fixes for the IOMMU teardown code.
> All of them are candidate for 4.15 as they can either leak memory or
> lead to host crash/host corruption.
> 
> This is sent directly on xen-devel because all the issues were either
> introduced in 4.15 or happen in the domain creation code.

I think by current freeze rules this does not need a release-ack but
for the avoidance of doubt

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

assuming it's commited by the end of the week.

Ian.

