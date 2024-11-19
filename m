Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1279D1E4D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 03:32:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839647.1255430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDE1m-0006g3-UI; Tue, 19 Nov 2024 02:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839647.1255430; Tue, 19 Nov 2024 02:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDE1m-0006e4-RY; Tue, 19 Nov 2024 02:31:42 +0000
Received: by outflank-mailman (input) for mailman id 839647;
 Tue, 19 Nov 2024 02:31:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vLEs=SO=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1tDE1l-0006dv-Di
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 02:31:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66234808-a61e-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 03:31:37 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C8C185C5CEA;
 Tue, 19 Nov 2024 02:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B65BC4CECC;
 Tue, 19 Nov 2024 02:31:35 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33E723809A80; Tue, 19 Nov 2024 02:31:48 +0000 (UTC)
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
X-Inumbo-ID: 66234808-a61e-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjY2MjM0ODA4LWE2MWUtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTgzNDk3LjcyODc3OCwic2VuZGVyIjoicHItdHJhY2tlci1ib3RAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731983495;
	bh=DcRycOtiWzofjQackcuJsMNNRJZFf5batUiKIeIjTGM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ohG8TabBr07GkO5beMswccvk4DUHOTthPE1QMQ8kP9tXt3jUazbtB4Jf0S/yUFOxF
	 8d4DtMT/QwM7IKGyTq58uDhXUwzEXGeoOnxa3i/jFGmjq/A88WmLjPw4lvcDMDOOQQ
	 6z2RR6Q6JlKHF7AZx91ZIFaUEw0/vXcF7lQeEZP+RMulyREIYGuPSEWuO3r1oISnPW
	 GL/xH5IZw7t4E8CjdubSXEsa0Fun9vtEMy17HgqQZBbIk2dzgWwJhC1BzRrndCzB4+
	 kfKcFGWYqCLSKPCzotvmDWe+bI07If1PL7BFd7YphND9pMCEx/fk0n2pp77VVajKRX
	 PGr53z/mNQ7qw==
Subject: Re: [GIT PULL] xen: branch for v6.13-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241115162301.28457-1-jgross@suse.com>
References: <20241115162301.28457-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241115162301.28457-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.13-rc1-tag
X-PR-Tracked-Commit-Id: afc545da381ba0c651b2658966ac737032676f01
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 158f238aa69d91ad74e535c73f552bd4b025109c
Message-Id: <173198350689.78263.3549741561220661524.pr-tracker-bot@kernel.org>
Date: Tue, 19 Nov 2024 02:31:46 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri, 15 Nov 2024 17:23:01 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.13-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/158f238aa69d91ad74e535c73f552bd4b025109c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

