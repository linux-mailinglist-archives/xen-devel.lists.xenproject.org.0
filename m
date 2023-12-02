Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16171801FD2
	for <lists+xen-devel@lfdr.de>; Sun,  3 Dec 2023 00:53:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646275.1008670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Zn1-000156-N3; Sat, 02 Dec 2023 23:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646275.1008670; Sat, 02 Dec 2023 23:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Zn1-00011z-JP; Sat, 02 Dec 2023 23:52:51 +0000
Received: by outflank-mailman (input) for mailman id 646275;
 Sat, 02 Dec 2023 23:52:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4Jt=HN=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1r9Zmz-00011s-Ha
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 23:52:49 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5015838-916d-11ee-98e5-6d05b1d4d9a1;
 Sun, 03 Dec 2023 00:52:47 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id EF28AB806A0;
 Sat,  2 Dec 2023 23:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8998CC433CB;
 Sat,  2 Dec 2023 23:52:45 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 71A79DFAA94; Sat,  2 Dec 2023 23:52:45 +0000 (UTC)
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
X-Inumbo-ID: e5015838-916d-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701561165;
	bh=GGIa3n94kqspY3wZ09hTkEhBVKQgLDRVe/WLvBfgyog=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=vKIFlWmWKpyTnv6FAwBIG37v+3D6T5smIZt3Mx7pmhw+sPbseKa4Dyq5e/D6b286k
	 8Y7mjMoQ+CZ8k7384R01Y+JIySwCYZSCp/irRr7EtAvlqbcqxajoI5LwlrV1Hfaxp9
	 eO1tlkt19UcabFH06nneB9bVL/OLpy0zQwhAaVrcAwXNJkCK3/Tysou3yvxiwD/Spm
	 8rtm2nHM/gvtjDn9wbIFzS40CUGzeaGXyl7vjRZ31iIhxVJTnQU1OYSz9wzB3hu/iW
	 Q4xliOTzyJTfyYIgzhSxMTzhaV5J/nvFoyuCcswh3SJXG8BKlwmG+m/ESlK6gsadql
	 EKWpcSTqw/iOw==
Subject: Re: [GIT PULL] xen: branch for v6.7-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20231202072359.30587-1-jgross@suse.com>
References: <20231202072359.30587-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20231202072359.30587-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.7a-rc4-tag
X-PR-Tracked-Commit-Id: 7f3da4b698bcc21a6df0e7f114af71d53a3e26ac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: deb4b9dd3b539c8331bbc0d64dff3b4fb57296ef
Message-Id: <170156116546.30388.4620138403094279812.pr-tracker-bot@kernel.org>
Date: Sat, 02 Dec 2023 23:52:45 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Sat,  2 Dec 2023 08:23:59 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.7a-rc4-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/deb4b9dd3b539c8331bbc0d64dff3b4fb57296ef

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

