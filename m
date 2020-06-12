Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6F21F7D8C
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 21:26:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjpIw-0000Ji-7c; Fri, 12 Jun 2020 19:25:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3NgZ=7Z=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1jjpIv-0000Jd-00
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 19:25:29 +0000
X-Inumbo-ID: 7910b5ea-ace2-11ea-bb8b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7910b5ea-ace2-11ea-bb8b-bc764e2007e4;
 Fri, 12 Jun 2020 19:25:28 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.8-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591989927;
 bh=9q/une9GhfDWGBwqN44FN6ZXiUpeqgY8P7Aw4ywlCLk=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=OT/zUEBtmlewIZxiIRqXsIJKlJcbjk1ofiB89Q0qTMR/T9oyWu5Ia200ifvU+E3yb
 mRvRVeW4IZV0jqIYlYWx+fwMpj/tWgUCYVNyJDm+Vji5nyWRCobywtenz7SFhso86a
 R3OSF35VvmWMcuud3GNK2Nxt9qm8o0w+0uF+dSoA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200612053747.13750-1-jgross@suse.com>
References: <20200612053747.13750-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200612053747.13750-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.8b-rc1-tag
X-PR-Tracked-Commit-Id: a952f64d14e5f8461f04cd9d729037db9099ddb0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d2d5439df22f3c2a07c5db582d4ef1b2b587ca27
Message-Id: <159198992784.4050.12743890623621670472.pr-tracker-bot@kernel.org>
Date: Fri, 12 Jun 2020 19:25:27 +0000
To: Juergen Gross <jgross@suse.com>
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 torvalds@linux-foundation.org, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The pull request you sent on Fri, 12 Jun 2020 07:37:47 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.8b-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d2d5439df22f3c2a07c5db582d4ef1b2b587ca27

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

