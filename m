Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE123644C36
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 20:08:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455489.712971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2dHb-0006UC-Fb; Tue, 06 Dec 2022 19:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455489.712971; Tue, 06 Dec 2022 19:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2dHb-0006Rg-Ch; Tue, 06 Dec 2022 19:07:11 +0000
Received: by outflank-mailman (input) for mailman id 455489;
 Tue, 06 Dec 2022 19:07:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzP2=4E=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1p2dHa-0006RV-7K
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 19:07:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dad76fe-7599-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 20:07:08 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 18DBF618A9;
 Tue,  6 Dec 2022 19:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B297C43150;
 Tue,  6 Dec 2022 19:07:05 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 58461C395E5; Tue,  6 Dec 2022 19:07:05 +0000 (UTC)
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
X-Inumbo-ID: 2dad76fe-7599-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670353625;
	bh=+b/pJi2je6YKdPh3OUgHKvSpTMv4Xdf06lM3v3wcTBw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Qf3cvOZSxsWFk01o9eCbUsqiV1iymtMgkddiX76ugH00BFbCGJ7jXKgOBS4yzlOTI
	 4sz8/cDCCnkB4SWjyitLIc6Y5Guso1JnrcCUKXwf493achriAwwref89yqmN8JNjtQ
	 E2EsgZJ0WqiZYAiMmOXz4lyNzHhIw64b/oIUG46AlN4jVrzkRTKtR/o3bi2968p0sU
	 x9zT30JsBYLkswLVrHjOsX18exYQrl/0WSdxfuFAfJbNt2xAXCqwziic39haCKXaJe
	 uNuATQIOfkpwa+J/WyTBMWly0X2PW78BIznmbXVHbyZu+V842mEcGnsrbY5M7lbkVe
	 MKDU3m+pwnW/A==
Subject: Re: [GIT PULL] xen: branch for v6.1-rc9
From: pr-tracker-bot@kernel.org
In-Reply-To: <20221206152122.17024-1-jgross@suse.com>
References: <20221206152122.17024-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20221206152122.17024-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-xsa-6.1-rc9-tag
X-PR-Tracked-Commit-Id: 74e7e1efdad45580cc3839f2a155174cf158f9b5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b71101d6ae7b1149123b0479ea21e9ad391fdd49
Message-Id: <167035362535.3568.13770896981748795941.pr-tracker-bot@kernel.org>
Date: Tue, 06 Dec 2022 19:07:05 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Tue,  6 Dec 2022 16:21:22 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-xsa-6.1-rc9-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b71101d6ae7b1149123b0479ea21e9ad391fdd49

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

