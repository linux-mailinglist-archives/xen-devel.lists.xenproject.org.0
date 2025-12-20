Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A05FCD3646
	for <lists+xen-devel@lfdr.de>; Sat, 20 Dec 2025 20:49:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1191562.1511273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vX2wI-0001IG-CH; Sat, 20 Dec 2025 19:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1191562.1511273; Sat, 20 Dec 2025 19:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vX2wI-0001FC-5W; Sat, 20 Dec 2025 19:48:30 +0000
Received: by outflank-mailman (input) for mailman id 1191562;
 Sat, 20 Dec 2025 19:48:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fV7/=62=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1vX2wG-0001F6-Mm
 for xen-devel@lists.xenproject.org; Sat, 20 Dec 2025 19:48:28 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8fba5cd-dddc-11f0-9cce-f158ae23cfc8;
 Sat, 20 Dec 2025 20:48:25 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 440E960053;
 Sat, 20 Dec 2025 19:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC270C4CEF5;
 Sat, 20 Dec 2025 19:48:23 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3B85D3809A05; Sat, 20 Dec 2025 19:45:13 +0000 (UTC)
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
X-Inumbo-ID: d8fba5cd-dddc-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766260104;
	bh=Wnxoz2E6dng9cWa29BHf0FDoqGeMawS0j50K2RviYQM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VMb3PrCdE85GHeRExgH1X1HEPvtQW+kF8AZfOcp5Fc2oKSiZRJawnppzvxZ1a5QbY
	 HMQrTpDcz5/UEVJNeK+NcN55AHxUHInUCsZtzDC4KbdF5uSmPfsCYFTNOPlzbR5QSA
	 VJrOFKPW2NRqzj8dLjnOJLpNpmcDQzBvGqOvubRKN+J7SGB1r+pV6QnQAusmK+PaMw
	 hUHXf7FUJYx0epzGSquPy5Ljb70dq1nWonN4/dVAq5lyM5A4W5UFE5VoFoG0BQGZpp
	 Sl7eznmq3Z8ytRTZZxQSKegA8JTDSMsx60wtZ2nFCJJpJRDzV31wsA6Q9kseYxp3rY
	 ugK+JNQvW9bdA==
Subject: Re: [GIT PULL] xen: branch for v6.19-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251219065241.12549-1-jgross@suse.com>
References: <20251219065241.12549-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20251219065241.12549-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.19-rc2-tag
X-PR-Tracked-Commit-Id: e5aff444e3a7bdeef5ea796a2099fc3c60a070fa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 255a918a943ba17bbd8801f5eb56c9083d1def7e
Message-Id: <176625991183.123080.13738389953552835048.pr-tracker-bot@kernel.org>
Date: Sat, 20 Dec 2025 19:45:11 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri, 19 Dec 2025 07:52:41 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.19-rc2-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/255a918a943ba17bbd8801f5eb56c9083d1def7e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

