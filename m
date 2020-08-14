Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43660244F41
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 22:43:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6gX5-0000c6-39; Fri, 14 Aug 2020 20:42:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cza9=BY=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1k6gX3-0000c1-Gu
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 20:42:33 +0000
X-Inumbo-ID: 7ca3122e-f60a-430a-885d-43cf64210048
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ca3122e-f60a-430a-885d-43cf64210048;
 Fri, 14 Aug 2020 20:42:32 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.9-rc1b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597437751;
 bh=ld1CD1D5bCWqOEzLyWc1OFNEOsxo4WZetS/hMlqUvNk=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=No5HZncuyM2OEwhwqc7/GW7HZ+0ksxI20rj0dqJ9o1fJztFrxGyyVZ12McMTIiSFk
 1ZN813nBjEBa/CBwW3VUJkukeXmbSAq/EqkLi7iD0xYVknky80+uPwnj/NinXH7FWC
 vNWoL/ua13Ld3hS3GQd/tiCoy3KFVhngO8adduaI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200814133939.21185-1-jgross@suse.com>
References: <20200814133939.21185-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200814133939.21185-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.9-rc1b-tag
X-PR-Tracked-Commit-Id: 585c6ed738a5ed2a6fd7662fa1d82f25acfa85de
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0520058d0578c2924b1571c16281f873cb4a3d2b
Message-Id: <159743775165.14792.6384919127435789166.pr-tracker-bot@kernel.org>
Date: Fri, 14 Aug 2020 20:42:31 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The pull request you sent on Fri, 14 Aug 2020 15:39:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.9-rc1b-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0520058d0578c2924b1571c16281f873cb4a3d2b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

