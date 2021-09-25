Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8767418524
	for <lists+xen-devel@lfdr.de>; Sun, 26 Sep 2021 01:07:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195951.348822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUGk0-0007Yk-Bt; Sat, 25 Sep 2021 23:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195951.348822; Sat, 25 Sep 2021 23:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUGk0-0007WR-8r; Sat, 25 Sep 2021 23:05:56 +0000
Received: by outflank-mailman (input) for mailman id 195951;
 Sat, 25 Sep 2021 23:05:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5GXT=OP=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1mUGjy-0007WL-Bb
 for xen-devel@lists.xenproject.org; Sat, 25 Sep 2021 23:05:54 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21c853b6-1e55-11ec-bbc9-12813bfff9fa;
 Sat, 25 Sep 2021 23:05:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 83ADE60F3A;
 Sat, 25 Sep 2021 23:05:52 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7D760600E8;
 Sat, 25 Sep 2021 23:05:52 +0000 (UTC)
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
X-Inumbo-ID: 21c853b6-1e55-11ec-bbc9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632611152;
	bh=2FUsp8B+t6o61u2VSDNEqSK3jIOVD0jJY/RPX02w5jE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fYaXaYxa4RYC98MpdROIbMFMmT54RXOSVDnFIvVpMo7aT9z/xPHmyPcTjkyT+mKj0
	 fmhfpEe+Rx8WyiZ/VrA+JCxoS8R38+pfzKTNzfthLg37cx1Zie0lGDEMw8QtcZQNsq
	 868TTlkbRVCFZ7/e8ggyEEWl4luFmbfA1cy36fpwPynWSP/LQXJuMkI1ohNwThPO8g
	 7iIs708l1RHMt9YwiXKkx70z5kTImALP47LKKROnsL1H8FrBpw/OSGRg+LESQuWyLB
	 PLXKrapCpkDkFp13gLKM8/JuoygobCe0ulpLsL43QSCR3ClDkAbjvi4SIeE8sDbTU+
	 A59+7/DftYtOw==
Subject: Re: [GIT PULL] xen: branch for v5.15-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210925143126.26439-1-jgross@suse.com>
References: <20210925143126.26439-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210925143126.26439-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.15b-rc3-tag
X-PR-Tracked-Commit-Id: 0594c58161b6e0f3da8efa9c6e3d4ba52b652717
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5739844347518a0f4c327ae79e73fb101d864726
Message-Id: <163261115250.2532.5770040613699339771.pr-tracker-bot@kernel.org>
Date: Sat, 25 Sep 2021 23:05:52 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Sat, 25 Sep 2021 16:31:26 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.15b-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5739844347518a0f4c327ae79e73fb101d864726

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

