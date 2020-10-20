Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EDE2940C9
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 18:46:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9730.25643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUulv-00010y-3m; Tue, 20 Oct 2020 16:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9730.25643; Tue, 20 Oct 2020 16:46:03 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUulv-00010Z-0Z; Tue, 20 Oct 2020 16:46:03 +0000
Received: by outflank-mailman (input) for mailman id 9730;
 Tue, 20 Oct 2020 16:46:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C0Jl=D3=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1kUult-00010U-7m
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 16:46:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78497dd5-d72f-44df-8ae6-6193ebe13954;
 Tue, 20 Oct 2020 16:46:00 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=C0Jl=D3=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
	id 1kUult-00010U-7m
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 16:46:01 +0000
X-Inumbo-ID: 78497dd5-d72f-44df-8ae6-6193ebe13954
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 78497dd5-d72f-44df-8ae6-6193ebe13954;
	Tue, 20 Oct 2020 16:46:00 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.10-rc1b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603212359;
	bh=0uoEpXADZJVCdJfgfoNUy1KQNOLib6qZkZ6gL0UTJug=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=Kdw5wA9Blt4AX6Kc2sijE5AWBlZsMrLIoyB2x2qWPqIZgiumNhIKctaOPMn5/WSAq
	 UMKLBS4qoVnPfV1EQ6XXq6o/Xc5hCrZijXA4OLaxsCO2W0cKqjt9kESt4HWtIXbQcQ
	 kies03Bh2QTUPO5FGGuFuCnfFhsMrsIzELIdq5nE=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201020120956.29708-1-jgross@suse.com>
References: <20201020120956.29708-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20201020120956.29708-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.10b-rc1b-tag
X-PR-Tracked-Commit-Id: 5f7f77400ab5b357b5fdb7122c3442239672186c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a5bb973fa0353d25dbe854694c71bb58eb4cf78
Message-Id: <160321235968.11581.17952625512231850079.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2020 16:45:59 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Tue, 20 Oct 2020 14:09:56 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.10b-rc1b-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a5bb973fa0353d25dbe854694c71bb58eb4cf78

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

