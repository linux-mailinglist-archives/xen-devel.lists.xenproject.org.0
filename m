Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B7555A1EC
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 21:37:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355878.583830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4p7D-0000tv-S2; Fri, 24 Jun 2022 19:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355878.583830; Fri, 24 Jun 2022 19:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4p7D-0000rN-Or; Fri, 24 Jun 2022 19:37:15 +0000
Received: by outflank-mailman (input) for mailman id 355878;
 Fri, 24 Jun 2022 19:37:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dybx=W7=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1o4p7C-0000rH-DR
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 19:37:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0afd581d-f3f5-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 21:37:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4BE2D62221;
 Fri, 24 Jun 2022 19:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D47FC341C0;
 Fri, 24 Jun 2022 19:37:11 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 EFAE0E737F0; Fri, 24 Jun 2022 19:37:10 +0000 (UTC)
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
X-Inumbo-ID: 0afd581d-f3f5-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656099431;
	bh=LgXu9p3qO29gKCNdZSeymheH+7qUMJ29Icfx2fBLIaI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=toLOayYmotAOrNDg/xUWQyxPcS+xatJ2UCnzkBgv8PBrptkqUySp6mRC++ZGG/scR
	 vDNxfq+lmYkVveB3AeSD4sYkKpChdN0LvzeGv5GMn/aAmKFJF6i6Ft9/lmH6CKdv/O
	 WdURQGUqmdzD7+up1DOCwDtC4audF7YiGFfu7APCSJUJSp/0SCaG9OTNS5br0GEP2r
	 586MMq7Xoct/GXMlFfgdLtDEo+yiXYVe5FdKIqJvZnqv7v5EiQBd7GX8XrgHuHYn2g
	 WMHUeWDL6j8emYWOo6jSxxEUMnL14qVh5e6+/H2hKl4lD+mGQtWaWblE/08FT/pk2A
	 WYlMCW+xEDkSg==
Subject: Re: [GIT PULL] xen: branch for v5.19-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220624160736.14606-1-jgross@suse.com>
References: <20220624160736.14606-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220624160736.14606-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.19a-rc4-tag
X-PR-Tracked-Commit-Id: dbe97cff7dd9f0f75c524afdd55ad46be3d15295
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2c39d612aa5f34d63d264598692a7e6cd4fb34eb
Message-Id: <165609943097.3020.15887140717397581468.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jun 2022 19:37:10 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri, 24 Jun 2022 18:07:36 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.19a-rc4-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2c39d612aa5f34d63d264598692a7e6cd4fb34eb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

