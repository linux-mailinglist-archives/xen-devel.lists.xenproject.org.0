Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1959444CA3F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 21:11:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224428.387685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mktv6-0006QA-G8; Wed, 10 Nov 2021 20:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224428.387685; Wed, 10 Nov 2021 20:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mktv6-0006Ng-Cb; Wed, 10 Nov 2021 20:10:08 +0000
Received: by outflank-mailman (input) for mailman id 224428;
 Wed, 10 Nov 2021 20:10:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=inKd=P5=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1mktv5-0006JW-0m
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 20:10:07 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fe04ed1-4262-11ec-9787-a32c541c8605;
 Wed, 10 Nov 2021 21:10:03 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6A51D61241;
 Wed, 10 Nov 2021 20:10:01 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6299A60A6B;
 Wed, 10 Nov 2021 20:10:01 +0000 (UTC)
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
X-Inumbo-ID: 2fe04ed1-4262-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636575001;
	bh=FQGe83vCeAnmCLrYhrsTfIZvLN21VUkB405hfWjK6II=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LRHsLM/jwVxLgxllCmGK/1KyzR7RplZhzmXWJpntfQWZPBQrMol/+hQ4lcdNVvt9m
	 fNO5131US6zpnHaXlAKLZ8L27kXbmaWTsCb7nohEPFqMyibh4LMaDZkGlT8BrvhOr5
	 SMC+ZPfvpT3seDMDDmDV/5a9w6yIA6NiXeYkNPK/cwcE7D2tiuBcb0bFeAs4XBUNjz
	 x/VcCeWZzPZEIsk6W71/vyy2t3RFHibNOh1diMxIQBUx0d+VX63V8aNqrZ8LDL/Z82
	 PWzwfwF6e2s1Q29ves04zQR/0Ba+S4d4K2UHueeXj9WWFMl/k5YEL8Jy0uZw9oLBIq
	 vfqqtbt6keGIA==
Subject: Re: [GIT PULL] xen: branch for v5.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20211109142819.24428-1-jgross@suse.com>
References: <20211109142819.24428-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20211109142819.24428-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.16b-rc1-tag
X-PR-Tracked-Commit-Id: 501586ea5974a9dafee41f54a66326addb01a5ac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bf98ecbbae3edf3bb3ec254c3e318aa3f75fd15e
Message-Id: <163657500139.19350.1542926242630037690.pr-tracker-bot@kernel.org>
Date: Wed, 10 Nov 2021 20:10:01 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Tue,  9 Nov 2021 15:28:19 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.16b-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bf98ecbbae3edf3bb3ec254c3e318aa3f75fd15e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

