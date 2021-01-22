Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2520E300531
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 15:22:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72797.131136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2xK3-0002LX-LZ; Fri, 22 Jan 2021 14:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72797.131136; Fri, 22 Jan 2021 14:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2xK3-0002L8-IO; Fri, 22 Jan 2021 14:21:59 +0000
Received: by outflank-mailman (input) for mailman id 72797;
 Fri, 22 Jan 2021 14:21:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2xK2-0002L3-98
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 14:21:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2xK2-0000n9-13
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 14:21:58 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2xK1-0002Pa-Vc
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 14:21:57 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2xJy-0003vl-QG; Fri, 22 Jan 2021 14:21:54 +0000
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
	bh=IBNNe9flacH45TJnMx7U80TNdaE+ZMUgqtureQLSICE=; b=iPs6ipG4tK6NBejYSWT1ihYgFi
	qC+s7OMvhBspLoGa/03llqTnL8e7B+LTHjFvzS/Ol3S4c8QUxYAcABQYIXUfRMOoxYuvB5RqrP1CX
	wA06F3j0TVt35EgxbqK1DyloqRz5oyJS4EPVjPiQUpWVAvGuPaUDdwMT+TKdZVBwBdHg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24586.57218.549069.725751@mariner.uk.xensource.com>
Date: Fri, 22 Jan 2021 14:21:54 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Nick Rosbrook <rosbrookn@ainfosec.com>,
    George Dunlap <george.dunlap@eu.citrix.com>
Subject: Re: [PATCH] golang/xenlight: Refresh generated helpers are recent libxl changes
In-Reply-To: <20210122131801.32457-1-andrew.cooper3@citrix.com>
References: <20210122131801.32457-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH] golang/xenlight: Refresh generated helpers are recent libxl changes"):
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Can you please resend with something along these lines in the commit
message:

  Results of running
     <rune>

  No manual changes.

In which case, assuming that's true,

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thanks,
Ian.

