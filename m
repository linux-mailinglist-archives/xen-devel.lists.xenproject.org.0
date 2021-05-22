Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D0738D6AB
	for <lists+xen-devel@lfdr.de>; Sat, 22 May 2021 19:37:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131499.245747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lkVXZ-0005QM-MA; Sat, 22 May 2021 17:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131499.245747; Sat, 22 May 2021 17:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lkVXZ-0005OO-JA; Sat, 22 May 2021 17:35:57 +0000
Received: by outflank-mailman (input) for mailman id 131499;
 Sat, 22 May 2021 17:35:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x/j/=KR=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1lkVXX-0005OI-OA
 for xen-devel@lists.xenproject.org; Sat, 22 May 2021 17:35:55 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff590cad-e7ff-4c3b-81b6-f59705959183;
 Sat, 22 May 2021 17:35:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 47A7C608FE;
 Sat, 22 May 2021 17:35:54 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3B2A760A56;
 Sat, 22 May 2021 17:35:54 +0000 (UTC)
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
X-Inumbo-ID: ff590cad-e7ff-4c3b-81b6-f59705959183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621704954;
	bh=bTe8gb7C1Tw72t73ARNFscP7oBuHF6wXsRvNXuesbuc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TVydP3L3qVfMH92AlExNK1ilr0HrCCpT9e6ZDsy+jZi/Oxu73WjpZpsEEDkplcZVj
	 X4o675xGJJu0bb6dS3/vFDJnm8XKrI9F+xoCf1Y1aQg/THD0DrY10x1i3yyVTxt4MO
	 aWFSXs6GCiNGRvUMqYT6ReN+pDDjaiiiHTVAC6AarxNfSbIajp9ImZqMGmJ28g6GNk
	 51abzT4AwXkondkvOGS7PWufaE8jlWpwGYDJzJ1VqmFQ8949P9Y/KYoZS6sWjp/Tiq
	 Dl1RPMCN32n5NSC82eFTSrPWBpGe3uHj6dJSOiiZK97y21duZWjt7JsnVyHgitKRDi
	 T3SoUu/BSRXqQ==
Subject: Re: [GIT PULL] xen: branch for v5.13-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210522104743.10801-1-jgross@suse.com>
References: <20210522104743.10801-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210522104743.10801-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.13b-rc3-tag
X-PR-Tracked-Commit-Id: c81d3d24602540f65256f98831d0a25599ea6b87
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 23d729263037eddd7413535c68ccf9472a197ccd
Message-Id: <162170495423.3077.3254151684906859811.pr-tracker-bot@kernel.org>
Date: Sat, 22 May 2021 17:35:54 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Sat, 22 May 2021 12:47:43 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.13b-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/23d729263037eddd7413535c68ccf9472a197ccd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

