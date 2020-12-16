Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CDB2DC79B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 21:16:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55582.96750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpdDv-0004QD-8V; Wed, 16 Dec 2020 20:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55582.96750; Wed, 16 Dec 2020 20:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpdDv-0004Po-5L; Wed, 16 Dec 2020 20:16:35 +0000
Received: by outflank-mailman (input) for mailman id 55582;
 Wed, 16 Dec 2020 20:16:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BvyZ=FU=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1kpdDt-0004Pj-KH
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 20:16:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62ddce1c-6b13-4e30-8fd6-4c1485986fc0;
 Wed, 16 Dec 2020 20:16:32 +0000 (UTC)
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
X-Inumbo-ID: 62ddce1c-6b13-4e30-8fd6-4c1485986fc0
Subject: Re: [GIT PULL] xen: branch for v5.11-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608149792;
	bh=WmvOvSHb+S4MEfDf4FDvtuOcycVfyBfLfxYt/7dEbqE=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=sbTo8Pu/8B6VP/I4Q+uo+QgmEF37N3agNCMau5MSMHQEmJziEF+dKx4UNeyUmiOCV
	 n6YAtpOMungGOeyPit3YKcMbQVmgPgwqsX4YMy3AQFa5Pp+2eT3xf9sfxkvfot69LY
	 vhg8kwpqwS+a2puZcXn0K0oigK0c9LZMGFiFY2yTo55SjnKZmwA4JqIEz8FnLWgHGz
	 Y34krmmS4Y166UqNGYsOozBQX6wOfizY4RSVSfT4f1nfDlAOJTCIpHYmHtHYNo5I7n
	 6aEqAJAk+69iud3uhDPmecICoHN/YuM3aDUjCjr2IvcNR0PM/J21htvoll5C22YCRa
	 z3q3KzcUXrlNw==
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201215122606.6874-1-jgross@suse.com>
References: <20201215122606.6874-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20201215122606.6874-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.11-rc1-tag
X-PR-Tracked-Commit-Id: 1c728719a4da6e654afb9cc047164755072ed7c9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7acfd4274e26e05a4f12ad31bf331fef11ebc6a3
Message-Id: <160814979215.31129.10861518322757012100.pr-tracker-bot@kernel.org>
Date: Wed, 16 Dec 2020 20:16:32 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Tue, 15 Dec 2020 13:26:06 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.11-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7acfd4274e26e05a4f12ad31bf331fef11ebc6a3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

