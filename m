Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A71BD78BC38
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 02:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591883.924444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qams4-0005ZK-8g; Tue, 29 Aug 2023 00:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591883.924444; Tue, 29 Aug 2023 00:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qams4-0005X8-4S; Tue, 29 Aug 2023 00:46:16 +0000
Received: by outflank-mailman (input) for mailman id 591883;
 Tue, 29 Aug 2023 00:46:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PJvI=EO=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1qams3-0005X2-5T
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 00:46:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72a59e91-4605-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 02:46:13 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 377346118E;
 Tue, 29 Aug 2023 00:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F94FC433C8;
 Tue, 29 Aug 2023 00:46:09 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8D7C6C3274C; Tue, 29 Aug 2023 00:46:09 +0000 (UTC)
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
X-Inumbo-ID: 72a59e91-4605-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693269969;
	bh=L2PRBTeOKR+7M/QKw/98wz/qZ1tVlM9fzBUuu6iHO8E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=vQJFdNGh2r5F5XgNgEuF9lDi5F5MeaP9Dvof7FBr163nJKoJelF6FxljYjfCj2TfQ
	 mAsvGDxBkma5bafkaBmf5srXHfAzhtvkEocPLlIU8LKTlPutPtpKnqzo+DBTaFUhwA
	 fG32XUpsp7AsP7/597NYJHzcER64bSgSgJW0tOEdtYT5OqexPhiJWIN4GyDIWdAayZ
	 c7SMdukv6zuUEday3M+LhPC60E0Wjnw6OIPg+F6qmAEfDcvjJtltMbPTjgwhejj1XZ
	 j+5eoBlsFUk8NUym+3Y6ov87UK04+UF2eIUli36MaMjuxUebm/2a7X2vo4mpLwUdeP
	 bKdTuiKeSo4Kg==
Subject: Re: [GIT PULL] xen: branch for v6.6-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230824143626.10100-1-jgross@suse.com>
References: <20230824143626.10100-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230824143626.10100-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.6-rc1-tag
X-PR-Tracked-Commit-Id: f8941e6c4c712948663ec5d7bbb546f1a0f4e3f6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6383cb42ac01e6fb9ef6a035a2288786e61bdddf
Message-Id: <169326996957.22794.12711316433156812278.pr-tracker-bot@kernel.org>
Date: Tue, 29 Aug 2023 00:46:09 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Thu, 24 Aug 2023 16:36:26 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.6-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6383cb42ac01e6fb9ef6a035a2288786e61bdddf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

