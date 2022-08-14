Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CEA59259C
	for <lists+xen-devel@lfdr.de>; Sun, 14 Aug 2022 18:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386819.622817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNGpY-0008VW-Fi; Sun, 14 Aug 2022 16:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386819.622817; Sun, 14 Aug 2022 16:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNGpY-0008Ti-Cs; Sun, 14 Aug 2022 16:51:16 +0000
Received: by outflank-mailman (input) for mailman id 386819;
 Sun, 14 Aug 2022 16:51:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tLax=YS=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1oNGpW-0008Ta-T6
 for xen-devel@lists.xenproject.org; Sun, 14 Aug 2022 16:51:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dd7a737-1bf1-11ed-bd2e-47488cf2e6aa;
 Sun, 14 Aug 2022 18:51:13 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9F3160CF6;
 Sun, 14 Aug 2022 16:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39C65C43140;
 Sun, 14 Aug 2022 16:51:11 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 267BFC43143; Sun, 14 Aug 2022 16:51:11 +0000 (UTC)
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
X-Inumbo-ID: 4dd7a737-1bf1-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660495871;
	bh=5x12jWQWyCom/Z75nAFf+f/Xg2dyhKKUKlNARGN2oJY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Kxo54Rom+NvcgUo/FOWtYZhO70vQriHgk2fU89wrb4wmSMmGLGH6JyHPNrI3Sd26L
	 s73ktgKR2gFLXevvbzVwzeGOcDSfbYtbANDv4VnyKtKATDmXhU2lTUX8R1wHtzl+uS
	 yDJwP8/RXNBaPlVh/DLM2XnsdZZ0Sd2AR/o8Zlk0aKNi3l6MkTOEpeeozkc8qBIwIp
	 dUFSJMGIZWDWQlJfjhcSsdJHkibcB1H/urkgzMwje7fbuYeVSMH9D+lwY1MfHvTSa0
	 bwx8fbPJGwQd5aFlOWc2wzy7nBTS/6Sia/2TP63ujy+Zncrntgcs7X0CLPED1+sEKi
	 OB8ZVRx5ZjApw==
Subject: Re: [GIT PULL] xen: 2nd round of patches for 6.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220814090737.29335-1-jgross@suse.com>
References: <20220814090737.29335-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220814090737.29335-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.0-rc1b-tag
X-PR-Tracked-Commit-Id: 5ad3134dcf5201c4d51c981e52557939256b02c7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5d6a0f4da9275f6c212de33777778673ba91241a
Message-Id: <166049587115.14047.8177190261062229682.pr-tracker-bot@kernel.org>
Date: Sun, 14 Aug 2022 16:51:11 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Sun, 14 Aug 2022 11:07:37 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.0-rc1b-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5d6a0f4da9275f6c212de33777778673ba91241a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

