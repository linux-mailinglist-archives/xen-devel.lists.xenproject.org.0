Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE6A45F4B6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 19:35:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233431.405029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqg4B-0006QV-PE; Fri, 26 Nov 2021 18:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233431.405029; Fri, 26 Nov 2021 18:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqg4B-0006Nk-MB; Fri, 26 Nov 2021 18:35:23 +0000
Received: by outflank-mailman (input) for mailman id 233431;
 Fri, 26 Nov 2021 18:35:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9kjA=QN=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1mqg49-0006Ne-Kx
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 18:35:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9abb79ed-4ee7-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 19:35:20 +0100 (CET)
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 45EBF6233D;
 Fri, 26 Nov 2021 18:35:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C1F0A60230;
 Fri, 26 Nov 2021 18:35:15 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BBE6960A3E;
 Fri, 26 Nov 2021 18:35:15 +0000 (UTC)
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
X-Inumbo-ID: 9abb79ed-4ee7-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637951715;
	bh=9S/92vgY1r+ITMC3wc1Z8mWpA9O4M0yTo3ncFbJ/wyU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=B/IuEsi38PlymMXljcjHTXWD7aAWWMx7K2TQVXR0pJ7kOrk6HCzRAjEF51qxEfoVA
	 vLhCdI4NkfwiCosz12hjc3ojV3dsat055nBiIAnkMCANZakDPPsSdMCj5BP2OASBJC
	 d6t2sCGb1z2m1RcpXtJMEmXMVoRtDZfUVImmUhqS9E0ZvNjLq3hKafkXbvVG/NXj7p
	 Ea5hTClRObTywggW+Bv4FlllcsiFwQdW89NNQlt6uHeWjOFvCgKMK4njGBfs/6SOBg
	 tC4K/189QCv+FOohW4+2JNb2aANg1SLkDdi1O+ip24KKoJFbGvJhWhYH123/LppKEB
	 dgqQQ3LTx2zJQ==
Subject: Re: [GIT PULL] xen: branch for v5.16-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20211126153152.380-1-jgross@suse.com>
References: <20211126153152.380-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20211126153152.380-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.16c-rc3-tag
X-PR-Tracked-Commit-Id: 00db58cf21188f4b99bc5f15fcc2995e30e4a9fe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6b54698aec0b59943f7e8a88151bdf208de990d0
Message-Id: <163795171576.22939.2366989648980472963.pr-tracker-bot@kernel.org>
Date: Fri, 26 Nov 2021 18:35:15 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Fri, 26 Nov 2021 16:31:52 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.16c-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6b54698aec0b59943f7e8a88151bdf208de990d0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

