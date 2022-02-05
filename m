Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF35D4AAB03
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 19:45:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266082.459762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGQ41-0005V8-1E; Sat, 05 Feb 2022 18:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266082.459762; Sat, 05 Feb 2022 18:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGQ40-0005Su-U6; Sat, 05 Feb 2022 18:45:36 +0000
Received: by outflank-mailman (input) for mailman id 266082;
 Sat, 05 Feb 2022 18:45:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G0mZ=SU=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1nGQ3z-0005Sj-AR
 for xen-devel@lists.xenproject.org; Sat, 05 Feb 2022 18:45:35 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8ebf6a2-86b3-11ec-8eb8-a37418f5ba1a;
 Sat, 05 Feb 2022 19:45:31 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 11985B80CAC;
 Sat,  5 Feb 2022 18:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D61B1C340E8;
 Sat,  5 Feb 2022 18:45:24 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C58A2E5D07E; Sat,  5 Feb 2022 18:45:24 +0000 (UTC)
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
X-Inumbo-ID: c8ebf6a2-86b3-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644086724;
	bh=fcalSUfcC3f+A4OPK37VCIh9FGFzTW9J646wvOQUfd4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jfrYf5pgoQt/pgjiwYAAWXNH4J5yx7nB2f7MsQqX5d5wXlHvtT2YKxTPrMB0Gqq8t
	 Wvs539nPCJfCsoRHVDliTaEtkqfg3B/HbTjmikv7H1N8fyPniUaZwHVjlMTR6x4B1a
	 tOscvPcEiFHVPJ+9a7I2QKnS7gzMA1fZTz42DyzOO6UhY3GmFxtkLE+1F2Yr5R5iaP
	 MmmnC3rUB16DkUrE6Hw0B8f6POneUnN7tyMmcgwIdhfirx69zgN9x+GIUi0qfNHyTV
	 kMMCtno6SsaysWYnOSVPTY1kZTsSQY0zI99AmBltiti/hBCuSAZn36W+wrUu5f9Yb0
	 C1PAWTjyamH+g==
Subject: Re: [GIT PULL] xen: branch for v5.17-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220205110717.16946-1-jgross@suse.com>
References: <20220205110717.16946-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220205110717.16946-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.17a-rc3-tag
X-PR-Tracked-Commit-Id: e25a8d959992f61b64a58fc62fb7951dc6f31d1f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 90c9e950c0def5c354b4a6154a2ddda3e5f214ac
Message-Id: <164408672480.8633.6221021066979381394.pr-tracker-bot@kernel.org>
Date: Sat, 05 Feb 2022 18:45:24 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Sat,  5 Feb 2022 12:07:17 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.17a-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/90c9e950c0def5c354b4a6154a2ddda3e5f214ac

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

