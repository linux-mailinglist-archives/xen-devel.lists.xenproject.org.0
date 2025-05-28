Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B881DAC60AD
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 06:19:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998929.1379615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK8Fb-0000wz-Ny; Wed, 28 May 2025 04:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998929.1379615; Wed, 28 May 2025 04:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK8Fb-0000up-Kn; Wed, 28 May 2025 04:18:47 +0000
Received: by outflank-mailman (input) for mailman id 998929;
 Wed, 28 May 2025 04:18:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iui3=YM=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1uK8Fa-0000uj-PM
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 04:18:46 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8360efc-3b7a-11f0-a2fe-13f23c93f187;
 Wed, 28 May 2025 06:18:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6CA56A49F26;
 Wed, 28 May 2025 04:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1853CC4CEEE;
 Wed, 28 May 2025 04:18:44 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70C423822D1A; Wed, 28 May 2025 04:19:19 +0000 (UTC)
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
X-Inumbo-ID: d8360efc-3b7a-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748405924;
	bh=tAWlwB6ykqQxS1QLPFAsLHiuVFSX900WKZppAKmrneg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QAQnFy55AckNf1DnJNOe/iehBt5q5cuCO2xYG8uiGAmvGukk6IK59vp9oGB70Bp0H
	 4ULDIqMRcUX2jXk4uQd0E+hF5CtEVVEN7SyqY/OUfp6SCqdzuiesA32qDJ1oo80qZC
	 fZzZXiOGb85gcI+2ASsjF8vjwo7DGvRgqvyjtenoSl8UtMcem/DdEjTnNuc+L3p2rr
	 1vpNSpmqWFoI5eLzaJKCP8lQETCZASINb2HJJ4zWofq11EhaJsZrJR2H42ik+uOQtY
	 RtKo/RYWesGfYnFwsti7iz2sUpQAklpnXI4jTSMUMZ/0wPpVxkI7iyFb9aB5RtCdIR
	 ngRpI18lwl6Ow==
Subject: Re: [GIT PULL] xen: branch for v6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250526063307.10920-1-jgross@suse.com>
References: <20250526063307.10920-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250526063307.10920-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.16-rc1-tag
X-PR-Tracked-Commit-Id: 7f9bbc1140ff8796230bc2634055763e271fd692
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5cf5240991bcea3c0f38e36e65e1742d6db7912c
Message-Id: <174840595796.1893196.3827206882663532833.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 04:19:17 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Mon, 26 May 2025 08:33:07 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.16-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5cf5240991bcea3c0f38e36e65e1742d6db7912c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

