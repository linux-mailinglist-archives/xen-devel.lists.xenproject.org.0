Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E491B169AF
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 02:35:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064648.1430150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhHGA-00053H-Qr; Thu, 31 Jul 2025 00:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064648.1430150; Thu, 31 Jul 2025 00:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhHGA-00050X-Lp; Thu, 31 Jul 2025 00:35:02 +0000
Received: by outflank-mailman (input) for mailman id 1064648;
 Thu, 31 Jul 2025 00:35:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8sPB=2M=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1uhHG8-00050R-BN
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 00:35:00 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d05f406-6da6-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 02:34:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0123EA5541F;
 Thu, 31 Jul 2025 00:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EEEFC4CEE3;
 Thu, 31 Jul 2025 00:34:52 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE001383BF5F; Thu, 31 Jul 2025 00:35:09 +0000 (UTC)
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
X-Inumbo-ID: 2d05f406-6da6-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753922092;
	bh=Wt55UtMbVRyQ/G78HubkFNMB8SGow7TyDvKTfz86VVA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XHwlXBDMj6vzHTcKFgpUUPA4WUSAwplvlkY7F0zxI3x4ND29PT6p75sixqp+cO4CV
	 RsECMvSfwYr6z1cO02nc6K7Qv1hFwy8qJhudr6+HWFaOkbECw/FzQ690ZEIk07w+Wq
	 X1a+eLCyTxOdvnjBi2QBv2FT2qh/AB4cegqjQ0B7JQvgCazt2ZbfK3YzZG1w9lRukj
	 StXJEbLxlx44S181bBTC9OfUKFMUJs1WbFjavJWDIqWLyasAuKI3m3Y6L4sN6w4pki
	 UJ8o+0pePdguQPA4y6515BsEfKf21AvxVe9KrVfah8LqsF3/UMI/3VoQb88lSXUVz1
	 Owo6IBrBh+2Jw==
Subject: Re: [GIT PULL] xen: branch for v6.17-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250728060614.4875-1-jgross@suse.com>
References: <20250728060614.4875-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250728060614.4875-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.17-rc1-tag
X-PR-Tracked-Commit-Id: 114a2de6fa86d99ed9546cc9113a3cad58beef79
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7d767a9528f6d203bca5e83faf1b8f2f6af3fc07
Message-Id: <175392210839.2556608.2210035374951503206.pr-tracker-bot@kernel.org>
Date: Thu, 31 Jul 2025 00:35:08 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Mon, 28 Jul 2025 08:06:14 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.17-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7d767a9528f6d203bca5e83faf1b8f2f6af3fc07

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

