Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BB9BAB1C2
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 04:56:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133415.1471531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3QW8-0005kg-LT; Tue, 30 Sep 2025 02:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133415.1471531; Tue, 30 Sep 2025 02:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3QW8-0005hV-Eu; Tue, 30 Sep 2025 02:55:04 +0000
Received: by outflank-mailman (input) for mailman id 1133415;
 Tue, 30 Sep 2025 02:55:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kx46=4J=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1v3QW6-0005hL-UE
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 02:55:02 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da318902-9da8-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 04:54:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3A35260357;
 Tue, 30 Sep 2025 02:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B33DC4CEF4;
 Tue, 30 Sep 2025 02:54:58 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADECF39D0C1A; Tue, 30 Sep 2025 02:54:52 +0000 (UTC)
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
X-Inumbo-ID: da318902-9da8-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759200898;
	bh=aBszSgASonpZWC82V9x0owSaL1kG0Jo/J08UI3a/8Yo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WBL7Q9yjMnLmk7lBK8dCo+VC97L0GqRx9jBwre5b8Oub9LF9c1YaS1B/UsDttZhdW
	 dMAp0qdhRdX4gsDeyD9Nx+EiVHzlit/+IHCkpgteNIEanOhSELgA7LhNBEhQrumV/U
	 31Qb6pKpDFL8xxyb6z6s03FavvFLbdHsfP9xMoJoajxFXnnpW2Xe3accUv+t1aHU59
	 NklxQmjdrKIRwvyMX74/uAWEZTnM9xKudY0AQwCn1jcx/ou51bxtl2blMGrYpKeyMn
	 7393WzAlE3FFXA6o5ds91FVE1s66KQq3ATWg7Ma0wH0fLvMQBfmsinEWKKqLVWF3BH
	 zxrg/GH3Vmw4w==
Subject: Re: [GIT PULL] xen: branch for v6.18-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250926113107.22638-1-jgross@suse.com>
References: <20250926113107.22638-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250926113107.22638-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.18-rc1-tag
X-PR-Tracked-Commit-Id: 9d52b0b41be5b932a0a929c10038f1bb04af4ca5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 30d4efb2f5a515a60fe6b0ca85362cbebea21e2f
Message-Id: <175920089129.1805104.16547639794605921099.pr-tracker-bot@kernel.org>
Date: Tue, 30 Sep 2025 02:54:51 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri, 26 Sep 2025 13:31:05 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.18-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/30d4efb2f5a515a60fe6b0ca85362cbebea21e2f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

