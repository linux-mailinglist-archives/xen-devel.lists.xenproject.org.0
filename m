Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1E75AC160
	for <lists+xen-devel@lfdr.de>; Sat,  3 Sep 2022 22:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398224.639017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUZlT-0001K5-A0; Sat, 03 Sep 2022 20:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398224.639017; Sat, 03 Sep 2022 20:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUZlT-0001HT-6v; Sat, 03 Sep 2022 20:29:15 +0000
Received: by outflank-mailman (input) for mailman id 398224;
 Sat, 03 Sep 2022 20:29:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aKZ2=ZG=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1oUZlR-0001HN-Oa
 for xen-devel@lists.xenproject.org; Sat, 03 Sep 2022 20:29:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11a457aa-2bc7-11ed-934f-f50d60e1c1bd;
 Sat, 03 Sep 2022 22:29:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BAD5B60DE6;
 Sat,  3 Sep 2022 20:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DEF9C433D7;
 Sat,  3 Sep 2022 20:29:10 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1441DC4166E; Sat,  3 Sep 2022 20:29:10 +0000 (UTC)
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
X-Inumbo-ID: 11a457aa-2bc7-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662236950;
	bh=Mf+tK2Y3ypAtX/kvPF7uzRvJIYaqF6rhBP6iGfMIOfY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=F3tJ4TprMNuh4pGYCdaXhzguaGi2fsdfeCI0Yiar0ifXpbQ1K3usxFAIVP01qVgiB
	 I/C4UwpOuWRlWkevVLTtTVcShJiXi/cEMJmcey4aHOjs/rai0Jr9cIVnXOs3EIXSE7
	 5O0ykDE+rTZvzVbj1+B+olnHdBob2XYC4V4cLV+shOWhEze+MCxk2irWISK0/Cpm9S
	 nfBNjcUkNcQTR7XWQ/JDK9txvtIunTzz0jk6actxKeMCyRS4q56zKXiZjtgkArbhqY
	 inkOG24UYo/G3YUv1yIgSgbsXHq8f0FTyCCck6wWLxPTutKBSJBAbYET42Syndwc2x
	 EOKFexc/5igVQ==
Subject: Re: [GIT PULL] xen: branch for v6.0-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220903145428.29553-1-jgross@suse.com>
References: <20220903145428.29553-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20220903145428.29553-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.0-rc4-tag
X-PR-Tracked-Commit-Id: e9ea0b30ada008f4e65933f449db6894832cb242
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 65eea2c060aee3bf6d27ea365360059fbd4eeff4
Message-Id: <166223695007.8828.12790840864237325625.pr-tracker-bot@kernel.org>
Date: Sat, 03 Sep 2022 20:29:10 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Sat,  3 Sep 2022 16:54:28 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.0-rc4-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/65eea2c060aee3bf6d27ea365360059fbd4eeff4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

