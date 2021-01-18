Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 069A12FA5A8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 17:10:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69851.125159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1X65-0008G7-UY; Mon, 18 Jan 2021 16:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69851.125159; Mon, 18 Jan 2021 16:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1X65-0008Fi-RQ; Mon, 18 Jan 2021 16:09:41 +0000
Received: by outflank-mailman (input) for mailman id 69851;
 Mon, 18 Jan 2021 16:09:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l1X64-0008Fc-6f
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 16:09:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l1X64-0005Pe-4Y
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 16:09:40 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l1X64-0005kt-3i
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 16:09:40 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l1X60-0007Dv-Sk; Mon, 18 Jan 2021 16:09:36 +0000
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
	bh=2IJozqopboH2clh74nfj43ewfR+hj7BaOkVIwaPl53s=; b=zM9IWNnpkNTqS4qScw2oH2HU8A
	6AJkc4we/7/KSNBaBIHIVUd9d1rNLz2B9KiAoXhsD84ojvkOIBt1rPS7qT0idD2Qhbp5GVaauZ2xc
	WVkQH9Mc9c2UOq/bNkrdEo3JdP9eNk5kdHF08o4FrVuaZfuoAHTn9/xT8Jx5SIbi9pnI=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24581.45760.653861.613333@mariner.uk.xensource.com>
Date: Mon, 18 Jan 2021 16:09:36 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/decompress: make helper symbols static
In-Reply-To: <28f15465-bfcd-606b-eb24-42bfb990ae3d@suse.com>
References: <28f15465-bfcd-606b-eb24-42bfb990ae3d@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH] xen/decompress: make helper symbols static"):
> The individual decompression CUs need to only surface their top level
> functions to other code. Arrange for everything else to be static, to
> make sure no undue uses of that code exist or will appear without
> explicitly noticing. (In some cases this also results in code size
> reduction, but since this is all init-only code this probably doesn't
> matter very much.)
> 
> In the LZO case also take the opportunity and convert u8 where lines
> get touched anyway.

AFAICT, this patch

* was first posted after the last posting date for Xen 4.15.
* is not a bugfix.

In which case it has missed 4.15.

Please correct me if you think I am wrong.

Thanks,
Ian.

