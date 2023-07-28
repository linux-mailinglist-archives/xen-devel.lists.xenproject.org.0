Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5FE7675A0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 20:39:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571541.895634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPSN9-0006zg-Po; Fri, 28 Jul 2023 18:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571541.895634; Fri, 28 Jul 2023 18:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPSN9-0006xA-MG; Fri, 28 Jul 2023 18:39:31 +0000
Received: by outflank-mailman (input) for mailman id 571541;
 Fri, 28 Jul 2023 18:39:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I+Wj=DO=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1qPSN8-0006x0-9C
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 18:39:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1492bd32-2d76-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 20:39:28 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 148DD621DC;
 Fri, 28 Jul 2023 18:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CCE6C433CB;
 Fri, 28 Jul 2023 18:39:25 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 693D8C4166F; Fri, 28 Jul 2023 18:39:25 +0000 (UTC)
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
X-Inumbo-ID: 1492bd32-2d76-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690569565;
	bh=MvEhmaMP0NQYXaR+ON9JAVE/AlmQzWiuNidmwMzSgiQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=D5JhO8NvVg/pM9rZrXqTCxYGIZNXztY3Kwy7yycSFalWSG0jwKMQf4GfZsrMMG/c9
	 P4zLI61WWjJy8LF/ZbwCTNq6RoNWPkVX5do5W9Gsd+8fngc/7xk59ezSlBLneZd8Dr
	 Q7B0EPMwYbKvnzEOmPWro9ylU1e8Ikd0Q1t3/SjDp6TBKBeKoAkvLTgobTOVtkAvnh
	 wxeT4mtX5ICbXiolDyo9O3K2jlMHCW86oYdCN4vr2WCb1/YVcm/5vC3gYQSv8ichYW
	 IMK7pHVqxN+qEFzDxpvAtGfxMsrqtUt3sEGkn2DOXf3natWeOmswQASuubwiLgXYb0
	 J+LuiG3mt5AHw==
Subject: Re: [GIT PULL] xen: branch for v6.5-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230728131804.10538-1-jgross@suse.com>
References: <20230728131804.10538-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20230728131804.10538-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.5a-rc4-tag
X-PR-Tracked-Commit-Id: c04e9894846c663f3278a414f34416e6e45bbe68
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 81eef8909d171bdca6af37028a11a24e011ed312
Message-Id: <169056956542.21363.18012666636626712275.pr-tracker-bot@kernel.org>
Date: Fri, 28 Jul 2023 18:39:25 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri, 28 Jul 2023 15:18:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.5a-rc4-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/81eef8909d171bdca6af37028a11a24e011ed312

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

