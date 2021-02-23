Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81958322F52
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 18:05:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88996.167398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEb6y-00045O-Si; Tue, 23 Feb 2021 17:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88996.167398; Tue, 23 Feb 2021 17:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEb6y-00044z-P8; Tue, 23 Feb 2021 17:04:36 +0000
Received: by outflank-mailman (input) for mailman id 88996;
 Tue, 23 Feb 2021 17:04:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEb6x-00044o-L1
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 17:04:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEb6x-0007kb-IM
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 17:04:35 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEb6x-000551-HO
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 17:04:35 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lEb6t-0004Su-UR; Tue, 23 Feb 2021 17:04:32 +0000
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
	bh=NgX2UxQvb9zaMK85kD3n/hDVPGirJsk/0wKJ9pvrzZM=; b=3L4FphfemeMZsDRUdP80kp3glP
	HvbuCPx9RZtQXzh/LLWm3nEPnaVtX27FR81XSzI/9Z5yAnRpE97wIcG7OsuiiYklnjpuqjqsHgb0R
	pS8FABdnv9u2NV+Ru4gbvBONIKVPc/rp1pni/ka9VqBUWhR6iMTSqdiDeNBTVAkuOz5E=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24629.13727.682287.671087@mariner.uk.xensource.com>
Date: Tue, 23 Feb 2021 17:04:31 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15] cirrus-ci: introduce some basic FreeBSD testing
In-Reply-To: <20210223155353.77191-1-roger.pau@citrix.com>
References: <20210223155353.77191-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.15] cirrus-ci: introduce some basic FreeBSD testing"):
> Cirrus-CI supports FreeBSD natively, so introduce some build tests on
> FreeBSD.
> 
> The Cirrus-CI requires a Github repository in order to trigger the
> tests.
> 
> A sample run output can be seen at:
> 
> https://github.com/royger/xen/runs/1962451343
> 
> Note the FreeBSD 11 task fails to build QEMU and is not part of this
> patch.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

