Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA425E7FBD
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 18:26:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410873.654013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oblV4-0001c8-W0; Fri, 23 Sep 2022 16:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410873.654013; Fri, 23 Sep 2022 16:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oblV4-0001Yf-SW; Fri, 23 Sep 2022 16:26:02 +0000
Received: by outflank-mailman (input) for mailman id 410873;
 Fri, 23 Sep 2022 16:26:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w5nw=Z2=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1oblV4-0001YZ-1M
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 16:26:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 687ce1e0-3b5c-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 18:26:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6D1662879;
 Fri, 23 Sep 2022 16:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 566B5C433D6;
 Fri, 23 Sep 2022 16:25:58 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3D3B1E4D03A; Fri, 23 Sep 2022 16:25:58 +0000 (UTC)
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
X-Inumbo-ID: 687ce1e0-3b5c-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663950358;
	bh=6/yGaslh/dWxXVkqzgI2Ad98VykwZ0oCykFFp4Op0dU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mwkx+tZTkiJZ751ZhEz9dTJAbsuX1oEKXQ9ePnGwk+CGKv07L7UHhJA1eTbyY1/2U
	 egmkaxwaMvTyZvJeq686QPAoeXk0MlSR0axayui2VfHeRBGw55xZwSE0gx5MBMbK8N
	 mTtffgToBjAuuV71nw2dHE/GKK3ZwtU0HJTP4UVvEyugk78tlcqBZUu+dWBo4JdbKV
	 ztzwLCxupIszpIW071AHdcWLqc4NJTALEgHDkinmZXfU+zIemamGNAbJcMkbgqjcK6
	 QFz/cRay04/8BDwZDmR5NbLEuNURjR3ek2IRTY4OVo1RIyE4659WdUeqmPqqQ+ppBI
	 OqQ1wEZ2V3C9w==
Subject: Re: [GIT PULL] xen: branch for v6.0-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220923084007.22001-1-jgross@suse.com>
References: <20220923084007.22001-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220923084007.22001-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.0-rc7-tag
X-PR-Tracked-Commit-Id: ce6b8ccdef959ba86b2711e090e84a987a000bf7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 526e8262856027cea38c45a5ff45fbe4204aed04
Message-Id: <166395035824.8411.4093321633967293739.pr-tracker-bot@kernel.org>
Date: Fri, 23 Sep 2022 16:25:58 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri, 23 Sep 2022 10:40:07 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.0-rc7-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/526e8262856027cea38c45a5ff45fbe4204aed04

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

