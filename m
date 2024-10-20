Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 065B79A55FD
	for <lists+xen-devel@lfdr.de>; Sun, 20 Oct 2024 21:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822853.1236752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2bLg-0004wa-RL; Sun, 20 Oct 2024 19:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822853.1236752; Sun, 20 Oct 2024 19:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2bLg-0004ua-OU; Sun, 20 Oct 2024 19:12:20 +0000
Received: by outflank-mailman (input) for mailman id 822853;
 Sun, 20 Oct 2024 19:12:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P9Mf=RQ=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1t2bLf-0004uU-8E
 for xen-devel@lists.xenproject.org; Sun, 20 Oct 2024 19:12:19 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38ad39b7-8f17-11ef-a0be-8be0dac302b0;
 Sun, 20 Oct 2024 21:12:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D1E58A4039E;
 Sun, 20 Oct 2024 19:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94454C4CEC6;
 Sun, 20 Oct 2024 19:12:15 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADDB63805CC0; Sun, 20 Oct 2024 19:12:22 +0000 (UTC)
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
X-Inumbo-ID: 38ad39b7-8f17-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729451535;
	bh=gn+1A9Rw3cMyIwfsi6G6Z2rukd8IhTCYjZqddk9wZoA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=NnMKJ2vxHWZa7+3Hwt1I7h5jb/mocM1sdSZEHDTzxVYtVz7IMTdvXzm13mEDEH4tJ
	 hpA4igUjFTxHEVQA/zbd2IuqgCzpMZteRZCrMgEjs1uQyBHc+IOoChDW8iZJ8bH7mC
	 jdEDA/QyZsbzQgYZxS1s6ebgu4iABbh7VuvkxvMj89Tt1S/dzSiVq6OGmjvPvUEs9Z
	 GQnBUEmEWQbrlPVoc50RpMcizk594vnhE6xbu4QYmYGu/UOQHM3YXl70kYDCfxuCSi
	 40OZRmx2JViI0XtFpOLbTn2Zie85vzmXUZfzwbd0zTEdFzIN5XTk35LzgCe1aq+bdi
	 E42K4Dg9j7Uxw==
Subject: Re: [GIT PULL] xen: branch for v6.12-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241020100533.24289-1-jgross@suse.com>
References: <20241020100533.24289-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241020100533.24289-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.12a-rc4-tag
X-PR-Tracked-Commit-Id: 0fd2a743301b6b5eec0f407080f89bed98384836
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a5ee44c8297803efd36cd0c773d72687afdd7500
Message-Id: <172945154126.3627590.5231704990925009776.pr-tracker-bot@kernel.org>
Date: Sun, 20 Oct 2024 19:12:21 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Sun, 20 Oct 2024 12:05:33 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.12a-rc4-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a5ee44c8297803efd36cd0c773d72687afdd7500

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

