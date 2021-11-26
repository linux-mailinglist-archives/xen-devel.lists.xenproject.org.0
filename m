Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0092045EE4F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 13:53:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232736.403572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaip-0001TS-F9; Fri, 26 Nov 2021 12:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232736.403572; Fri, 26 Nov 2021 12:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaip-0001Qm-Ad; Fri, 26 Nov 2021 12:52:59 +0000
Received: by outflank-mailman (input) for mailman id 232736;
 Fri, 26 Nov 2021 12:52:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mqaio-0001QT-61
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 12:52:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mqaio-0007QW-4a
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 12:52:58 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mqaio-0000zf-3w
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 12:52:58 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mqaid-0002h4-54; Fri, 26 Nov 2021 12:52:47 +0000
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
	bh=RqM/9ScO8rVmTAdmCy1NUpnvL9qxmcdabTpHgOpAl/8=; b=1X8/SkDu+qvIz75LLOQxkLl8Cu
	jW4lKh8jodMKCz14bz+28BLZthIDlkEFW1YGCwkH2iGiqWrXgn+K7BwiYj57BoW3iLjjYPMczboyd
	kTSfwL5fG6WZ886by595eY61uEq6U0YEb6n5nWkX9rjQ5JYYUmoxBhhk7ru63Aj8jQR4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24992.55453.893877.246946@mariner.uk.xensource.com>
Date: Fri, 26 Nov 2021 12:52:45 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
In-Reply-To: <bef5ff51-475a-e8c4-83fc-950df4516399@suse.com>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
	<0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
	<a36df6b5-9f55-a199-e8d3-3f6cd58a054d@xen.org>
	<b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
	<0c0e67f3-5e0a-f047-ca09-1cf078e6b094@suse.com>
	<71ef250c-be92-2b2f-0f07-ce32c17d8050@xen.org>
	<ceec5b56-65fc-8bb4-b9e0-1e16aea8c412@suse.com>
	<c2d312c2-c413-4e07-1c0c-8652cab40784@xen.org>
	<0b808ce0-23a2-65ae-dfb3-b167d5565b31@suse.com>
	<6bcd1555-ee0d-dd6d-55ca-0ca0e64c3623@xen.org>
	<bef5ff51-475a-e8c4-83fc-950df4516399@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH 1/7] xz: add fall-through comments to a switch statement"):
> On 26.11.2021 11:04, Julien Grall wrote:
> > For this case, you provided some sort of an explanation but so far, I am 
> > still waiting for a link to confirm that the signed-off-by match the one 
> > on the ML.
> 
> I haven't been able to easily find a mail archive holding this patch.

I 100% agree with Julien on all points in this thread.

Please can we keep the Linux S-o-b.

Note that S-o-b is not a chain of *approval* (whose relevance to us is
debateable) but but a chain of *custody and transmission* for
copyright/licence/gdpr purposes.  That latter chain is hightly
relevant to us.

All such S-o-b should be retained.

Of course if you got the patch somewhere other than the Linux commit,
then the chain of custody doesn't pass through the Linux commit.  But
in that case I expect you to be able to say where you got it.

Instead, I suggest that, having established what the Linux commit is,
it is far simpler for us all to regard the Linux commit as our
immediate source for the patch, rather than some ML post which you are
not, apparently, able to find.

Ian.

