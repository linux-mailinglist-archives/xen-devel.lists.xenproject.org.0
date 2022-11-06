Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200D061E564
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 19:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438670.692749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orkiL-00040E-Vc; Sun, 06 Nov 2022 18:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438670.692749; Sun, 06 Nov 2022 18:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orkiL-0003yR-SU; Sun, 06 Nov 2022 18:49:49 +0000
Received: by outflank-mailman (input) for mailman id 438670;
 Sun, 06 Nov 2022 18:49:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4hAr=3G=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1orkiK-0003yL-PL
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 18:49:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c828fa98-5e03-11ed-8fd1-01056ac49cbb;
 Sun, 06 Nov 2022 19:49:46 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 07BA760D57;
 Sun,  6 Nov 2022 18:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DF6DC433D7;
 Sun,  6 Nov 2022 18:49:44 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4C5F3E270DD; Sun,  6 Nov 2022 18:49:44 +0000 (UTC)
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
X-Inumbo-ID: c828fa98-5e03-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667760584;
	bh=MfPHo+0mPM8JcO0sg8ivk7lLZLBFpDVM1b+O/kblazs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ohp/yTocx7u1uzQa0yyMrpBNC1FK7RCjeYuQmjnbILPxo9+1LRnC1r3EvqbcidyGs
	 3S7tjxBg+tEt/ei8bpFgA3OHEFemc+Imu5GoP2R7Cj7Ey8MMM6vNSITSLVnl7xDw1h
	 NUZEfTy/iNQP+e/vvMACL7DOkiZUSZpAWJSI5YazkS6VVyab7sjrF3vqBrrT5p7sc8
	 T4u4txOqg4VhuSm+Hzz/q4W7yIz1PhLft+81HpeyRhKRsrIhcRxTZUDUY9qIWCvE/x
	 3RnFJ0h+2dza19lTZJrjr/ie3mn/qRvfPeWdJJTp2Sovn3b0lf2JT4qYkCX8aZrwrV
	 tCqQXhqJAe4bQ==
Subject: Re: [GIT PULL] xen: branch for v6.1-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20221106055958.14139-1-jgross@suse.com>
References: <20221106055958.14139-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20221106055958.14139-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.1-rc4-tag
X-PR-Tracked-Commit-Id: 4bff677b30156435afa2cc4c3601b542b4ddd439
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6e8c78d32b5c60737bcd71346130f0bf91d6e066
Message-Id: <166776058430.6751.15098264634464095841.pr-tracker-bot@kernel.org>
Date: Sun, 06 Nov 2022 18:49:44 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Sun,  6 Nov 2022 06:59:58 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.1-rc4-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6e8c78d32b5c60737bcd71346130f0bf91d6e066

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

