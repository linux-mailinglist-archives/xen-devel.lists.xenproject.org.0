Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3DDCAAC9F
	for <lists+xen-devel@lfdr.de>; Sat, 06 Dec 2025 20:08:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179902.1503265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRxcS-0006Zd-Jo; Sat, 06 Dec 2025 19:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179902.1503265; Sat, 06 Dec 2025 19:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRxcS-0006YB-Ee; Sat, 06 Dec 2025 19:07:00 +0000
Received: by outflank-mailman (input) for mailman id 1179902;
 Sat, 06 Dec 2025 19:06:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gxC2=6M=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1vRxcQ-0006Y5-UJ
 for xen-devel@lists.xenproject.org; Sat, 06 Dec 2025 19:06:58 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8f682eb-d2d6-11f0-980a-7dc792cee155;
 Sat, 06 Dec 2025 20:06:53 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E8B9A434D8;
 Sat,  6 Dec 2025 19:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FBEC4CEF5;
 Sat,  6 Dec 2025 19:06:50 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 F2B8E3808200; Sat,  6 Dec 2025 19:03:48 +0000 (UTC)
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
X-Inumbo-ID: b8f682eb-d2d6-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765048010;
	bh=Zlb7L39Nyrwq40eDa6+kJpyRAo24XlBTs+l7xdBF/YE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FrFShPAiCR/tCauSuvPb3P8r95J923MeE1p5LKcWfW8KFtRXAAXeBysK3Grzled+p
	 a7VQ/Y6v40azviOjQKdTuSqNY48dzJM/MRghd+mYG3Sj+/7uqunToxwTN+CLXDTf6M
	 goC6cWAKEQr/8UH6dv3+GaoqvXyZaNd0niJo7W/S0BnHBHglebwUAvL1OvrlM3ZiDM
	 6W08ACOFuzOhgZvN9krup8C3XWicvZBQWaVSBNbZ3iL/uKJjcWnHu+9el9yZ8ZN8i5
	 TRZdnqZArSeKPId7Uz7ivyXGfq/Rel01MTZtDTxj5BsSYX1p7JcIrAEh8vnReVwhaG
	 wnGc9zoQFT7ug==
Subject: Re: [GIT PULL] xen: branch for v6.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251206063127.23986-1-jgross@suse.com>
References: <20251206063127.23986-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20251206063127.23986-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.19-rc1-tag
X-PR-Tracked-Commit-Id: 150215b89bcf708356abcb7d3cafdd1e6068598b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1a68aefc710a9f5486c90c87f0424d4912429adb
Message-Id: <176504782764.2170003.8056430227605057132.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 19:03:47 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Sat,  6 Dec 2025 07:31:27 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.19-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1a68aefc710a9f5486c90c87f0424d4912429adb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

