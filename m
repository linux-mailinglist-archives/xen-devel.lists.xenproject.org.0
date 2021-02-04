Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEF630F5F2
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 16:15:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81340.150168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7gLw-0004zo-ED; Thu, 04 Feb 2021 15:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81340.150168; Thu, 04 Feb 2021 15:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7gLw-0004zP-Af; Thu, 04 Feb 2021 15:15:28 +0000
Received: by outflank-mailman (input) for mailman id 81340;
 Thu, 04 Feb 2021 15:15:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7gLu-0004zK-E1
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 15:15:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7gLu-0005Kb-DB
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 15:15:26 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7gLu-0007x9-CQ
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 15:15:26 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7gLp-0008RJ-JB; Thu, 04 Feb 2021 15:15:21 +0000
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
	bh=NlPeA61U6fKbMrSYtmqwXVA+DoGYH1Ieez3LKo8X+VY=; b=xNPt9LE4pMG0vPM4QgEQK7UT67
	f5Ozj9zkKsjQVmSir8rWi5lsecr60WFJeczM7SHl+DGF25c7zdK3MU7cUu9raIBhHyCAQ4XKIamYI
	WXHMiwa1/mUqP6/S+F/6E/NCKuAaW5SRjHQSmQT0plM3PpE/ZYO1YJIZmgaDRH9P/x6g=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24604.3977.348615.728094@mariner.uk.xensource.com>
Date: Thu, 4 Feb 2021 15:15:21 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <committers@xenproject.org>,
    <xen-devel@lists.xenproject.org>,
    Dario Faggioli <dfaggioli@suse.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    <community.manager@xenproject.org>
Subject: Re: [ANNOUNCE] Xen 4.15 - call for notification/status of significant
 bugs
In-Reply-To: <da8b6f0b-185e-91f4-d245-22d8af50c194@citrix.com>
References: <24600.8030.769396.165224@mariner.uk.xensource.com>
	<24603.58528.901884.980466@mariner.uk.xensource.com>
	<da8b6f0b-185e-91f4-d245-22d8af50c194@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [ANNOUNCE] Xen 4.15 - call for notification/status of significant bugs"):
> On 04/02/2021 12:12, Ian Jackson wrote:
> > OPEN ISSUES
> > -----------
> >
> > A. HPET/PIT issue on newer Intel systems
...
> > I think Andrew is still on the case here.
> 
> Fixed.  c/s e1de4c196a from a week ago.
> 
> > C. Fallout from MSR handling behavioral change.
...
> Still WIP and on my TODO list.  In addition to Jan's report, there is a
> separate report from Boris against Solaris.  Also I need to revert a
> patch of mine from early in the release and do the same thing differently.
> 
> Bugs are "VMs which boot on earlier releases don't boot on 4.15 at the
> moment".

Thanks for this information, which I have noted.

Ian.

