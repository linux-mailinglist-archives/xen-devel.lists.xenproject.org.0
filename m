Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A144581CD48
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 17:52:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659664.1029373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGikl-0005OY-RN; Fri, 22 Dec 2023 16:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659664.1029373; Fri, 22 Dec 2023 16:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGikl-0005Lt-Nw; Fri, 22 Dec 2023 16:52:03 +0000
Received: by outflank-mailman (input) for mailman id 659664;
 Fri, 22 Dec 2023 16:52:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c4ps=IB=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1rGikk-0005Lk-GH
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 16:52:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c009849-a0ea-11ee-9b0f-b553b5be7939;
 Fri, 22 Dec 2023 17:52:00 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 106C061CAF;
 Fri, 22 Dec 2023 16:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4C34C433C8;
 Fri, 22 Dec 2023 16:51:57 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9AAB3C41620; Fri, 22 Dec 2023 16:51:57 +0000 (UTC)
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
X-Inumbo-ID: 6c009849-a0ea-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703263917;
	bh=Ue0MdyT4SH0otrhoJ4cn6K6f1XRqgoWtWCM044adwBM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=IPelxh78Ii2g3sMi43ewXSCXIUrYX3hBFJ/k7ui9zDfTv55HWFRZvrQJRAzyl+z5S
	 HvtfiBw739wX3AZqeLOVXkxevPe4keyqG2XT7N+hQkdPGcW03qU5xIeYn1I0xZdG26
	 JVZ6IJXbnLKtkUoIU/6t1syI6h6fMJrixaAKi4L77gxJL8rEQRFoWYu0ddcCOzoKYi
	 9uhlGwweJiO2ftsZmpTysj+TW71ubXgN1VtcPsaeR4CHjLsnyq7UswKYjlp2i7Poxn
	 78vnbwp0oDoVF9z1SKZMMT2DoXHIpl9O2gpqTQ6bXtXYivAQ1m0Hd29hJq0ydvLLTB
	 GLYTnYnyAYGuw==
Subject: Re: [GIT PULL] xen: branch for v6.7-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20231222063415.17316-1-jgross@suse.com>
References: <20231222063415.17316-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20231222063415.17316-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.7a-rc7-tag
X-PR-Tracked-Commit-Id: 93cd0597649844a0fe7989839a3202735fb3ae67
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b7bc7bce88bdf52ec2b47c576fb51269a521bd9a
Message-Id: <170326391762.6925.1618445001287059665.pr-tracker-bot@kernel.org>
Date: Fri, 22 Dec 2023 16:51:57 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri, 22 Dec 2023 07:34:15 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.7a-rc7-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b7bc7bce88bdf52ec2b47c576fb51269a521bd9a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

