Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5F539FDC4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 19:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138851.256825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqfaM-00009r-M4; Tue, 08 Jun 2021 17:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138851.256825; Tue, 08 Jun 2021 17:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqfaM-00006v-J3; Tue, 08 Jun 2021 17:32:18 +0000
Received: by outflank-mailman (input) for mailman id 138851;
 Tue, 08 Jun 2021 17:32:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2lsH=LC=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1lqfaL-00006p-RP
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 17:32:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 625e96c5-5f94-478e-a662-00c2d987c32a;
 Tue, 08 Jun 2021 17:32:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 951F66108E;
 Tue,  8 Jun 2021 17:32:16 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 84738609E4;
 Tue,  8 Jun 2021 17:32:16 +0000 (UTC)
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
X-Inumbo-ID: 625e96c5-5f94-478e-a662-00c2d987c32a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623173536;
	bh=S1YrODTluW3llQrhVD7txCHxoXFiqcDLpH0NRLN4lUM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=recBOmloRnskA0nKPOr9tZstnpmTjL2V7yvZQ9GOOqCUJg1zVDuIso8Jwneu1x1J8
	 xEQxJPcVHDURA8RVvJosNkT4qsWkrSpGPhSdTtptRdIGlnUw3M/8tEhLm2KlfZvLp6
	 +4H+zmIGMhUWCTg480z9n5vWnT+DtGZ34W14JiIY2KEprvdmY9m8LMxlPBTv0Cq22E
	 coHjU/KGx80IwMJn2cFxELsEc981aps9x7cTVaWLQI2+NlP9U/BBcj4tpC3kEuBbRT
	 ZaGnBa4yBhR7inJmQYk7SDkK35PRwa3Sw0XkY9tRmmO9EKKi4xPCuFSLqB1lkvZDOn
	 fmvXJOtpnoZSg==
Subject: Re: [GIT PULL] xen: branch for v5.13-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210608170253.13602-1-jgross@suse.com>
References: <20210608170253.13602-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210608170253.13602-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.13b-rc6-tag
X-PR-Tracked-Commit-Id: 107866a8eb0b664675a260f1ba0655010fac1e08
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 368094df48e680fa51cedb68537408cfa64b788e
Message-Id: <162317353647.21484.13422862216864483190.pr-tracker-bot@kernel.org>
Date: Tue, 08 Jun 2021 17:32:16 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Tue,  8 Jun 2021 19:02:53 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.13b-rc6-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/368094df48e680fa51cedb68537408cfa64b788e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

