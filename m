Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE046344674
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 15:02:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100220.190816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOL86-0004XL-GK; Mon, 22 Mar 2021 14:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100220.190816; Mon, 22 Mar 2021 14:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOL86-0004Ww-Co; Mon, 22 Mar 2021 14:02:02 +0000
Received: by outflank-mailman (input) for mailman id 100220;
 Mon, 22 Mar 2021 14:02:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOL85-0004Wr-5M
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 14:02:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOL85-0004jm-03
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 14:02:01 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lOL84-00009y-T7
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 14:02:00 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lOL81-00005i-JT; Mon, 22 Mar 2021 14:01:57 +0000
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
	bh=F4qLdFWFXRUl3b12FAWiWDbU8JykQhAnHQLSabiETLA=; b=u7CNK8pm6/SdJ3j5bRwfAQZs/l
	VEnOgJOkRPjbEjjmdMFvtIsnuuCcsIvSS9LNT2vlAZCSUmdZulSETMo5o8GlbrmA8m/vX8gasmKHq
	qtE2zx2pGl45Yfu8HFg6ptescYuI2Tn3AlfbABrTnlda/KBnchwUehnh1tUBxLe98a2I=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24664.41813.347129.390771@mariner.uk.xensource.com>
Date: Mon, 22 Mar 2021 14:01:57 +0000
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen: Create EFI_VENDOR directory
In-Reply-To: <20210322133301.11308-1-jandryuk@gmail.com>
References: <20210322133301.11308-1-jandryuk@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jason Andryuk writes ("[PATCH] xen: Create EFI_VENDOR directory"):
> make install-xen fails when EFI_VENDOR is set (=fedora) with:
> install: cannot create regular file '/home/user/xen/dist/install/boot/efi/efi/fedora/xen-4.15.0-rc.efi': No such file or directory
> 
> Create the EFI_VENDOR directory so xen.efi can be installed within.
> 
> This removes the need for Fedora and Qubes xen.spec files to manually
> create the directory in advance.

I reviewed this.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Presuming someone else also reviews it.  Andy, was your Acked-by a
Reviewed-by ?

Ian.

