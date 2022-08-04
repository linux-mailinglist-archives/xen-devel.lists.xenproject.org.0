Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA8A58A365
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 00:47:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380754.615117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJjbW-0001ib-0Y; Thu, 04 Aug 2022 22:46:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380754.615117; Thu, 04 Aug 2022 22:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJjbV-0001g5-Tw; Thu, 04 Aug 2022 22:46:09 +0000
Received: by outflank-mailman (input) for mailman id 380754;
 Thu, 04 Aug 2022 22:46:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dmO+=YI=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1oJjbU-0001fz-L1
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 22:46:08 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39257da3-1447-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 00:46:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C179B82770;
 Thu,  4 Aug 2022 22:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69B14C433D6;
 Thu,  4 Aug 2022 22:46:03 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4F6CCC43142; Thu,  4 Aug 2022 22:46:03 +0000 (UTC)
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
X-Inumbo-ID: 39257da3-1447-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659653163;
	bh=QwWGxEGYpivv/q9IQZQYPUVVnG6Oj48r558KUSTiG/o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Uolp0NKohRLr+hagc8vZHgfMaagDoG4NiVdLCHfLSi96W+ZFHw+N1w3ly+/dRAFDi
	 FvWYUpNKeaFIUDjSb/xBdc6/LztOyTV4YAk4LNIOzZqmb/IXAASZOZXjoa5eY/8nWz
	 SjtThDM9MM9Bi3v0g/MUasjbAi2Lk3FzgYJhfmyX84ERFKVG56Ws4cTtQMEzzbQema
	 V8JuyFSO5yN2ialzeySZlI0we8BZvlw88uCE5geES4PMOmOMybCe6hUAm4yDziOVZu
	 LEDs4suC67+4DW/xJ5he7OOX5IMj0cY+0oMphE6TCh5LA9r3rUgqzRC+pZNamndoVr
	 W22GyqJC+HjgQ==
Subject: Re: [GIT PULL] xen: branch for v6.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220803075226.2400-1-jgross@suse.com>
References: <20220803075226.2400-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20220803075226.2400-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.0-rc1-tag
X-PR-Tracked-Commit-Id: 251e90e7e346a23742b90e2c4db19d322e071d99
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7447691ef994ffd8072809a11ca9167a2d91564f
Message-Id: <165965316331.20279.7058969435031457273.pr-tracker-bot@kernel.org>
Date: Thu, 04 Aug 2022 22:46:03 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Wed,  3 Aug 2022 09:52:26 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.0-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7447691ef994ffd8072809a11ca9167a2d91564f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

