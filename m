Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1C22FDA3E
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 20:58:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71735.128713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Jcb-0002Ez-KG; Wed, 20 Jan 2021 19:58:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71735.128713; Wed, 20 Jan 2021 19:58:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Jcb-0002Ea-Gn; Wed, 20 Jan 2021 19:58:29 +0000
Received: by outflank-mailman (input) for mailman id 71735;
 Wed, 20 Jan 2021 19:58:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zx4O=GX=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1l2Jca-0002ET-9O
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 19:58:28 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cd37954-b0dc-4743-8ab4-2cde834426b1;
 Wed, 20 Jan 2021 19:58:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EB38D23440;
 Wed, 20 Jan 2021 19:58:26 +0000 (UTC)
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id D4B6C604FC;
 Wed, 20 Jan 2021 19:58:26 +0000 (UTC)
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
X-Inumbo-ID: 3cd37954-b0dc-4743-8ab4-2cde834426b1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611172707;
	bh=8Gt5nD+hiWgiOiVulIE8p1fTb/Qv1s/EF0Jm9eW7lS4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QKA8ghcwZ/GEMcruoZ4DmDvoKa4pMvEo5PiAzIXujhp8h2nkS1SwmmacMEVbkzPIx
	 DSgLdlB7g2e4HRkKDbMdl3X5qyHBDthMjqCP+aakujqyjyfEdIHYFi75+yMxiPKWpM
	 FBOHELx9eWp1G/1h8mwHMoPdR0J8qnmrf43eaYh6kDtHsN2COmzWIxxLTgUz1duRXA
	 xQTZ1K5ON0mBxKDW0KadQ5Eb/QJVzlGaAlqCM58kCHYUsSAvJ3Lrm02rkzlIx+LhO3
	 3lZDbVIyVO5R63I4IAONL1zhmaeejnaa2e6uSWV8Gsav9BN2lsozc1pnYQXcaX/hOa
	 05WUYeL+t1HnQ==
Subject: Re: [GIT PULL] xen: branch for v5.11-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210120150157.5289-1-jgross@suse.com>
References: <20210120150157.5289-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210120150157.5289-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.11-rc5-tag
X-PR-Tracked-Commit-Id: bd9dcef67ffcae2de49e319fba349df76472fd10
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2e4ceed606ba4942f632d097f70696543fe98d8e
Message-Id: <161117270679.2860.10704382342128586934.pr-tracker-bot@kernel.org>
Date: Wed, 20 Jan 2021 19:58:26 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Wed, 20 Jan 2021 16:01:57 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.11-rc5-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2e4ceed606ba4942f632d097f70696543fe98d8e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

