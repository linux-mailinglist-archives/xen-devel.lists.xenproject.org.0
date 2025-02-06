Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B74A2B672
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 00:12:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883178.1293231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgB2l-0005Xh-VT; Thu, 06 Feb 2025 23:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883178.1293231; Thu, 06 Feb 2025 23:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgB2l-0005WF-Se; Thu, 06 Feb 2025 23:12:23 +0000
Received: by outflank-mailman (input) for mailman id 883178;
 Thu, 06 Feb 2025 23:12:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WMtH=U5=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1tgB2k-0005W8-Sr
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 23:12:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d083e168-e4df-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 00:12:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 821475C6B25;
 Thu,  6 Feb 2025 23:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED54C4CEDD;
 Thu,  6 Feb 2025 23:12:18 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB0A6380AADE; Thu,  6 Feb 2025 23:12:47 +0000 (UTC)
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
X-Inumbo-ID: d083e168-e4df-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738883539;
	bh=2RwiUHbhguiFlpdaLW9cOgE7JnkOtpdy/sWd5BeWztM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kMtxl4nzX93/Og9N/duoz99OvHcqs0b3J3g0SPnbmBNpUgbT3/BvvnefpFKgSZ0pu
	 ZeRfD/XGPhrggS/nDRU2j0mRoAttHK/bq778eiGTuDcB+BCzxsMBEm0tdQQE00yaKI
	 aCwN0GcNxD25AdFMQHqif9iDOA00jmNpTlqIwodsRbv077p8LVx21osHTCpiB0ExOt
	 tt9WH9vVIToxmxVcAbCPnprHAwCzZldvUeCRiUvllxHqBW3m/DQ2mIUVbuooItYFFH
	 Zy4vWYozU18LjHjqhyxKfUOwrCTfk4wu0ZZp9ShPBRRmmH5Yn/C6tjYsbME9Mj3a5B
	 UqwmAQTf7ahFg==
Subject: Re: [GIT PULL] xen: branch for v6.14-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250206163052.5240-1-jgross@suse.com>
References: <20250206163052.5240-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250206163052.5240-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.14-rc2-tag
X-PR-Tracked-Commit-Id: aaf5eefd374b6e006e1c224a2b37bac9d3737aa2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5b734b49de8e195a9c9693d0d256ed1ca9fe6c9b
Message-Id: <173888356650.1693200.7122796100405476728.pr-tracker-bot@kernel.org>
Date: Thu, 06 Feb 2025 23:12:46 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Thu,  6 Feb 2025 17:30:52 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.14-rc2-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5b734b49de8e195a9c9693d0d256ed1ca9fe6c9b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

