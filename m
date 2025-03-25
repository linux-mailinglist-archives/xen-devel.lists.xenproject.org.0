Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4781EA70C6E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 22:55:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926966.1329779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txCEJ-0005co-SO; Tue, 25 Mar 2025 21:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926966.1329779; Tue, 25 Mar 2025 21:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txCEJ-0005bL-Pc; Tue, 25 Mar 2025 21:54:39 +0000
Received: by outflank-mailman (input) for mailman id 926966;
 Tue, 25 Mar 2025 21:54:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cNE8=WM=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1txCEI-0005bF-Ct
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 21:54:38 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdae3c73-09c3-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 22:54:36 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7D91943C37;
 Tue, 25 Mar 2025 21:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAAD7C4CEE4;
 Tue, 25 Mar 2025 21:54:34 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33EA2380DBFC; Tue, 25 Mar 2025 21:55:12 +0000 (UTC)
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
X-Inumbo-ID: bdae3c73-09c3-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742939674;
	bh=/1HExJHoJNml3mTtvjVeKL/OsCGNQlY8O681pHdx6F4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=taNddJe+Q8O8lJMOSl+m1+LVKRDvlwyJzfj+AAOaFrLBvzDbQFA1qhhz+myEUedS8
	 zsObomku4xGoTUKDRrEkMIf/LJvZDzpBzKABFL2LCxv3b37+mqRcRtw7Hy+ENcvdRr
	 ygP8Z1J4YO7qtrAJr15WTC/N2uozLTdMqD8biJf0zxgdo4NQ4piJDP3TsahNbuYBG9
	 Hhb3zD6GcB3L5KMbKPGowZU7uMrQtooZRQ6T88D3nPai9rjjYwWCazmVxjQdHV4x8R
	 y46sfQ2bcUwIdwHfhcfdMbF2GptYnBVsHln/FVYKc7wLdNn6Eurr6yHB44LKvikySp
	 tGZofpEmMZLEg==
Subject: Re: [GIT PULL] xen: branch for v6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250323102618.29516-1-jgross@suse.com>
References: <20250323102618.29516-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20250323102618.29516-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15-rc1-tag
X-PR-Tracked-Commit-Id: c3164d2e0d181027da8fc94f8179d8607c3d440f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dce3ab4c57e662ae019c22e7c2f2aa887617beae
Message-Id: <174293971067.745772.18284213114381644251.pr-tracker-bot@kernel.org>
Date: Tue, 25 Mar 2025 21:55:10 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Sun, 23 Mar 2025 11:26:18 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dce3ab4c57e662ae019c22e7c2f2aa887617beae

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

