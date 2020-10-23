Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7966D297064
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 15:26:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10984.29158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVx59-0003p1-5c; Fri, 23 Oct 2020 13:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10984.29158; Fri, 23 Oct 2020 13:26:11 +0000
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
	id 1kVx59-0003oc-2A; Fri, 23 Oct 2020 13:26:11 +0000
Received: by outflank-mailman (input) for mailman id 10984;
 Fri, 23 Oct 2020 13:26:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuJs=D6=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kVx57-0003oW-5Z
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 13:26:09 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cd2bb22-cdc2-426f-bf66-b68664d48636;
 Fri, 23 Oct 2020 13:26:08 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kVx56-0003u5-6c
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 13:26:08 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kVx56-0005lC-4K
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 13:26:08 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kVx52-0007fs-Rs; Fri, 23 Oct 2020 14:26:04 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=UuJs=D6=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
	id 1kVx57-0003oW-5Z
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 13:26:09 +0000
X-Inumbo-ID: 1cd2bb22-cdc2-426f-bf66-b68664d48636
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1cd2bb22-cdc2-426f-bf66-b68664d48636;
	Fri, 23 Oct 2020 13:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=b9VfwqB3+vPR0wPmnXFCMvn45MMEFkbthDp1NTUn50I=; b=CLI1+68mvERSD0wwVpCkr7Ce/e
	WzMz1u3R+3rUmcuAo0l6QToEBWd2gAAGAfE19BBQcCJZc8QYZnQN8Ek6UZuo7CpkjvdMIc9vJHoWf
	gsGL0OgOyJKDcUkZiLAy7lAUY+qpgub0FNY4nRBrf0rU2XwMTGcJ91K/02zlVyWG3qMY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kVx56-0003u5-6c
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 13:26:08 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kVx56-0005lC-4K
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 13:26:08 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
	(envelope-from <iwj@xenproject.org>)
	id 1kVx52-0007fs-Rs; Fri, 23 Oct 2020 14:26:04 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24466.55788.624955.556357@mariner.uk.xensource.com>
Date: Fri, 23 Oct 2020 14:26:04 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Samuel Thibault <samuel.thibault@ens-lyon.org>,
    Christian Lindig <christian.lindig@citrix.com>,
    David Scott <dave@recoil.org>
Subject: Re: [PATCH 0/3] tools: avoid creating symbolic links during make
In-Reply-To: <20201002142214.3438-1-jgross@suse.com>
References: <20201002142214.3438-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH 0/3] tools: avoid creating symbolic links during make"):
> The rework of the Xen library build introduced creating some additional
> symbolic links during the build process.
> 
> This series is undoing that by moving all official Xen library headers
> to tools/include and by using include paths and the vpath directive
> when access to some private headers of another directory is needed.

I'm OK with these changes and inclined to give my ack and commit all
three.

I did have one observation: it is rather odd that all the
autogenerated header files are each generated by the relevant
tools/libs/foo/Makefile, but the file is in tools/include/.

This is particularly odd given that tools/include/ has a Makefile of
its own which mostly does install stuff.

Can we at least have a comment in tools/include/Makefile saying that
it is forbidden to add rules which build include files here, and
suggesting to the reader which other Makefiles to read ?

Thanks,
Ian.

