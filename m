Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF1728E57E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 19:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6945.18140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSkiC-0003vK-Ce; Wed, 14 Oct 2020 17:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6945.18140; Wed, 14 Oct 2020 17:37:16 +0000
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
	id 1kSkiC-0003uy-90; Wed, 14 Oct 2020 17:37:16 +0000
Received: by outflank-mailman (input) for mailman id 6945;
 Wed, 14 Oct 2020 17:37:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jyCh=DV=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1kSkiB-0003ur-34
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 17:37:15 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de1e48d2-dcee-4b87-8283-43d3452be10d;
 Wed, 14 Oct 2020 17:37:13 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jyCh=DV=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
	id 1kSkiB-0003ur-34
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 17:37:15 +0000
X-Inumbo-ID: de1e48d2-dcee-4b87-8283-43d3452be10d
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id de1e48d2-dcee-4b87-8283-43d3452be10d;
	Wed, 14 Oct 2020 17:37:13 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.10-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602697032;
	bh=RBvyCIyAboxCfBbfrdgU7EznUEpAYdunpTXFg4FrMQs=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=lLWGVM2ZT+yC10c9FJmlitO3uH2CPiX9rsMfq2mXJ8JPU7MNmOxBtUFWX0NfSI56C
	 YQg9P6PoZjlE3bYvS1li5cFIUVSbHdAvqDm5EzYoOj/fpnV8WfmEJgmuTpqNrqQPGY
	 OjrcL/roJUSgiFALGhrwkF4D4qDl1y032ZOVPSU4=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201014053917.19251-1-jgross@suse.com>
References: <20201014053917.19251-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201014053917.19251-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.10b-rc1-tag
X-PR-Tracked-Commit-Id: 32118f97f41d26a2447118fa956715cb4bd1bdac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a09b1d78505eb9fe27597a5174c61a7c66253fe8
Message-Id: <160269703278.25844.16425875472592967815.pr-tracker-bot@kernel.org>
Date: Wed, 14 Oct 2020 17:37:12 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Wed, 14 Oct 2020 07:39:17 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.10b-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a09b1d78505eb9fe27597a5174c61a7c66253fe8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

