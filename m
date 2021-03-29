Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F97934D5AD
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 19:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103203.196929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQvKR-0004qw-Fe; Mon, 29 Mar 2021 17:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103203.196929; Mon, 29 Mar 2021 17:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQvKR-0004qZ-CL; Mon, 29 Mar 2021 17:05:27 +0000
Received: by outflank-mailman (input) for mailman id 103203;
 Mon, 29 Mar 2021 17:05:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lQvKQ-0004qT-0N
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 17:05:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lQvKP-0001xb-Un
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 17:05:25 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lQvKP-000689-TC
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 17:05:25 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lQvKL-0002Hx-8x; Mon, 29 Mar 2021 18:05:21 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:CC:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=GgG3+Ks6Vmz+LcEfKplO16OsuXqMnsANClzwh3J1DM4=; b=CtoqbgRaayWRSZo0vCors6kY9l
	rqzRqDhTkXILz9zk9G93KASJ078jPLISI8Hn7Wmd+F0F9+GyxmN5m5b3bZ/rRSuo/Pmjkyw9Mrwa7
	FYF82dTVHwPe5ZgOQb9aZcknTLzb0GF5SRVQits5a1XPC7CCFI1Hdhri1jggGVAMtzWI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24674.2257.82806.365406@mariner.uk.xensource.com>
Date: Mon, 29 Mar 2021 18:05:21 +0100
To: committers@xenproject.org
CC: George Dunlap <george.dunlap@citrix.com>,
    <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 for-4.15 3/7] CHANGELOG.md: Add dom0/domU zstd compression support
In-Reply-To: <24674.2042.737729.423760@mariner.uk.xensource.com>
References: <20210329161457.345360-1-george.dunlap@citrix.com>
	<20210329161457.345360-3-george.dunlap@citrix.com>
	<24674.2042.737729.423760@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: [PATCH v2 for-4.15 3/7] CHANGELOG.md: Add dom0/domU zstd compression support"):
> George Dunlap writes ("[PATCH v2 for-4.15 3/7] CHANGELOG.md: Add dom0/domU zstd compression support"):
> > Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Actually, better idea: I hereby give a blanket release ack for
anything in CHANGELOG.md that is committed by the end of Wednesday.

Whatever isn't ready by then I will look properly at.  I expect us to
commit final docs updates early on Tuesday the 6th.  So in practice I
think that means that any input from people who are away for Easter
needs to be finalised before the Easter weekend so that George and I
can get it properly into the tree.

Thanks,
Ian.

