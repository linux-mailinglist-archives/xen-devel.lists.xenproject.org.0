Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C065A845B2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 16:09:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945787.1343913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2sac-0007SW-BW; Thu, 10 Apr 2025 14:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945787.1343913; Thu, 10 Apr 2025 14:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2sac-0007QW-8G; Thu, 10 Apr 2025 14:09:10 +0000
Received: by outflank-mailman (input) for mailman id 945787;
 Thu, 10 Apr 2025 14:09:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSBe=W4=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1u2saa-00073i-IT
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 14:09:08 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d70aa5b-1615-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 16:09:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 787E568448;
 Thu, 10 Apr 2025 14:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A21EC4CEDD;
 Thu, 10 Apr 2025 14:09:05 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB0F8380CEF4; Thu, 10 Apr 2025 14:09:43 +0000 (UTC)
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
X-Inumbo-ID: 5d70aa5b-1615-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744294145;
	bh=RAvqgwOe95bzIaYDYX48bflXNBKKkphqE8oTRacCQjU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tY9M0sOGGMbPGNh8KOp8E37eYO3whlAejAIwHGttnmEzBvZgtQiB/hOspBMdIaW5U
	 cP121DxN9eToy2bz4KSZdyBqzF8foGcGcf6oGzUgokYGC/DHssU6bYqx3mCbfAyDmx
	 ffDZ+4x0r1zDNV9HWEiTxG28DpJIMG/71sMZRasFuB2H41qHQ9oMENz30l90ulF17P
	 mOoGDq2qz1T+UH2q7x7T/uwsPdwbGiC7yUQQ29wgv8dHhy5StfJ/f7mT9W0rAEvBk4
	 +Bbt2av4iucjlXQ5lVU1hq71odN6BVNIxqWrU6o5juWzrEjcf28bloZRqJBDFwiEyb
	 0r24qQKNsa7hQ==
Subject: Re: [GIT PULL] xen: branch for v6.15-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250410090713.30027-1-jgross@suse.com>
References: <20250410090713.30027-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20250410090713.30027-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15a-rc2-tag
X-PR-Tracked-Commit-Id: 64a66e2c3b3113dc78a6124e14825d68ddc2e188
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2eb959eeecc64fa56e9f89a5fc496da297585cbe
Message-Id: <174429418245.3685623.8550379606264843082.pr-tracker-bot@kernel.org>
Date: Thu, 10 Apr 2025 14:09:42 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Thu, 10 Apr 2025 11:07:13 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15a-rc2-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2eb959eeecc64fa56e9f89a5fc496da297585cbe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

