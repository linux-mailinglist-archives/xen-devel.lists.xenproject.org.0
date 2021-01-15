Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6982F84E6
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 19:58:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68549.122699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0UIN-0000iM-Uh; Fri, 15 Jan 2021 18:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68549.122699; Fri, 15 Jan 2021 18:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0UIN-0000hx-R3; Fri, 15 Jan 2021 18:58:03 +0000
Received: by outflank-mailman (input) for mailman id 68549;
 Fri, 15 Jan 2021 18:58:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PUbJ=GS=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1l0UIM-0000hs-9E
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 18:58:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a367712d-648a-488a-9db6-50af54ec8065;
 Fri, 15 Jan 2021 18:58:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 892EE23A5E;
 Fri, 15 Jan 2021 18:58:00 +0000 (UTC)
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 738D76017C;
 Fri, 15 Jan 2021 18:58:00 +0000 (UTC)
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
X-Inumbo-ID: a367712d-648a-488a-9db6-50af54ec8065
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610737080;
	bh=HEkd/F8arFC9JulepHMfJZb64EDMez6vnsE7h9EKwuU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FdS5n/UR3A7iwI+Pv24HsVTxkW2BLJpphlb+ch4MgEZo6Yx4NJJ742uqKSS42VU78
	 12QYfjd8vIZN4v5L8b2zUVSGIZd9cN1ns9YAcAoWmwuwSRo4HHGCotb0J3HdCMJojv
	 d7KMlBMHkHweqCe4WjkvWT5abXadAt/YwQAataNWMiXKn5zpqojS3pL06rueCk0vnm
	 UkbWK60aGkwwKPe1VUdwUzKP9V8aBUi431FLR1LN8CJX1B/P0f1CGCZTzunztAUJjF
	 JqnKg+FyQSrNhIztuE+LD0SdBiYnIPPcwG5JirxzvakEZwvJKPcopFwPBZyfHg05Eo
	 jhhTzD45DoTOg==
Subject: Re: [GIT PULL] xen: branch for v5.11-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210115143153.30040-1-jgross@suse.com>
References: <20210115143153.30040-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20210115143153.30040-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.11-rc4-tag
X-PR-Tracked-Commit-Id: 3d7746bea92530e8695258a3cf3ddec7a135edd6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dcda487c9c2e80ad177cdc34ae2068bbe5dada07
Message-Id: <161073708040.18503.9236409734942120807.pr-tracker-bot@kernel.org>
Date: Fri, 15 Jan 2021 18:58:00 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Fri, 15 Jan 2021 15:31:53 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.11-rc4-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dcda487c9c2e80ad177cdc34ae2068bbe5dada07

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

