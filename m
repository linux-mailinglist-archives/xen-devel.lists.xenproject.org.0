Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C22647632
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 20:27:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457418.715325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3MXS-0004Om-Tx; Thu, 08 Dec 2022 19:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457418.715325; Thu, 08 Dec 2022 19:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3MXS-0004MX-RI; Thu, 08 Dec 2022 19:26:34 +0000
Received: by outflank-mailman (input) for mailman id 457418;
 Thu, 08 Dec 2022 19:26:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yg3i=4G=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1p3MXR-0004MR-Aq
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 19:26:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 360e39fe-772e-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 20:26:28 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 496D962025;
 Thu,  8 Dec 2022 19:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB810C433EF;
 Thu,  8 Dec 2022 19:26:28 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 902E5C433D7; Thu,  8 Dec 2022 19:26:28 +0000 (UTC)
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
X-Inumbo-ID: 360e39fe-772e-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670527588;
	bh=DdZqUnqbu/vwGb7Q89S/0orBvB9DweNPs8iPyoZSYzA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bFEoU8+hzNKtWtufjeEzKkbGYibH8waAj6FC4bFsxUiiIPouv8ArOR3vg98vYeAQS
	 J7u9W1g5kR3copMZpz+60oRQjoEIzxpQ5ClAtdEM/6Nfpe5vSqNHq0eTYAbQPoOhF/
	 5islXYGNABKcjoVpxybPKgqbPavMpa1A1oLGIKrnI98WKdZSubz3pThNYpifZ50qzN
	 Z5YZlVuFNfif4Ufkp/CW7RRiy3a5UzDGwO6DoNF/dNLh7/Znt7UrqsY/wV8YxK9Vdq
	 aCY3tdUi2aElcGTgsfDNloIJ+c2u5kMyH72Tn7N5pJu7cpmKlsPnUoO1KrJ0RMpaC6
	 YupcxslPwxueg==
Subject: Re: [GIT PULL] xen: branch for v6.1-rc9b
From: pr-tracker-bot@kernel.org
In-Reply-To: <20221208062404.29189-1-jgross@suse.com>
References: <20221208062404.29189-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20221208062404.29189-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-xsa-6.1-rc9b-tag
X-PR-Tracked-Commit-Id: 7dfa764e0223a324366a2a1fc056d4d9d4e95491
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a4c3a07e5b9ffb525435fedd94b5082c928e56dd
Message-Id: <167052758858.15249.5126504911011614864.pr-tracker-bot@kernel.org>
Date: Thu, 08 Dec 2022 19:26:28 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Thu,  8 Dec 2022 07:24:04 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-xsa-6.1-rc9b-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a4c3a07e5b9ffb525435fedd94b5082c928e56dd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

