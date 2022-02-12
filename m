Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC2E4B36C4
	for <lists+xen-devel@lfdr.de>; Sat, 12 Feb 2022 18:17:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270818.465144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIw1N-0006PV-Rx; Sat, 12 Feb 2022 17:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270818.465144; Sat, 12 Feb 2022 17:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIw1N-0006MQ-OY; Sat, 12 Feb 2022 17:17:17 +0000
Received: by outflank-mailman (input) for mailman id 270818;
 Sat, 12 Feb 2022 17:17:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4/jW=S3=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1nIw1M-0006MK-Ok
 for xen-devel@lists.xenproject.org; Sat, 12 Feb 2022 17:17:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ec34492-8c27-11ec-b215-9bbe72dcb22c;
 Sat, 12 Feb 2022 18:17:14 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F1476112D;
 Sat, 12 Feb 2022 17:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AAD6C340ED;
 Sat, 12 Feb 2022 17:17:12 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 75161E6BB38; Sat, 12 Feb 2022 17:17:12 +0000 (UTC)
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
X-Inumbo-ID: 9ec34492-8c27-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644686232;
	bh=K9FxhrDSiUEfPIdtyrZQqRS7/xd1SjAvYu9qrqtjRFM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=IwQPEdhOPywW3Jsg6ZA196lwmukcmkusvnsvjebABmWwagXViKLE5j71nVcECbJjH
	 7kPKWGUlGawJbySO2qemnX8zHyBVK0THD/NjyUeDjq6w5wagB4xdHjTALUxIWKpM5t
	 erKG2HG9gx2YQghwcJz4zfm9WmWiaArk+9CTUHSSjZ8NeJ0u7x4zO0BPzgX/Tj0nYO
	 /gYlYz3oq/Bhf7+YsB4Z8aBTdeOoV4Ul8E5tPtYzAZYMh/LfppOxqpz943hNFulzfn
	 sPP6QBYnX4da6ykk9Vb2XU1YLFC2Eh9skY5Kv1hVAA6qk3Z/6LAfLjEBKHQMGA14SA
	 cxZ0spG0HWoWA==
Subject: Re: [GIT PULL] xen: branch for v5.17-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220212102509.24629-1-jgross@suse.com>
References: <20220212102509.24629-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220212102509.24629-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.17a-rc4-tag
X-PR-Tracked-Commit-Id: f66edf684edcb85c1db0b0aa8cf1a9392ba68a9d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a387c98b3abc7cf9a2281f01f9b4dd7dbc48f65
Message-Id: <164468623247.20961.11131810270936389812.pr-tracker-bot@kernel.org>
Date: Sat, 12 Feb 2022 17:17:12 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Sat, 12 Feb 2022 11:25:09 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.17a-rc4-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a387c98b3abc7cf9a2281f01f9b4dd7dbc48f65

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

