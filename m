Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17840AB24AF
	for <lists+xen-devel@lfdr.de>; Sat, 10 May 2025 18:28:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980690.1367300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDn3q-0002I6-HX; Sat, 10 May 2025 16:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980690.1367300; Sat, 10 May 2025 16:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDn3q-0002Fd-F1; Sat, 10 May 2025 16:28:26 +0000
Received: by outflank-mailman (input) for mailman id 980690;
 Sat, 10 May 2025 16:28:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prUP=X2=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1uDn3p-0002FW-LF
 for xen-devel@lists.xenproject.org; Sat, 10 May 2025 16:28:25 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c86a62cb-2dbb-11f0-9ffb-bf95429c2676;
 Sat, 10 May 2025 18:28:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D40D3A4BD86;
 Sat, 10 May 2025 16:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7923AC4CEE2;
 Sat, 10 May 2025 16:28:18 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAE8C3822D42; Sat, 10 May 2025 16:28:57 +0000 (UTC)
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
X-Inumbo-ID: c86a62cb-2dbb-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746894498;
	bh=R4+pyvED4JPWaKKZNPWCeKPn1xFDJDCAuUXhwp+6kZ0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VfDUI3vyfbRoiK68I7/X7BAioQ7uZpKBJ0OOJ2Tn73eNCkLK36TteA6MhyPNGks1K
	 GDpK9UhlojkAlZzYmGnOKKrs5g84GxcJSu9S2NTjOX9U++WRHDdN5kcAoUVSSGpuJB
	 INeMT2ThmfnXRdKr1J3DIXiEylmG8pHCtrlcntS/Y1FpyavxQ2zj6DYE64l+m1VLnm
	 X9dwji2PchlpWwlGnFODccK9PrXPu/KMkglmlob+qSWZJyEr3ceBZxldQ7Pf2qfzxX
	 p5qLavK/LfDByJfzPLCFehtQhKKVfvaA+4rWi0oh9oHQ9bMcM6etzs0PF6m8rtFmvp
	 y4rqs4TRvSXjw==
Subject: Re: [GIT PULL] xen: branch for v6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250510060239.18894-1-jgross@suse.com>
References: <20250510060239.18894-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20250510060239.18894-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15a-rc6-tag
X-PR-Tracked-Commit-Id: 1f0304dfd9d217c2f8b04a9ef4b3258a66eedd27
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 86c019597cd4e0fc90dfa9ebba9282b2d122c187
Message-Id: <174689453659.4001425.18085781507262219952.pr-tracker-bot@kernel.org>
Date: Sat, 10 May 2025 16:28:56 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Sat, 10 May 2025 08:02:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15a-rc6-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/86c019597cd4e0fc90dfa9ebba9282b2d122c187

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

