Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C573286E6
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:19:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91822.173283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmCC-0007ng-Py; Mon, 01 Mar 2021 17:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91822.173283; Mon, 01 Mar 2021 17:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmCC-0007n8-MY; Mon, 01 Mar 2021 17:19:00 +0000
Received: by outflank-mailman (input) for mailman id 91822;
 Mon, 01 Mar 2021 17:18:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmCB-0007mx-Ka
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:18:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmCB-0004vc-J2
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:18:59 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmCB-0002iw-IE
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:18:59 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGmC8-0004yo-E3; Mon, 01 Mar 2021 17:18:56 +0000
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
	bh=9cKCkrTetJ5mUuJj4qq8jrrlq+cBEBhidajVNs72y/M=; b=IzSF4rnWE0DkYhlajaciqhROua
	dUQQy/lY+BY5pCMBaoNsqJ50HlvDXf7Si0pq+0HXEevmI3Oo9oszgUW9snv/CgJ04Q4H8MDavIacA
	cd+98OJ9qUUxi1geZ8A67hvFFI5fgKO5MQu51sH51xTDQ71uRerogkSZMqFdglHwgNlQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24637.8704.214350.199547@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 17:18:56 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/3] tools/libs: Stash the 4.14 API/ABIs for the stable libraries
In-Reply-To: <20210301170044.23295-3-andrew.cooper3@citrix.com>
References: <20210301170044.23295-1-andrew.cooper3@citrix.com>
	<20210301170044.23295-3-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 2/3] tools/libs: Stash the 4.14 API/ABIs for the stable libraries"):
> These dumps were produced from the RELEASE-4.14.0 tag, with the abi-dumper
> tooling backported from staging.
> 
> For each stable library, add a PKG_OLD_ABI variable pointing at the 4.14 ABI.
> 
> No functional change.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

I would like a nother set of eyes to look at this, so Wei, I would
appreciate if you would do the maintainer review.

Thanks,
Ian.

