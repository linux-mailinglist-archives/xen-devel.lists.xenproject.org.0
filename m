Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E7536B849
	for <lists+xen-devel@lfdr.de>; Mon, 26 Apr 2021 19:48:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117848.223761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb5KH-0004g4-Pn; Mon, 26 Apr 2021 17:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117848.223761; Mon, 26 Apr 2021 17:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb5KH-0004fh-Mb; Mon, 26 Apr 2021 17:47:17 +0000
Received: by outflank-mailman (input) for mailman id 117848;
 Mon, 26 Apr 2021 17:47:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EtcY=JX=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1lb5KG-0004fc-9G
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 17:47:16 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec1f66e0-54b0-4458-86a7-930cdb74901e;
 Mon, 26 Apr 2021 17:47:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A37C161185;
 Mon, 26 Apr 2021 17:47:14 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 98C95609AE;
 Mon, 26 Apr 2021 17:47:14 +0000 (UTC)
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
X-Inumbo-ID: ec1f66e0-54b0-4458-86a7-930cdb74901e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619459234;
	bh=AkfP3c7uXWzzHU4ILsdwUMUtNDEsa+/IWcgMK4s9unY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Me8Wkv1My1rPOYbgcAJZhXjfFCFG+sgvXhaCspQg+74gnCNphEjnmq5flUEHNTYZc
	 7GFM7qhJRb7GQs2WczH60RYxL2/VnU1ZoJkQ2UNt8mumrJXjy7qj0DfiGrHGJhg3WB
	 82Jg5UDzl4MkWQaeW6QMm5jO0oN6UBmzHZeIrTIk6m72DjlMQJCsSTZTPuWe6PRu33
	 tYqz6ZNWpZEjeh2AHKTtEXLDvzst18DBq+RHALRdlSIVShjBycY/zRQsxQDvcrUfFP
	 9JhXCdPFyaZ20OSh6YFVIBBfcBqHfImI57uxe1CCD4C3Ekik1TxkW3WhaNOHFVds87
	 7OfbbGUKCnTXg==
Subject: Re: [GIT PULL] xen: branch for v5.13-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210426061618.22978-1-jgross@suse.com>
References: <20210426061618.22978-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20210426061618.22978-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.13-rc1-tag
X-PR-Tracked-Commit-Id: f5079a9a2a31607a2343e544e9182ce35b030578
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8e47c5f0e23234659daea78256bc1b04ea019a4b
Message-Id: <161945923456.30101.3675025824805536211.pr-tracker-bot@kernel.org>
Date: Mon, 26 Apr 2021 17:47:14 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Mon, 26 Apr 2021 08:16:18 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.13-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8e47c5f0e23234659daea78256bc1b04ea019a4b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

