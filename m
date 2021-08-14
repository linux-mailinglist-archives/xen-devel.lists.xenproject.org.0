Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4453EC3E6
	for <lists+xen-devel@lfdr.de>; Sat, 14 Aug 2021 18:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167018.304860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEwg0-0004Uv-I0; Sat, 14 Aug 2021 16:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167018.304860; Sat, 14 Aug 2021 16:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEwg0-0004T6-Dx; Sat, 14 Aug 2021 16:38:28 +0000
Received: by outflank-mailman (input) for mailman id 167018;
 Sat, 14 Aug 2021 16:38:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k0b7=NF=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1mEwfz-0004T0-F6
 for xen-devel@lists.xenproject.org; Sat, 14 Aug 2021 16:38:27 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bb0a7f3-fd1e-11eb-a3ad-12813bfff9fa;
 Sat, 14 Aug 2021 16:38:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8AE8160F48;
 Sat, 14 Aug 2021 16:38:25 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7626060A4D;
 Sat, 14 Aug 2021 16:38:25 +0000 (UTC)
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
X-Inumbo-ID: 0bb0a7f3-fd1e-11eb-a3ad-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628959105;
	bh=SxWq7pHIT4K1dHKgYgPBmmsWYv4UTB9/RSUM/XQtUNY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qXBdScxnl9wiVZGAB2J5fiVfY6KY4bu0FhcRAaFSsSzlgQYfgPs84MBO/FAotjMY0
	 aQi0y/HkLlLp+vyc4MclKc+r3bCxANcUwOKTs1uR+y6t0fedAiAHEumAdcYMqQ3ErQ
	 3eVPgBteCsTl0+fBE9FHnadBF+KhGtnrUV3JwZpQ1KrtMhs53UDohY7PSuXNMic1cz
	 pbrBnmtecNdGywl2bBbbKCZazyGjvm5/x1YdhSoyKQ4+AGcJ+jeKetWQusb1t712wT
	 dr/9QVBtdwMbZLJUjmZhfYrVYT6Wwwk1sAvWiuQEjhr411Gq5sb32tpWh4XK73ZnIi
	 twVO//utXgvFA==
Subject: Re: [GIT PULL] xen: branch for v5.14-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210814084413.12168-1-jgross@suse.com>
References: <20210814084413.12168-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20210814084413.12168-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.14-rc6-tag
X-PR-Tracked-Commit-Id: 88ca2521bd5b4e8b83743c01a2d4cb09325b51e9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ba31f97d43be41ca99ab72a6131d7c226306865f
Message-Id: <162895910542.32142.3445606001241634698.pr-tracker-bot@kernel.org>
Date: Sat, 14 Aug 2021 16:38:25 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Sat, 14 Aug 2021 10:44:13 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.14-rc6-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ba31f97d43be41ca99ab72a6131d7c226306865f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

