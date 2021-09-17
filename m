Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31DD40FDEB
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 18:29:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189603.339394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRGkA-0002FV-Qd; Fri, 17 Sep 2021 16:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189603.339394; Fri, 17 Sep 2021 16:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRGkA-0002Dg-NG; Fri, 17 Sep 2021 16:29:42 +0000
Received: by outflank-mailman (input) for mailman id 189603;
 Fri, 17 Sep 2021 16:29:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j5MY=OH=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1mRGk9-0002DW-90
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 16:29:41 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74ddd350-17d4-11ec-b6e7-12813bfff9fa;
 Fri, 17 Sep 2021 16:29:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id F100861019;
 Fri, 17 Sep 2021 16:29:39 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EAEF960726;
 Fri, 17 Sep 2021 16:29:39 +0000 (UTC)
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
X-Inumbo-ID: 74ddd350-17d4-11ec-b6e7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631896180;
	bh=3hNpJBVLgBNsFzSfX3k7E2bkIa1y6yO1fC6HDXbuBH4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=s7iULun5C/kR5/GiKW9wJjaZvu1Ky75KLgmsEIpWYz1fgmENm9MueTTmg6cyiSLoS
	 28vX2EpQJu9xTvwDFr7N9uOJTOer5VWP053CERoEh/21FVgE02CKoi6jg2KlciTWnu
	 BG/vBVvbd88xEPgcitFE0X1sb4E+nGyzFPRe2S8P+EiANbH0scraDGLAj1tu0ijYun
	 ASev0Dr1LY63NrTinykSLRhKRyhhKBf4m/W7vJA3U4TJOXAL/Se7Zvg6n/ENNFnINv
	 EA57I0RLpPsH/vlER9KYif/sbQRj6AqfPB0poitYPwSrUOELX2RaVA4jwdskxNXr/n
	 +Fn6NCjiqOMog==
Subject: Re: [GIT PULL] xen: branch for v5.15-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210917113526.7963-1-jgross@suse.com>
References: <20210917113526.7963-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210917113526.7963-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.15b-rc2-tag
X-PR-Tracked-Commit-Id: d859ed25b24289c87a97889653596f8088367e16
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c6460daea23dcd160f2dc497c64b4c882ea1de69
Message-Id: <163189617995.30150.3872477863690937936.pr-tracker-bot@kernel.org>
Date: Fri, 17 Sep 2021 16:29:39 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Fri, 17 Sep 2021 13:35:26 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.15b-rc2-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c6460daea23dcd160f2dc497c64b4c882ea1de69

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

