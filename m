Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D830034ED08
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 18:02:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103627.197651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRGoR-0000Vy-18; Tue, 30 Mar 2021 16:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103627.197651; Tue, 30 Mar 2021 16:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRGoQ-0000VX-UG; Tue, 30 Mar 2021 16:01:50 +0000
Received: by outflank-mailman (input) for mailman id 103627;
 Tue, 30 Mar 2021 16:01:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O93x=I4=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1lRGoP-0000VQ-Aq
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 16:01:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0f0eb29-f1e8-436f-9d1c-72c4b3ff099c;
 Tue, 30 Mar 2021 16:01:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BBA3A60241;
 Tue, 30 Mar 2021 16:01:47 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A561C609B5;
 Tue, 30 Mar 2021 16:01:47 +0000 (UTC)
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
X-Inumbo-ID: b0f0eb29-f1e8-436f-9d1c-72c4b3ff099c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617120107;
	bh=cidM7CHT6cFz1eFkeyxoQwsO3HgPGtDYuG1vU+RyH2g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Pu+S4VhO9/5fNqvxZCOzQ8B3uUUeWvl6T9HMpaH3qcyz7cQS0yv3MCQY0CbZJo0Bw
	 9/eqvmb83JnHtc8nome7qp/CJo0KTaYZJOC07fvT1bW/d/zc/xyOENXCX1vesOtq4r
	 JVnMAzDcjjrnZhdDrYSnxvSzHC2auvPKu2tHXy/FnHzTXT0bd+UnBJT6ZCTvReX4rz
	 LJ1T/LT0dknAd8iEiXSZ6h4N3snB9XCr0dcAg+cJGDntiWotgatU5GYe36UNqQZe8g
	 Qe0pWmfwJASOIx+PA6C+xmNJAnyOEtDCc/W9zR/N7MYCl3queDv/cIer+dNH6wJbZn
	 menxPBVDhQBzw==
Subject: Re: [GIT PULL] xen: branch for v5.12-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210330120337.4404-1-jgross@suse.com>
References: <20210330120337.4404-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210330120337.4404-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12b-rc6-tag
X-PR-Tracked-Commit-Id: a846738f8c3788d846ed1f587270d2f2e3d32432
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a080642d2f831cc34b68663c0db1c447d3807421
Message-Id: <161712010761.23792.17653647991255711385.pr-tracker-bot@kernel.org>
Date: Tue, 30 Mar 2021 16:01:47 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Tue, 30 Mar 2021 14:03:37 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12b-rc6-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a080642d2f831cc34b68663c0db1c447d3807421

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

