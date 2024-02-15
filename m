Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422C1856E0E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 20:51:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681983.1061042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rahkP-0004ex-SM; Thu, 15 Feb 2024 19:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681983.1061042; Thu, 15 Feb 2024 19:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rahkP-0004cN-PB; Thu, 15 Feb 2024 19:50:17 +0000
Received: by outflank-mailman (input) for mailman id 681983;
 Thu, 15 Feb 2024 19:50:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NcNi=JY=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1rahkN-0004cE-PS
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 19:50:15 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6df3310a-cc3b-11ee-8a4e-1f161083a0e0;
 Thu, 15 Feb 2024 20:50:13 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 33C3FCE2800;
 Thu, 15 Feb 2024 19:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EA3CC433A6;
 Thu, 15 Feb 2024 19:50:07 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 078B5DCB6EC; Thu, 15 Feb 2024 19:50:07 +0000 (UTC)
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
X-Inumbo-ID: 6df3310a-cc3b-11ee-8a4e-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708026607;
	bh=dYG3ZJdb1V/Ktyl5Eml5x37N/Z+k7Tqs1pUPFJ1zkWw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=AbynkWgYYGbqxtjxaFZBHd++Mc8Qb0ySMGOmFZ1SpPbX+JcESEe64VJHAU7z+vQQk
	 G8z9bWyxi1QvSZHQG3o2CSwcPlFNFYwArbN26V0aO1S0FeT+fxUicoWfht+HxskhuB
	 VYSFdBT2RIon3xGhAgXjsMawx80pwB5ieIqKVKt3Kd+XrTTi5tgjGwtj4d5zR92Ufv
	 DwGJiu+FXYGU5NCld+z1sePz8Yo5ERhH8lSUwIFKqhjL82HM5zHkylAUTP+yD/psCT
	 pj7l7YZBS906+EBTL4fht9LVAHUZM9WL79pz3f+ydOjlr9zAc/3TSoxQVter8Z7T0L
	 zaRXNu0uVWp5A==
Subject: Re: [GIT PULL] xen: branch for v6.8-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240215152426.1114-1-jgross@suse.com>
References: <20240215152426.1114-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240215152426.1114-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.8a-rc5-tag
X-PR-Tracked-Commit-Id: fa765c4b4aed2d64266b694520ecb025c862c5a9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cc9c4f0b3113d513a94bcf489f2fa8cb9cc7c679
Message-Id: <170802660702.17476.18029040592555930591.pr-tracker-bot@kernel.org>
Date: Thu, 15 Feb 2024 19:50:07 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Thu, 15 Feb 2024 16:24:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.8a-rc5-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cc9c4f0b3113d513a94bcf489f2fa8cb9cc7c679

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

