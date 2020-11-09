Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CB32AC31F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 19:03:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22825.49320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcBVl-0001jv-VA; Mon, 09 Nov 2020 18:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22825.49320; Mon, 09 Nov 2020 18:03:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcBVl-0001jW-RZ; Mon, 09 Nov 2020 18:03:25 +0000
Received: by outflank-mailman (input) for mailman id 22825;
 Mon, 09 Nov 2020 18:03:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yezh=EP=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kcBVk-0001jR-KF
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 18:03:24 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d25f45fb-6bde-4d35-a489-bdf4e043fe40;
 Mon, 09 Nov 2020 18:03:23 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kcBVj-0003dv-JB
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 18:03:23 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kcBVj-0000Bh-IP
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 18:03:23 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kcBVd-0006yE-9B; Mon, 09 Nov 2020 18:03:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=yezh=EP=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
	id 1kcBVk-0001jR-KF
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 18:03:24 +0000
X-Inumbo-ID: d25f45fb-6bde-4d35-a489-bdf4e043fe40
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d25f45fb-6bde-4d35-a489-bdf4e043fe40;
	Mon, 09 Nov 2020 18:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=VFQkw8XPMUDgit2Y0G+rDzVc4Kx4UWsCyEr4ryH0CVA=; b=elGjwDSaNWe/uacG0JNvwPm5J9
	VreVSueqZfo8ZJs2l0uiMuun1Q30Fu3zrM2pd9c5geX/DgoVE9PgBcEWF3E/LEekcO3AnkFI2PFYj
	SVtRF3aKjuideiBCmXVkT75i0qubXrpnKHz0LWZrPty4oqODbEKIxIrGKdLGvnl7+U6g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kcBVj-0003dv-JB
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 18:03:23 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kcBVj-0000Bh-IP
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 18:03:23 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
	(envelope-from <iwj@xenproject.org>)
	id 1kcBVd-0006yE-9B; Mon, 09 Nov 2020 18:03:17 +0000
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24489.33893.98470.334969@mariner.uk.xensource.com>
Date: Mon, 9 Nov 2020 18:03:17 +0000
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Julien Grall <julien@xen.org>,
    Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Bertrand Marquis <bertrand.marquis@arm.com>,
    ba1020@protonmail.ch
Subject: Re: Tools backport request for Xen 4.14
In-Reply-To: <20201009184930.GA65219@mattapan.m5p.com>
References: <54fcf6ea-f400-c96a-cde6-4f55f909c2d6@xen.org>
	<20201009184930.GA65219@mattapan.m5p.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Elliott Mitchell writes ("Re: Tools backport request for Xen 4.14"):
> On Fri, Oct 09, 2020 at 06:47:22PM +0100, Julien Grall wrote:
> > Would it be possible to consider backporting to 4.14 the following tools 
> > commit:
> > 
> > d25cc3ec93eb "libxl: workaround gcc 10.2 maybe-uninitialized warning"
> > 
> > This would help to build Xen tools on Debian Testing with GCC 10. I 
> > haven't build itself myself, so I can't promise this is only one :).
> 
> >From Debian's repository:
> https://salsa.debian.org/xen-team/debian-xen.git
> 
> The master and knorrie/4.14 branches include that commit.  They will
> hopefully soon include all the Debian-specific bits for cross-building
> too.

I have now backported all of the GCC10 fixes to all the supported Xen
branches (ie back to 4.12).  Upstream staging-* now builds on Debian
sid, for me.  Sorry for not getting to this earlier.

Ian.

