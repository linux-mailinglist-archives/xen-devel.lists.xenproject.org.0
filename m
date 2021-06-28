Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68BD3B5F58
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 15:48:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147882.273011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxrcQ-0007bW-VB; Mon, 28 Jun 2021 13:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147882.273011; Mon, 28 Jun 2021 13:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxrcQ-0007ZW-Rh; Mon, 28 Jun 2021 13:48:10 +0000
Received: by outflank-mailman (input) for mailman id 147882;
 Mon, 28 Jun 2021 13:48:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lxrcO-0007ZQ-Ry
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 13:48:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lxrcO-00024i-Oy
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 13:48:08 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lxrcO-00044F-Ng
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 13:48:08 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lxrcL-0001V7-DR; Mon, 28 Jun 2021 14:48:05 +0100
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
	bh=yaVmPCXqZy3Cc00aVR0hqcQKO8JE4koDvEWPy5xLXKk=; b=X816NyEXyQkHQS+GWV2VjZHKeP
	57OjmS1W5OpwZS8GswiIqh6JSkrPRtEFG7Ph7Rgddjywd41FjDBgMLNtYGNYMJzal08nzV/0JJacr
	C0alRiv074DaXbde/SR6Gw3wAX1s9jQPDinRBgrLw3/wUje6r6SUjAg41O7DMnNoxVNo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24793.54037.159770.159505@mariner.uk.xensource.com>
Date: Mon, 28 Jun 2021 14:48:05 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] Config.mk: re-pin OVMF changeset and unpin qemu-xen
In-Reply-To: <20210628134217.47622-1-anthony.perard@citrix.com>
References: <20210628134217.47622-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Anthony PERARD writes ("[XEN PATCH] Config.mk: re-pin OVMF changeset and unpin qemu-xen"):
> qemu-xen tree have a osstest gate and doesn't need to be pinned.
> 
> On the other hand, OVMF's xen repository doesn't have a gate and needs
> to be pinned. The "master" branch correspond now to the tag
> "edk2-stable202105", so pin to that commit.
> 
> Fixes: a04509d34d72 ("Branching: Update version files etc. for newly unstable")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Ian Jackson <iwj@xenproject.org>

Looks like I adjusted the wrong line in a04509d34d72.  Sorry.

Ian.

