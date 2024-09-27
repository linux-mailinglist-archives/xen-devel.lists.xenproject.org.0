Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA619889AC
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 19:26:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806512.1217899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suEiK-0003V8-Pa; Fri, 27 Sep 2024 17:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806512.1217899; Fri, 27 Sep 2024 17:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suEiK-0003TC-Mq; Fri, 27 Sep 2024 17:25:08 +0000
Received: by outflank-mailman (input) for mailman id 806512;
 Fri, 27 Sep 2024 17:25:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xSel=QZ=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1suEiJ-0003Ss-Ip
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 17:25:07 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fb7549f-7cf5-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 19:25:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BBFE8A4597A;
 Fri, 27 Sep 2024 17:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F47C4CEC4;
 Fri, 27 Sep 2024 17:25:04 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7130B3809A80; Fri, 27 Sep 2024 17:25:08 +0000 (UTC)
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
X-Inumbo-ID: 6fb7549f-7cf5-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727457904;
	bh=29dxwTfWq+jhUNeQ8ohqaNoFh2DsIBUvD4bZBGhlTbc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MztSNPIE4ghBgM/bjz8najz9Lrs9e/k02wRH4Oks+KNFDxoTOkOobh3cF9ss276id
	 iK3Gu6qEi2unV6Wn6FFPHn1lTYKX8tEc2Zd/wSAvcmpxCvjJGq6Y3177iSLdIWfIFG
	 f018eUEi5FNqErUDZBVQXxUH+AnvOsHEFj/bZehntjX98KIGtcmC9n2l0Oi9DT9ION
	 7JXv8aEKrBBQhMZJf9pkkY2IdrHnwi7kcpiSUgPofUaCuf4TKVqk6ZI/e0Qjot92Pv
	 MHFbxDAR3pd2OK+/vU7y1U4D7kslO79uB5hqpdnnb8R20p04XjOmOcKadnyY+AQdBL
	 u5HWofIMGmaBQ==
Subject: Re: [GIT PULL] xen: branch for v6.12-rc1a
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240927094337.32387-1-jgross@suse.com>
References: <20240927094337.32387-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240927094337.32387-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.12-rc1a-tag
X-PR-Tracked-Commit-Id: 47ffe0578aee45fed3a06d5dcff76cdebb303163
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 653608c67ae3dce1c5dee8c620ce6016e174bbd1
Message-Id: <172745790700.2030610.15308881267088417646.pr-tracker-bot@kernel.org>
Date: Fri, 27 Sep 2024 17:25:07 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri, 27 Sep 2024 11:43:37 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.12-rc1a-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/653608c67ae3dce1c5dee8c620ce6016e174bbd1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

