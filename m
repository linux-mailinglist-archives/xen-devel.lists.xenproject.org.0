Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24B232DA68
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 20:32:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93379.176306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHtgS-0005Xf-Pn; Thu, 04 Mar 2021 19:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93379.176306; Thu, 04 Mar 2021 19:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHtgS-0005XK-Mn; Thu, 04 Mar 2021 19:30:52 +0000
Received: by outflank-mailman (input) for mailman id 93379;
 Thu, 04 Mar 2021 19:30:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5eeq=IC=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1lHtgR-0005XE-1H
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 19:30:51 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5129ac1e-7381-47fe-8ead-71ec9e44ea8b;
 Thu, 04 Mar 2021 19:30:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B341064F69;
 Thu,  4 Mar 2021 19:30:49 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AD9B5609E7;
 Thu,  4 Mar 2021 19:30:49 +0000 (UTC)
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
X-Inumbo-ID: 5129ac1e-7381-47fe-8ead-71ec9e44ea8b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614886249;
	bh=4rtOfSqDL97WN4x/xn30QBXaCjSeLCLfKZRLZt6gHNU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ahaqvYvHEFcb9v0j5D0p/JPVEtLvAvbIRMH4nzHQ1G10KSqUZ8d0lHspWyu06AXxV
	 fxFwtruwseYM39eGjnEs7dNItwgP802uwcLJLzN/2eyNM/hGHCHcmgjpmHEj5PFSLo
	 bBsZhQc280fSTfXE8+H904Rf3NV2bNJtdzSaMxAczgIjdUIxEOB1Oy3gLmW3+hpj47
	 19oeE9FkhJDqEqblgqrdIPdc5AYvV3ElMAcklsizfkJvcWY888qqvGeyE7uA2CEc6I
	 GhwMU21qIoNrGg5LNu0nUlFaWpHMmEp1Dr34iNnNWEEhCvRDc+ImycdLykGrLL4tfR
	 sGc2rSoM+FhOw==
Subject: Re: [GIT PULL] xen: branch for v5.12-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210304110053.8787-1-jgross@suse.com>
References: <20210304110053.8787-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210304110053.8787-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12b-rc2-tag
X-PR-Tracked-Commit-Id: 882213990d32fd224340a4533f6318dd152be4b2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c5a58f877ca645a3303f7a57476f2de837fdb97a
Message-Id: <161488624970.28500.3525125112340925480.pr-tracker-bot@kernel.org>
Date: Thu, 04 Mar 2021 19:30:49 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Thu,  4 Mar 2021 12:00:53 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12b-rc2-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c5a58f877ca645a3303f7a57476f2de837fdb97a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

