Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D18CA3661F
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 20:29:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889014.1298251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj1NB-0005B9-Kl; Fri, 14 Feb 2025 19:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889014.1298251; Fri, 14 Feb 2025 19:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj1NB-000592-Hy; Fri, 14 Feb 2025 19:29:13 +0000
Received: by outflank-mailman (input) for mailman id 889014;
 Fri, 14 Feb 2025 19:29:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MF/a=VF=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1tj1NA-00058u-3w
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 19:29:12 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f656883c-eb09-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 20:29:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 587C7A433E4;
 Fri, 14 Feb 2025 19:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5E9C4CED1;
 Fri, 14 Feb 2025 19:29:08 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAF9F380CEE8; Fri, 14 Feb 2025 19:29:38 +0000 (UTC)
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
X-Inumbo-ID: f656883c-eb09-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739561348;
	bh=+7VksNpa/3dm1L9BXsVMsG9uSGO5yzfD5zy/e98F5Qc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WVo93mP+Gq1VLD80oxxdl1UoOYzCJaDpFAoMRwJdfhVrbLKdx1hMe/zO3EWs5HVJS
	 BnZ5Emzzqy9CzQaYLwDUpA1JpGX5lag1jdI0aHWtsnvRMkrXAgTg+rjkGrTi97/Jbl
	 0C9/70kYaN6js1GQ22GT0RjQZsO64kp6aQrwY24OyD0yzfcp9emD4yDiil7G5RjXeW
	 T1HuIJxL7YSZR5DOn8pu2gcF+H32NNuNwSimJM2pmg8hHnBi3OWe5xb/95nwoxFmdE
	 y/ydsWI+9OYIMIaP4iLllEYrTvr24lZDKYjQgwfX8c3iAMEEFeUgZtCwd6ti9z1w0e
	 H2Gm5Opc3GRgA==
Subject: Re: [GIT PULL] xen: branch for v6.14-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250214075955.17913-1-jgross@suse.com>
References: <20250214075955.17913-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250214075955.17913-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.14-rc3-tag
X-PR-Tracked-Commit-Id: 75ad02318af2e4ae669e26a79f001bd5e1f97472
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fd31a1bea3c94e01cb7b998485d2d7b14bdc8101
Message-Id: <173956137749.2081923.16521924563935375721.pr-tracker-bot@kernel.org>
Date: Fri, 14 Feb 2025 19:29:37 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri, 14 Feb 2025 08:59:55 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.14-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fd31a1bea3c94e01cb7b998485d2d7b14bdc8101

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

