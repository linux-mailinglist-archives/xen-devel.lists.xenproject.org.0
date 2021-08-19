Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F253F1EBA
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 19:05:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168998.308679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGlTJ-0006qm-L3; Thu, 19 Aug 2021 17:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168998.308679; Thu, 19 Aug 2021 17:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGlTJ-0006oj-Hg; Thu, 19 Aug 2021 17:04:53 +0000
Received: by outflank-mailman (input) for mailman id 168998;
 Thu, 19 Aug 2021 17:04:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGlTI-0006oa-2g
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 17:04:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGlTI-0004ui-0j
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 17:04:52 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGlTH-0004xV-VO
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 17:04:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mGlTD-0002Px-9d; Thu, 19 Aug 2021 18:04:47 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=WzzGxPlZlYU8aiFDw0JadrB9Zf0ar93QLcI33/SQdts=; b=ocllz+fZLAiZMcacRzQ3MinQ+P
	dVSjf1b/6uw/DPsiRln9ElZBLUpwYqaoXQww6JZCl3kMtDhzVFsWmLca0WHrmRfozt35PIly527Bv
	ExG9zp+Zv8l0n74gsDGzMOFJmxcKCVsUHmHjLTdvu6rgnQcceah7XwyGuxSPwgSj1QXs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24862.36654.996255.14674@mariner.uk.xensource.com>
Date: Thu, 19 Aug 2021 18:04:46 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Ian Jackson <ian.jackson@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Anthony Perard <anthony.perard@citrix.com>,
    Julien Grall <julien@xen.org>
Subject: Re: preparations for 4.15.1 and 4.13.4 [and 1 more messages]
In-Reply-To: <24862.36076.875216.461840@mariner.uk.xensource.com>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com>
	<8324f959-924b-d196-149d-2fdad95da8fa@citrix.com>
	<24862.35359.95257.223452@mariner.uk.xensource.com>
	<24862.36076.875216.461840@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: preparations for 4.15.1 and 4.13.4 [and 1 more messages]"):
> I thought of a better way to do this.  See below for proposed patch to
> xen.git#staging.

We discussed this on IRC, and I'm going to drop this patch.

Ian.

18:00 <@andyhhp> I'm debating what to say there
18:01 <@Diziet> I thought of this since otherwise we're just setting ourselves 
                up to make a mistake.
18:01 <@andyhhp> I'm tempted to just leave it all alone.  That comment will go 
                 stale very quickly, and the general rule is applicable to 
                 other libs
18:01 <@Diziet> True
18:01 <@andyhhp> evidence suggests that almost all edits to the soname require 
                 a fixup...
18:01 <@Diziet> haha
18:01 <@Diziet> FE
18:01 <@andyhhp> it would be nice to do something better
18:02 <@andyhhp> and the "bump the soname proactively" is almost very nice for 
                 that.  My first thought was to suggest that we change to that 
                 as a default way of working
18:01 <@Diziet> haha
18:01 <@Diziet> FE
18:01 <@andyhhp> it would be nice to do something better
18:02 <@andyhhp> and the "bump the soname proactively" is almost very nice for 
                 that.  My first thought was to suggest that we change to that 
                 as a default way of working
18:02 <@andyhhp> but it gets you into a position where you're off-by-one when 
                 it comes to the release
18:02 <@Diziet> Mmmm
18:03 <@Diziet> OK, well, I'll drop my patch for now then if you don't feel 
                it's worth it.
18:03 <@Diziet> Thanks for the reviews, anyway.

