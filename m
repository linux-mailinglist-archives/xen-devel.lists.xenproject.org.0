Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFC46F0FA4
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 02:32:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527113.819367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psC1R-00057S-EQ; Fri, 28 Apr 2023 00:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527113.819367; Fri, 28 Apr 2023 00:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psC1R-000547-BA; Fri, 28 Apr 2023 00:31:37 +0000
Received: by outflank-mailman (input) for mailman id 527113;
 Fri, 28 Apr 2023 00:31:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQRl=AT=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1psC1P-000541-M7
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 00:31:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 066fa2e6-e55c-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 02:31:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 18A84640A3;
 Fri, 28 Apr 2023 00:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DDC1C4339B;
 Fri, 28 Apr 2023 00:31:31 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6C499E5FFC8; Fri, 28 Apr 2023 00:31:31 +0000 (UTC)
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
X-Inumbo-ID: 066fa2e6-e55c-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682641891;
	bh=yQBYUeEWds65eDsZqLypvvncMG/gMCNpVIptuh3Jl/g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YxWqsX6TehvwKrSgrxe+kUpRIgAiJCIU2WhF2l4yoaJs5+7zCj5+ydh9LTP+AIm+R
	 RmhxgO738sIFjNJZGStvbF497mhkm3c4qOffKLqN11TAUPv4noc3n08C9vkvQAUFOE
	 SmA/f2OAaasA3WDMm3Td6p8n4dOt+JwahcGYp3Y9m/XCEbtwO3iGDqunzGrWETA3Q/
	 FsxDX/qswRkps/sZYAaqT87SzsPePvSHooI2+HtoSq9PgRDSieKoAZb2YrlnzptfXy
	 11EE6cuT+pf6I8PW7nls/O2v4tNbEtM3Tp+gXcXpXj2v7G0NtOHIouSBSS3Z2wPKp5
	 GzKJMX6v7dxZQ==
Subject: Re: [GIT PULL] xen: branch for v6.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230427073808.12580-1-jgross@suse.com>
References: <20230427073808.12580-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230427073808.12580-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.4-rc1-tag
X-PR-Tracked-Commit-Id: cbfac7707ba16619006a4fd60faac46303fd2f3e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 35fab9271b7e6d193b47005c4d07369714db4fd1
Message-Id: <168264189143.7031.13138758191360122835.pr-tracker-bot@kernel.org>
Date: Fri, 28 Apr 2023 00:31:31 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Thu, 27 Apr 2023 09:38:08 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.4-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/35fab9271b7e6d193b47005c4d07369714db4fd1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

