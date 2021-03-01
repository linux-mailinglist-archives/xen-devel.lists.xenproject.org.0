Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 596CB328358
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 17:17:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91777.173145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGlDy-0000qk-Fx; Mon, 01 Mar 2021 16:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91777.173145; Mon, 01 Mar 2021 16:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGlDy-0000qJ-CT; Mon, 01 Mar 2021 16:16:46 +0000
Received: by outflank-mailman (input) for mailman id 91777;
 Mon, 01 Mar 2021 16:16:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGlDw-0000q6-NP
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:16:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGlDw-0003pZ-Lq
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:16:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGlDw-0001zk-KY
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 16:16:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGlDt-0004p6-AM; Mon, 01 Mar 2021 16:16:41 +0000
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
	bh=WSrPqNTjWrbEMz+d1CfOT5/3mHfcOqB+xu01MU7CfFM=; b=5jG761t9swKf3kgFPcDhUuilmX
	F5KEBMIj3HHbq5kX9rhsaHMhkd/g1GG3Jhn+xaHCyh0HE6dvh5pORTmMJciLXTJ5S4/oMhfTmmCfc
	WMKUD03T+Fo3AQuXJ4GACYmdLM0ba+dsfem4CTeQjExq8eQaw8b9YvflbO1KSrcJrkuA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24637.4969.80009.849868@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 16:16:41 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <JBeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/3] tools/hvmloader: Drop machelf include as well
In-Reply-To: <20210225203010.11378-2-andrew.cooper3@citrix.com>
References: <20210225203010.11378-1-andrew.cooper3@citrix.com>
	<20210225203010.11378-2-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 1/3] tools/hvmloader: Drop machelf include as well"):
> The logic behind switching to elfstructs applies to sun builds as well.
> 
> Fixes: 81b2b328a2 ("hvmloader: use Xen private header for elf structs")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I would have preferred this patch to come after the one that is
actually justified for 4.15, so that it could be held off to after
4.15.  After all I see no substantive reason why this should get a
freeze exception.

However, it looks fine based on code review and I don't want to add
risk by asking you to transpose the two patches, so:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Ian.

