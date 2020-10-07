Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5E42866D8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 20:22:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3671.10655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQE4r-0000cq-CR; Wed, 07 Oct 2020 18:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3671.10655; Wed, 07 Oct 2020 18:22:13 +0000
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
	id 1kQE4r-0000cP-8l; Wed, 07 Oct 2020 18:22:13 +0000
Received: by outflank-mailman (input) for mailman id 3671;
 Wed, 07 Oct 2020 18:22:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ECWb=DO=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kQE4p-0000cJ-QQ
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:11 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 199ec08b-e3d9-4eff-ac34-2b47fbd4bdc4;
 Wed, 07 Oct 2020 18:22:10 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kQE4o-0003L3-Lz
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:10 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kQE4o-0008Vi-JA
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:10 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>) id 1kQE4m-0003SW-Po
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 19:22:08 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ECWb=DO=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
	id 1kQE4p-0000cJ-QQ
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:11 +0000
X-Inumbo-ID: 199ec08b-e3d9-4eff-ac34-2b47fbd4bdc4
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 199ec08b-e3d9-4eff-ac34-2b47fbd4bdc4;
	Wed, 07 Oct 2020 18:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=q6Lhchrp5WV/uDmtgyM8+fXp02ox19ZzxjNkpYIlJB0=; b=bS7lIOhubmgmZbfwrAnRPc15QF
	JCX3OzhMrOwqII1MLP01fd3qlmcLmXC384wIKp9qZ2jSTqAXpZWSeS54RMyheb0CjQxrx7M6fPz4o
	ZFwJnhBe2iWvXVZVpDNUaH+I+wf118iCw92aN0C7ujIpygKUhJ4L3c80gJ3nokWIRQh0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kQE4o-0003L3-Lz
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:10 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kQE4o-0008Vi-JA
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 18:22:10 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
	(envelope-from <iwj@xenproject.org>)
	id 1kQE4m-0003SW-Po
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 19:22:08 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24446.1872.406679.996085@mariner.uk.xensource.com>
Date: Wed, 7 Oct 2020 19:22:08 +0100
To: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH 00/82] Reuse test hosts
In-Reply-To: <20201007180024.7932-1-iwj@xenproject.org>
References: <20201007180024.7932-1-iwj@xenproject.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("[OSSTEST PATCH 00/82] Reuse test hosts"):
> This series arranges to save on host setup by reusing a test host, if
> the previous test passed.  Care is taken to make sure that a host is
> only reused in this way if the new test would have set it up
> identically.
> 
> I have had this branch in preparation since November 2017...

Many of the earlier commits in this series had my Citrix address as
the author.  My setup was not configured to deliver these mails
correctly (ie, via the Citrix mail servers), so those messages will
generally have been blocked as spam.  Additionally, even the mails
which were From: iwj@xenproject were delivered via my colo mail server
which is not really right.  So some of those might also get blocked.

I don't propose to resend the mailbomb.  You can find the complete
series here:
  https://xenbits.xen.org/gitweb/?p=people/iwj/osstest.git;a=shortlog;h=refs/heads/test-host-reuse-v1
  https://xenbits.xen.org/git-http/people/iwj/osstest.git#test-host-reuse-v1

It's in osstest pretest now.

Ian.

