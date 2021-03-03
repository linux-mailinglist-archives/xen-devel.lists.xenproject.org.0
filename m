Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D3632B9C2
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 19:14:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92960.175384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHW0m-0004wV-1t; Wed, 03 Mar 2021 18:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92960.175384; Wed, 03 Mar 2021 18:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHW0l-0004w6-Uz; Wed, 03 Mar 2021 18:14:15 +0000
Received: by outflank-mailman (input) for mailman id 92960;
 Wed, 03 Mar 2021 18:14:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHW0k-0004w1-AV
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 18:14:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHW0k-0006BN-7u
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 18:14:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHW0k-0004b4-54
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 18:14:14 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHW0g-0002oT-N7; Wed, 03 Mar 2021 18:14:10 +0000
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
	bh=GcZD63ujFNhMiwY30q/mq8tYgYMIEZyRuz0cJJbXkIc=; b=RNb0VYqOWOC2Sc7aSiB0ckhLOm
	pt6/UJ3wohclmY7iYko7LCdg4QpRdiXmnN0pj3iptptVej0cUM4cHS4bbT6M57t67JDWZS+LUWJ8P
	Q6Wm7XKQpz95fTq3E4XFs/qJVq7HmxZvvXgSwUT3VWxuamGjk8Z4hP/aU0Qquw0VcUfE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24639.53746.413795.352879@mariner.uk.xensource.com>
Date: Wed, 3 Mar 2021 18:14:10 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    raphning@amazon.co.uk,
    Julien Grall <jgrall@amazon.com>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>,
    Bjoern Doebel <doebel@amazon.de>
Subject: Re: [PATCH for-4.15] tools/xenstored: liveupdate: Properly check long
 transaction
In-Reply-To: <2ee798da-bb57-919d-f35e-1be5aa1abcce@xen.org>
References: <20210303170526.15903-1-julien@xen.org>
	<24639.51758.530818.933444@mariner.uk.xensource.com>
	<2ee798da-bb57-919d-f35e-1be5aa1abcce@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH for-4.15] tools/xenstored: liveupdate: Properly check long transaction"):
> On 03/03/2021 17:41, Ian Jackson wrote:
> > AFAICT this only affects live updated which is not security-supported
> > in 4.15 and which won't block our tests. 
> 
> That's correct.
> 
> > So:
> > 
> > Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> Thanks!

PS, notwithstanding the above, submissions of tests for this feature
would be very welcome.

(If they turn out to block things during the release, I always have
the force push hammer.)

Ian.

