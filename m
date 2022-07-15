Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4AB57664E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 19:46:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368420.599687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCPNk-0004Oe-Fj; Fri, 15 Jul 2022 17:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368420.599687; Fri, 15 Jul 2022 17:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCPNk-0004Ls-CO; Fri, 15 Jul 2022 17:45:40 +0000
Received: by outflank-mailman (input) for mailman id 368420;
 Fri, 15 Jul 2022 17:45:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=irHP=XU=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1oCPNj-0004Lm-6e
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 17:45:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee45ac34-0465-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 19:45:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0063C622D3;
 Fri, 15 Jul 2022 17:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6184AC36AEF;
 Fri, 15 Jul 2022 17:45:34 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4809BE4522F; Fri, 15 Jul 2022 17:45:34 +0000 (UTC)
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
X-Inumbo-ID: ee45ac34-0465-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657907134;
	bh=upDQS3vqXsVzxg+tNckdGACur/G8xxuSK67U6Jd7Iq0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=O1ap3U8X5XGojDmbf0JSsjtmMNbjIYIOdG6tjkoOH0/emJC9ieL5VciXlS3DZF9F8
	 zRlybQGtcDBoy5xq73HsGYa0z5n/K7+nA/JN0rFru73YH4VgKt3NcPjW8+jDVQP/zo
	 yLz82cz9CjeOsnfSll4WOIN4/hTq9Cbf50cUvx6nMyrNpcbuj4XtgOd5ws3GOqglU3
	 Hl2PCrii/F2v61/esS4Vx2kwgXszn9z2N1yrPX6eeJOd6H4VCWbXdn4lDRpbM5NCY0
	 H+dIpgO/0SJBK2fX2sOeikwzJ3GyeriRmD8CWc8FhaCKkpE/Ik/cUhiig5PeUY+j6X
	 WlVPl87GPo1fA==
Subject: Re: [GIT PULL] xen: branch for v5.19-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220715060019.5197-1-jgross@suse.com>
References: <20220715060019.5197-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220715060019.5197-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.19a-rc7-tag
X-PR-Tracked-Commit-Id: 166d3863231667c4f64dee72b77d1102cdfad11f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 339f74e38f53c83b5715abd28f7002b66731d917
Message-Id: <165790713429.27298.14101332307075836483.pr-tracker-bot@kernel.org>
Date: Fri, 15 Jul 2022 17:45:34 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri, 15 Jul 2022 08:00:19 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.19a-rc7-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/339f74e38f53c83b5715abd28f7002b66731d917

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

