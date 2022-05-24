Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EB653222A
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 06:28:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336147.560474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntM8n-0007qb-0C; Tue, 24 May 2022 04:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336147.560474; Tue, 24 May 2022 04:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntM8m-0007o5-Tm; Tue, 24 May 2022 04:27:28 +0000
Received: by outflank-mailman (input) for mailman id 336147;
 Tue, 24 May 2022 04:27:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqfk=WA=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1ntM8l-0007nz-2Q
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 04:27:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf3eb72d-db19-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 06:27:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 889E4613CA;
 Tue, 24 May 2022 04:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB8F8C36AE5;
 Tue, 24 May 2022 04:27:22 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D5F42F03938; Tue, 24 May 2022 04:27:22 +0000 (UTC)
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
X-Inumbo-ID: cf3eb72d-db19-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653366443;
	bh=YWdB8/Incye7PGPIuU1l6D/SUgnj0rEJksuUsdYNgS0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gfJIFSv0Pi9cG72ePpJcDJ+SNwz6qGj3HuHRzyAOlfHuvvegNXPnxmFcgnQuFv7lo
	 iURcDll5Xe+3ZC8z64aw+Id70rjqYQ5ituWzRKQqrdmMrdzGwkWNR6Czb8IAzRmVlO
	 9VcC7r7e4ww8zb6P/B0nb/ldh0ICz3mbAfeAD/Ttr77LtoGUoDd0hDe16Q+RLKotym
	 hXjeLs3sBkGGjy+xsp0/olD+RbOpOuFUXmbV8HN+GmjRs8OY52qhZ0aOmo16hljl5o
	 FJyu8ilnPaGRRmdBjQYozS8lOdc2EE3ox4rcReBizocoT7bjosjToxBLkfSFroH0A3
	 PAGkQDRnq09QQ==
Subject: Re: [GIT PULL] xen: branch for v5.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220523053104.22814-1-jgross@suse.com>
References: <20220523053104.22814-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220523053104.22814-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.19-rc1-tag
X-PR-Tracked-Commit-Id: 5b3353949e89d48b4faf54a9cc241ee5d70df615
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d61306047533eb6f63a7bd51dfa7f868503bf0ba
Message-Id: <165336644287.29742.1454436360715375036.pr-tracker-bot@kernel.org>
Date: Tue, 24 May 2022 04:27:22 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Mon, 23 May 2022 07:31:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.19-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d61306047533eb6f63a7bd51dfa7f868503bf0ba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

