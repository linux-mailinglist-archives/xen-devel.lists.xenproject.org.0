Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F65D33B20F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 13:05:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97979.185779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLlye-00047r-5j; Mon, 15 Mar 2021 12:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97979.185779; Mon, 15 Mar 2021 12:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLlye-00047U-2X; Mon, 15 Mar 2021 12:05:40 +0000
Received: by outflank-mailman (input) for mailman id 97979;
 Mon, 15 Mar 2021 12:05:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lLlyc-00047D-9F
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 12:05:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lLlyc-0007Ox-6w
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 12:05:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lLlyc-000675-6E
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 12:05:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lLlyZ-0004n2-38; Mon, 15 Mar 2021 12:05:35 +0000
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
	bh=EMxp4uZHJsd13v/nRw6ih9u5bji4EkS68qoT42V0L2w=; b=ot3EYrIn8q8Qvo3kHXR0ATy7ju
	Q/fYgckm/4gn5f7Ye46ikiPjs/oMebr7UWlF8Cbpv6ufkGu0iSwCywJr8w8JvyHrXR79UGZGCw9l5
	4flEd/U0dv+k+Uj2eRYho+FNTy8q7wJ8IAHivqMGpZbqHf9nxrnHMmdijP0scaLHvDbo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24655.19854.938658.909308@mariner.uk.xensource.com>
Date: Mon, 15 Mar 2021 12:05:34 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    Julien Grall <jgrall@amazon.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.15] SUPPORT.MD: Mark C XenStored LiveUpdate as Tech Preview
In-Reply-To: <20210313135500.27241-1-julien@xen.org>
References: <20210313135500.27241-1-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH for-4.15] SUPPORT.MD: Mark C XenStored LiveUpdate as Tech Preview"):
> From: Julien Grall <jgrall@amazon.com>
> 
> Support to liveupdate C XenStored was adding during the 4.15
> development cycle. Add a section in SUPPORT.MD to explain what is the
> support state.
> 
> For now, it is a tech preview.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>

