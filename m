Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6475D752C58
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 23:43:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563394.880625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK44C-0006LC-Ns; Thu, 13 Jul 2023 21:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563394.880625; Thu, 13 Jul 2023 21:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qK44C-0006Ht-L6; Thu, 13 Jul 2023 21:41:40 +0000
Received: by outflank-mailman (input) for mailman id 563394;
 Thu, 13 Jul 2023 21:41:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZdJ=C7=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1qK44B-0006Hl-IZ
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 21:41:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a404df8-21c6-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 23:41:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8905161B8A;
 Thu, 13 Jul 2023 21:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBBB3C433CC;
 Thu, 13 Jul 2023 21:41:33 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D7B58E29F42; Thu, 13 Jul 2023 21:41:33 +0000 (UTC)
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
X-Inumbo-ID: 0a404df8-21c6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689284494;
	bh=/F+dionR7vdp3SyJcv0WxofuWRapRmFADCuIWFBlP9g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=e243fUPTvPX3TRajQn9ZcybPZJeKiZe/onIWGrmYh1mv+apXg6v9M7/+Cn7yACnch
	 18Wis2rSvTPSLBIgXbOikfZEVNUU/AzYpuIh6b3AbFXXuComfJpRiIbFGRQN1Dr93a
	 cQfaMbxTLyNiMoB3c6eWZJsro7S171/huc4+vFWSPP52G5X+OI0ZLNFDG2smjve88g
	 0OJWqf/CFAIlpFpRdpnXvVHlrKFEmlkSKy9/UxHp/eZXgFmAMsaYbVrA8twvFgbEIu
	 HNDiWZhfKYNcycdtLfG9yw91M2yjcN2Vz1Luz1PGmCJtPoq3by+s88L39TB/EU8frF
	 FRUM4rANQYsIw==
Subject: Re: [GIT PULL] xen: branch for v6.5-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230713121542.4854-1-jgross@suse.com>
References: <20230713121542.4854-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20230713121542.4854-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.5-rc2-tag
X-PR-Tracked-Commit-Id: 21a235bce12361e64adfc2ef97e4ae2e51ad63d4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 15999328946bd778b7bbf57179ee871dd5279b04
Message-Id: <168928449387.12038.12724884070520325293.pr-tracker-bot@kernel.org>
Date: Thu, 13 Jul 2023 21:41:33 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Thu, 13 Jul 2023 14:15:42 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.5-rc2-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/15999328946bd778b7bbf57179ee871dd5279b04

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

