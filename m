Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05727B31B1A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 16:18:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090211.1447551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upSbI-0004A4-OU; Fri, 22 Aug 2025 14:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090211.1447551; Fri, 22 Aug 2025 14:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upSbI-00048G-Le; Fri, 22 Aug 2025 14:18:40 +0000
Received: by outflank-mailman (input) for mailman id 1090211;
 Fri, 22 Aug 2025 14:18:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kLgn=3C=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1upSbH-00048A-QR
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 14:18:39 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id deccebfc-7f62-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 16:18:27 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 24B9D60206;
 Fri, 22 Aug 2025 14:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD717C4CEED;
 Fri, 22 Aug 2025 14:18:25 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB8FB383BF6A; Fri, 22 Aug 2025 14:18:35 +0000 (UTC)
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
X-Inumbo-ID: deccebfc-7f62-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755872305;
	bh=51H1/jHD1FhvKptbLUJ+brGLjZRcIz43JeCgl1rlEeQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ExVPncOwhxOl3C8OmTjywTbB9OyfoO3Zx0auZcR7jFgIKSpWZMaLpzhNqKG+DX7q/
	 +KRJ70Oo2dcE0fwzlfDepei8m+IUtdBcJf+LeXfhZOEA6LmmDTP0PaG/JfoSGukZfe
	 IWAQyBN6oyhaeFqoCPYKXiRwQMpFTDPZ3TUUgxn/PGtOGf1CTi080ZiCxvOetY8z8H
	 u3lCxOvH1BR9e17s5/PqeDUcCJOFJnuWS09aTo4xoDRBjehe+SiQa9xWHTxyOuz7jf
	 +Q1hXpkMYv08Hf1HHHTFupDA6Mrbp8h9hTrgC6oEpOck4lAniDLwzDqt2459plbHeF
	 qyX6Pu+02S2ig==
Subject: Re: [GIT PULL] xen: branch for v6.17-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250822053120.31771-1-jgross@suse.com>
References: <20250822053120.31771-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250822053120.31771-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.17-rc3-tag
X-PR-Tracked-Commit-Id: efdaa61d73a1deb066ccc3b4d56257cc63ab5be9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b3d80535e213ad6584577b0f20d9d49ccf233206
Message-Id: <175587231445.1847242.18002459943633296858.pr-tracker-bot@kernel.org>
Date: Fri, 22 Aug 2025 14:18:34 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri, 22 Aug 2025 07:31:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.17-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b3d80535e213ad6584577b0f20d9d49ccf233206

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

