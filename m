Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3C44545C0
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 12:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226782.392025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJG4-00082A-JZ; Wed, 17 Nov 2021 11:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226782.392025; Wed, 17 Nov 2021 11:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJG4-0007zb-GD; Wed, 17 Nov 2021 11:37:44 +0000
Received: by outflank-mailman (input) for mailman id 226782;
 Wed, 17 Nov 2021 11:37:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnJG3-0007zV-GD
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:37:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnJG3-0007J0-Ct
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:37:43 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mnJG3-0002uo-Bw
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:37:43 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mnJFw-0005FW-Je; Wed, 17 Nov 2021 11:37:36 +0000
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
	bh=lJQksZ65pv1TCUVk3MFtBpRg8bbHdgrfLeHqxA5jeiA=; b=y8kp2nR/dlb3qeth4Jvy3Mkh3o
	zZErhKbEn8NocTVEdu9NBO91FJS2huDWvPrR92WaOS3Ex5xt2uPSBQF0+sYLUSUkIivyqc0X4J9NP
	ZLZm9RdcsZ+1mudoQQP+fG5RcmbYQxg23GjDG/T3uz5PLDfbRnacLGCIqxq6od24cu+U=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24980.59775.757513.572454@mariner.uk.xensource.com>
Date: Wed, 17 Nov 2021 11:37:35 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
    Community Manager <community.manager@xenproject.org>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.16 1/2] CHANGELOG: set Xen 4.15 release date
In-Reply-To: <0994aad7-0e2b-a78c-5b23-422c93dea353@suse.com>
References: <20211117095338.14947-1-roger.pau@citrix.com>
	<20211117095338.14947-2-roger.pau@citrix.com>
	<0994aad7-0e2b-a78c-5b23-422c93dea353@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH for-4.16 1/2] CHANGELOG: set Xen 4.15 release date"):
> I'm puzzled how we managed to have missed that.

Manual faff and eyes glazing over I think...

> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -22,7 +22,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >     no longer be built per default. In order to be able to use those, configure needs to
> >     be called with "--enable-qemu-traditional" as parameter.
> >  
> > -## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
> > +## [4.15.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - 2021-04-08
> 
> One day off is not really a problem, but I wonder how you ended up with the
> 8th. The tag was made on the 7th, and the commit that was tagged had been
> made on the 6th.

The announcement was made on the 8th.  The release deliverables are
generally prepped the day before the formal release.

Ian.

