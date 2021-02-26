Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F61C3266EA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 19:32:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90558.171477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFhuT-0006IH-CB; Fri, 26 Feb 2021 18:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90558.171477; Fri, 26 Feb 2021 18:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFhuT-0006Hs-9I; Fri, 26 Feb 2021 18:32:17 +0000
Received: by outflank-mailman (input) for mailman id 90558;
 Fri, 26 Feb 2021 18:32:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DeEJ=H4=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1lFhuS-0006Hn-2P
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 18:32:16 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68878fca-0d0a-4c93-b298-212e2fabfb4a;
 Fri, 26 Feb 2021 18:32:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6A96964F2D;
 Fri, 26 Feb 2021 18:32:14 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 66EFC609D0;
 Fri, 26 Feb 2021 18:32:14 +0000 (UTC)
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
X-Inumbo-ID: 68878fca-0d0a-4c93-b298-212e2fabfb4a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614364334;
	bh=PctlNHE6xIGwxBRhX63v/+sbNK+dVx7QqNsavwojU3Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Q+QiWlfpNXrUOkwGjFrF0Op2A35Nz4ytnCiUDg89IGTzvdmJV16/XioWxccv4fPo4
	 kho2xjpvWsdRrBeYxeIrHnQ6MaNTB3n5au/y/p7Dq5gtFO3d72IxLRU8MGPBdYivMX
	 s7XQI7CE/s496v8uurasKhjgQKv7JYoS20HB/GA+2AXJQ1U27V9P6EH7xTMXjLlMNZ
	 bOho3B09HGVGiA7hNIoV+yPvDaTB+ztYZDb4GHY7Py+NOJ/ayVr9qUC4Q4uX/SLXFq
	 6hnx3vhjn++WhBpUebYhijumozbccj8oCfcY1TC8ACchaX4K0Obaww9WRAoSKkjpBz
	 zLYL4verzAb5Q==
Subject: Re: [GIT PULL] xen: branch for v5.12-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210226131641.4309-1-jgross@suse.com>
References: <20210226131641.4309-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210226131641.4309-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12b-rc1-tag
X-PR-Tracked-Commit-Id: 53f131c284e83c29c227c0938926a82b2ed4d7ba
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5c2e7a0af211cb7a3a24fcfe98f0ceb67560b53b
Message-Id: <161436433441.9780.2149169069373607984.pr-tracker-bot@kernel.org>
Date: Fri, 26 Feb 2021 18:32:14 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Fri, 26 Feb 2021 14:16:41 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12b-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5c2e7a0af211cb7a3a24fcfe98f0ceb67560b53b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

