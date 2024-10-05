Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4EE991940
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2024 20:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811039.1223695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx9Bx-0007KJ-7r; Sat, 05 Oct 2024 18:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811039.1223695; Sat, 05 Oct 2024 18:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx9Bx-0007H6-37; Sat, 05 Oct 2024 18:07:45 +0000
Received: by outflank-mailman (input) for mailman id 811039;
 Sat, 05 Oct 2024 18:07:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qT++=RB=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1sx9Bv-0007H0-6s
 for xen-devel@lists.xenproject.org; Sat, 05 Oct 2024 18:07:43 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5dd9977-8344-11ef-a0bb-8be0dac302b0;
 Sat, 05 Oct 2024 20:07:41 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4D30FA40840;
 Sat,  5 Oct 2024 18:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729A3C4CEC2;
 Sat,  5 Oct 2024 18:07:39 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7109D3806656; Sat,  5 Oct 2024 18:07:44 +0000 (UTC)
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
X-Inumbo-ID: b5dd9977-8344-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728151659;
	bh=kOk1mEifP5ATm7KsX2A7pW+Oe5vTm9hLLRMZ9JhqF+w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YpzSyoIoqU49nCLEjAXb0xYnAFxItNRqMoE1lQOHBcWx9tHUmLzMdgon4LCsrLwnP
	 hhTDtnTNtDwbK61fncNLEF/3CgYzsrdRwsNkbTw5uwd0d2qKenSOBdUor7QXvWL7dC
	 Q2JvR9MfZhWG8V5JZzck8aJu8KU690rzaZTKDFEX6DYyZY9+M78Q+4wPmPMN8/iRvH
	 Mut6OgxqLblN9g1+3cJvJ4nZW+ZjotNXFHQe6n4Bs6LVtrelQrOXCL75Jl4RnlICTj
	 v40uhpBwbnJLf2vRTOXcjVAzb8yoWjAYZbeYcpQ+ofT7GU9nsQWeO6atAhPwlrb017
	 Jx0dfLgIiZTXQ==
Subject: Re: [GIT PULL] xen: branch for v6.12-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241005150431.12546-1-jgross@suse.com>
References: <20241005150431.12546-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20241005150431.12546-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.12a-rc2-tag
X-PR-Tracked-Commit-Id: 9af48210ea5f1539e1999154b0acd343efdb370b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fc20a3e57247e21e1bd582f604b20bf898f7d111
Message-Id: <172815166291.3145223.6038597083348976320.pr-tracker-bot@kernel.org>
Date: Sat, 05 Oct 2024 18:07:42 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Sat,  5 Oct 2024 17:04:31 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.12a-rc2-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fc20a3e57247e21e1bd582f604b20bf898f7d111

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

