Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B00C97C473
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 08:49:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800522.1210448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srAxi-0006Xl-Qo; Thu, 19 Sep 2024 06:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800522.1210448; Thu, 19 Sep 2024 06:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srAxi-0006Vl-O5; Thu, 19 Sep 2024 06:48:22 +0000
Received: by outflank-mailman (input) for mailman id 800522;
 Thu, 19 Sep 2024 06:48:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWJv=QR=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1srAxh-0006Vf-Ns
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 06:48:21 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2794deb5-7653-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 08:48:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 687EFA43AFC;
 Thu, 19 Sep 2024 06:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C55C4CEC5;
 Thu, 19 Sep 2024 06:48:18 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33F653809A80; Thu, 19 Sep 2024 06:48:21 +0000 (UTC)
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
X-Inumbo-ID: 2794deb5-7653-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726728498;
	bh=qG9KokqnsOoSkRgt3TLzw35lk0ryg2+BH319dWedFcw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lKdaTHyyqw+3n+54/mJZv9Lxz05ACnbG2K08jcfBZ5QjW7p6GKfLnkcObXKjFbTZw
	 sbwd5cH4wuVZAzhBdNdY+Vc0Taws13lQtGw31xDMEfH+zLeH6u0fhjZRq+pL4vqAvM
	 WyEdWPTQWDhaHCZ9X+kLUJ3ZdXhT0qmnm1AGb8tLUZxBqoj9YaGyPdeyWVbcFQLYJZ
	 LtCIgAD4ePqVZoA1kKPrnckLmi5/403fq6nXqpD8PcmcDWhh+3LiAAMNg/BV1O8dZs
	 e+w660erXbvC4roRWP9GIFs2ov6L/MWobJgAMfvVHMfB3mJ4tTH5jXJsEDshsZyfus
	 wsAPfDp3bjXuQ==
Subject: Re: [GIT PULL] xen: branch for v6.12-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240919060641.14017-1-jgross@suse.com>
References: <20240919060641.14017-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240919060641.14017-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.12-rc1-tag
X-PR-Tracked-Commit-Id: c3dea3d54f4d399f8044547f0f1abdccbdfb0fee
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 19a519ca87b59a0031e1295674b1af0d6da83f70
Message-Id: <172672849966.1360580.3806860916913196562.pr-tracker-bot@kernel.org>
Date: Thu, 19 Sep 2024 06:48:19 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Thu, 19 Sep 2024 08:06:41 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.12-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/19a519ca87b59a0031e1295674b1af0d6da83f70

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

