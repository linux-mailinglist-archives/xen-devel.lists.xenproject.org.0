Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E58564A94F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 22:12:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459925.717710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4q5U-0003ra-7l; Mon, 12 Dec 2022 21:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459925.717710; Mon, 12 Dec 2022 21:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4q5U-0003oB-4V; Mon, 12 Dec 2022 21:11:48 +0000
Received: by outflank-mailman (input) for mailman id 459925;
 Mon, 12 Dec 2022 21:11:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tkJt=4K=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1p4q5S-0003o5-TG
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 21:11:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 942b1422-7a61-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 22:11:44 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 18F956123E;
 Mon, 12 Dec 2022 21:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5D91C4339C;
 Mon, 12 Dec 2022 21:11:41 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A534EC00445; Mon, 12 Dec 2022 21:11:41 +0000 (UTC)
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
X-Inumbo-ID: 942b1422-7a61-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670879501;
	bh=GQDDJJbrRJdSRC5AUTAuyajr+7sua89sdH6DVOXw+94=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YTW7lVUw9Z922dxrh4TeUbeMovMS+a/mE9f49GK8CDHPKt6FmPNSrxu1JmV3n8a/x
	 tj94/SUXGKeglfnbiukvcfd4C5aW1sdqtKHfFKOXKyt8p94Czw65jzLHWZOrgp3YHx
	 ygc90rAEOM9cGU+SteLSxutlz46j6bI+/K5uisPGfWRGzn78ol/dJuXsbt7sXjcvu5
	 YzwgXccrM3gzZNj8VrAUr8juSBIY0qOUEROwADj1XNeSC2Au2H0NTW53kgJfvqq3yD
	 iI62ZX+afFEMjWGjExnMLFx0eaHGf2LzfWUHXoQ7DOTF1pep8yCiKypEySoGMxWAVs
	 HiI3dyZy9aRAw==
Subject: Re: [GIT PULL] xen: branch for v6.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20221212062430.10263-1-jgross@suse.com>
References: <20221212062430.10263-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20221212062430.10263-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.2-rc1-tag
X-PR-Tracked-Commit-Id: 8b997b2bb2c53b76a6db6c195930e9ab8e4b0c79
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e6b160bc4daa1227695ef807e11097a3e9934d66
Message-Id: <167087950165.1809.16468715012916138281.pr-tracker-bot@kernel.org>
Date: Mon, 12 Dec 2022 21:11:41 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Mon, 12 Dec 2022 07:24:30 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.2-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e6b160bc4daa1227695ef807e11097a3e9934d66

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

