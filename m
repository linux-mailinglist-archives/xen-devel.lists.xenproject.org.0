Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E53D94EA2A9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 00:07:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295595.503091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYxVB-0005a0-E4; Mon, 28 Mar 2022 22:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295595.503091; Mon, 28 Mar 2022 22:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYxVB-0005X4-B7; Mon, 28 Mar 2022 22:06:17 +0000
Received: by outflank-mailman (input) for mailman id 295595;
 Mon, 28 Mar 2022 22:06:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1gpf=UH=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1nYxV9-0005Wy-Uc
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 22:06:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48404281-aee3-11ec-8fbc-03012f2f19d4;
 Tue, 29 Mar 2022 00:06:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D1D5461540;
 Mon, 28 Mar 2022 22:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BE73C340ED;
 Mon, 28 Mar 2022 22:06:12 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2986CEAC081; Mon, 28 Mar 2022 22:06:12 +0000 (UTC)
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
X-Inumbo-ID: 48404281-aee3-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648505172;
	bh=XDHX0WEgIa8e+llG90tklr+k0N0LpRWXlKeNqm0bbEU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TeNnPH4UEOMYXIrwHAbji1EWj84BWiNJMk2Www5A8o6YKyAuhDzaY5Kad2ugzJ0C3
	 3pF+vUIMCD26jVj6t99ADaSxHFF2Nx61pb4pT7t3xiPvRCR1u3+TtZxJb7gvACq+Uh
	 0lTX4lLIOy/2I5zOEBie5wJQ5XHSlGw/Rybi3wB6+9d2YL3g19bIDicya1ODHmqDdC
	 y79K0QAPS07zkKpHryVWrWQXiwfN1hjy0SLePalZiujnYKIHDzbQPyRD/wfdySWv/m
	 F9i7Z0pDQYHAj/iAmggTIj1JCVM5hM9e1ph+mezt3H2zsy5W6StnZdqLyspwhOHYWH
	 DNNuJyRMIEj8Q==
Subject: Re: [GIT PULL] xen: branch for v5.18-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220328092544.14418-1-jgross@suse.com>
References: <20220328092544.14418-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220328092544.14418-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.18-rc1-tag
X-PR-Tracked-Commit-Id: de2ae403b4c0e79a3410e63bc448542fbb9f9bfc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a701f370b521b2ed0654a9da7cf424b3ff8fa73d
Message-Id: <164850517216.27348.18317093563343238542.pr-tracker-bot@kernel.org>
Date: Mon, 28 Mar 2022 22:06:12 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Mon, 28 Mar 2022 11:25:44 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.18-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a701f370b521b2ed0654a9da7cf424b3ff8fa73d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

