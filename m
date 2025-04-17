Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ED6A92B09
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 20:56:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958501.1351320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5UPc-00031t-IO; Thu, 17 Apr 2025 18:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958501.1351320; Thu, 17 Apr 2025 18:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5UPc-0002zM-Fl; Thu, 17 Apr 2025 18:56:36 +0000
Received: by outflank-mailman (input) for mailman id 958501;
 Thu, 17 Apr 2025 18:56:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UKmA=XD=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1u5UPb-0002zG-ON
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 18:56:35 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae9ea6ff-1bbd-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 20:56:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5EE77A49768;
 Thu, 17 Apr 2025 18:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572BDC4CEE4;
 Thu, 17 Apr 2025 18:56:33 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADDD1380AAEB; Thu, 17 Apr 2025 18:57:12 +0000 (UTC)
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
X-Inumbo-ID: ae9ea6ff-1bbd-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744916193;
	bh=2WiSBdqR2jEursVoeXUuiW1A74IIEdUo88Qk5TSEpsM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=f93FjgV8wfhlhniI48DRpxfaP7ZahncidpZgk2zv8LOm5XZ3jyPycnnNx4LVctFFf
	 h5g6jzD7fvhOBRlKVksGtkw5C31V8/d4LSy6IWsTX7cefBXn9x7JLthQlUiUaRg9iT
	 0s2brjGH7p3jcTQNXIwRkXNZUa6ZNTlppveWLsXOOBFjmYq0T5m990dURv1adDfzyp
	 FBc7eA3KG/NJLMUPZXHwxV6EhOmdXdrke14iixDLg9YUMo/LRoz4vWjXTiRruS0Z1f
	 GmGHN2gZpySRCeYdv1FYHwY/FQtCyv8ouimMNQ23Kzgn1gJLiSPzwo2dRiFATv2/C3
	 vcBxaa+ANw/uA==
Subject: Re: [GIT PULL] xen: branch for v6.15-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250417145831.23359-1-jgross@suse.com>
References: <20250417145831.23359-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20250417145831.23359-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15a-rc3-tag
X-PR-Tracked-Commit-Id: 715ad3e0ec2b13c27335749f27a5c9f0c0e84064
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 85a9793e769e2af692d341a2b3935703eac65328
Message-Id: <174491623122.4184086.14165543907582591003.pr-tracker-bot@kernel.org>
Date: Thu, 17 Apr 2025 18:57:11 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Thu, 17 Apr 2025 16:58:31 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.15a-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/85a9793e769e2af692d341a2b3935703eac65328

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

