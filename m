Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6082D35A788
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 22:00:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107953.206296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUxHw-0007Wc-OR; Fri, 09 Apr 2021 19:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107953.206296; Fri, 09 Apr 2021 19:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUxHw-0007WD-L4; Fri, 09 Apr 2021 19:59:32 +0000
Received: by outflank-mailman (input) for mailman id 107953;
 Fri, 09 Apr 2021 19:59:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KKV7=JG=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1lUxHv-0007W8-ME
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 19:59:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 375dd8ed-8373-40fb-bc6b-ccbcee9ad1f4;
 Fri, 09 Apr 2021 19:59:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6AA3561184;
 Fri,  9 Apr 2021 19:59:30 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 65D0360A71;
 Fri,  9 Apr 2021 19:59:30 +0000 (UTC)
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
X-Inumbo-ID: 375dd8ed-8373-40fb-bc6b-ccbcee9ad1f4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617998370;
	bh=sKFsK57M35vpO9M+JStoSq7YoMVlnP2N/Mbb2zUIi60=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PLHgK8NmMto+ubzVHkX5OJ3HWOa7O4ro2c+FDeaRRmBk1qO7Fo7a7ejOK4wU2D880
	 AlFi5e/HXiyqbOrXtDrm/3lROSfHkMF6CqEcpZE/IHBdtcV34R490rI8WuBMqetUnG
	 llNqt8d5D4a2GpEw3Oh11oFrNdxsh8fJKQeDea//fmp33k3OyknveLowoBBaFEjGIz
	 gcWj4E2lW5ydRYp6vVd93ZEMY+ghU3y+abDsoxDp9PE8f6WD4Z2WjKyCORQ2Gx3J0w
	 lussQgNMdKC+hW9aeE/rhxeB6yLYZkI4HXo71n1/jR+xyYRF2vrsyse8Y0MynVK+EJ
	 peri3MHWOWa+A==
Subject: Re: [GIT PULL] xen: branch for v5.12-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210409162704.27220-1-jgross@suse.com>
References: <20210409162704.27220-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210409162704.27220-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12b-rc7-tag
X-PR-Tracked-Commit-Id: d120198bd5ff1d41808b6914e1eb89aff937415c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0b76088799cc8db1ea9c626e54e7bc65f605e65f
Message-Id: <161799837041.7895.1597455149852009677.pr-tracker-bot@kernel.org>
Date: Fri, 09 Apr 2021 19:59:30 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Fri,  9 Apr 2021 18:27:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12b-rc7-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0b76088799cc8db1ea9c626e54e7bc65f605e65f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

