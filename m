Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCEDA224DB
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 21:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879310.1289528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdEEe-0002Hj-IB; Wed, 29 Jan 2025 20:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879310.1289528; Wed, 29 Jan 2025 20:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdEEe-0002GJ-FX; Wed, 29 Jan 2025 20:00:28 +0000
Received: by outflank-mailman (input) for mailman id 879310;
 Wed, 29 Jan 2025 20:00:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cG3g=UV=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1tdEEc-0002GD-Im
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 20:00:26 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id accd311a-de7b-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 21:00:24 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0C9FAA41BD9;
 Wed, 29 Jan 2025 19:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D33BC4CED1;
 Wed, 29 Jan 2025 20:00:22 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EC238380AA66; Wed, 29 Jan 2025 20:00:49 +0000 (UTC)
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
X-Inumbo-ID: accd311a-de7b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738180822;
	bh=iVfZkLVruIbbdzsnZUjYzyiyWIqjBGQkh7u7/V1Jtwg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UwRQ+iFUxtV8g1OM6HbfW7XBiTOdcc/n32bE6o0YauK6Yubvs+bPxASqrw+klc3Kx
	 hf/kBWMvjhuSdv8XLNlYEle//ixLcuE1b5auG6ohvQvkb/eAAiT7pkknr+wXSaXit9
	 DEn8Pe1AdadAVCSMpc8ecCdkZPjCYfpdyh+JXhkzAcMtPhOS/GEzkM0SZoxb/xkKtr
	 8YDmdn2GaTbee1y41bSMYs6ZUNdy/EwDpKCQx8r47+XuUI+jAERfU4cZ16nkfex8C3
	 t/B3IV4sizKP6opgOb9MMx4yohcN1/1bd1cx3SOSv8Xl7xNBxELvZrI505mOj5vOrm
	 fIrmDChy72NcA==
Subject: Re: [GIT PULL] xen: branch for v6.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250129183614.2601-1-jgross@suse.com>
References: <20250129183614.2601-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250129183614.2601-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.14-rc1-tag
X-PR-Tracked-Commit-Id: bda50f7770e5b8e730745e119eb6ca78570f7abf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b2091a64820f068dd19b7dd5351d8095adb3e5f6
Message-Id: <173818084837.411204.4406262662728868525.pr-tracker-bot@kernel.org>
Date: Wed, 29 Jan 2025 20:00:48 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Wed, 29 Jan 2025 19:36:12 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.14-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b2091a64820f068dd19b7dd5351d8095adb3e5f6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

