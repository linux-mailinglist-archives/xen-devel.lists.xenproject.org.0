Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2737135E1
	for <lists+xen-devel@lfdr.de>; Sat, 27 May 2023 19:24:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540331.842043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2xcp-0003mz-At; Sat, 27 May 2023 17:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540331.842043; Sat, 27 May 2023 17:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2xcp-0003kL-7l; Sat, 27 May 2023 17:22:43 +0000
Received: by outflank-mailman (input) for mailman id 540331;
 Sat, 27 May 2023 17:22:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ljfk=BQ=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1q2xco-0003kF-2P
 for xen-devel@lists.xenproject.org; Sat, 27 May 2023 17:22:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12b72635-fcb3-11ed-8611-37d641c3527e;
 Sat, 27 May 2023 19:22:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AC0AD60ED0;
 Sat, 27 May 2023 17:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17CC1C433D2;
 Sat, 27 May 2023 17:22:35 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 EBE86C4166F; Sat, 27 May 2023 17:22:34 +0000 (UTC)
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
X-Inumbo-ID: 12b72635-fcb3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685208155;
	bh=iLmQvKnR0W+7FxEY1A+v5WguoW1iSCLbA5KWnRCGKPw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=AHu3Z+8trOd0ClOKxvqkTTzNpWRx1bSts5AHV7HDO6qVSEdYY96pXN3wfcDR3uQVn
	 2lsYHdNlsTMZyhu8tN6IEO9sMjAHbOIIXCk4qYpdEXbXcRTeKgcH6p7BjntXpMRu2p
	 Wik+rvjWLFAZvsJ8m8WmNgxG5EFQ7r+B2G6UIh/HoAOfvNVe8LPCKp2WPfyO7jYsDZ
	 IT9W38B4eZp4U6K2ZkDPh73nvUNbwNzK/ZSu/GXl1E9RoU6admHgkwe4U8UMGq8nwI
	 hyK6Uh48bs5P+jHGfKIjt1+arTJIh+8hWjuT6V96LRBF2Po3U+aVDIhZSJwHsstmbf
	 vfO3lSPFLLstQ==
Subject: Re: [GIT PULL] xen: branch for v6.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230527053544.31822-1-jgross@suse.com>
References: <20230527053544.31822-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230527053544.31822-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.4-rc4-tag
X-PR-Tracked-Commit-Id: 335b4223466dd75f9f3ea4918187afbadd22e5c8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4e893b5aa4ac2c8a56a40d18fe87e9d2295e5dcf
Message-Id: <168520815495.27218.6793284360828021541.pr-tracker-bot@kernel.org>
Date: Sat, 27 May 2023 17:22:34 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Sat, 27 May 2023 07:35:44 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.4-rc4-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4e893b5aa4ac2c8a56a40d18fe87e9d2295e5dcf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

