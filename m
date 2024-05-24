Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D318CE947
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 19:54:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729681.1134885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAZ7U-0004CZ-Le; Fri, 24 May 2024 17:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729681.1134885; Fri, 24 May 2024 17:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAZ7U-0004AE-I4; Fri, 24 May 2024 17:54:20 +0000
Received: by outflank-mailman (input) for mailman id 729681;
 Fri, 24 May 2024 17:54:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wxWv=M3=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1sAZ7T-0004A6-1Q
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 17:54:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a39f1e49-19f6-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 19:54:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 95D8B63220;
 Fri, 24 May 2024 17:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45C7FC2BBFC;
 Fri, 24 May 2024 17:54:16 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2F5ADC4332E; Fri, 24 May 2024 17:54:16 +0000 (UTC)
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
X-Inumbo-ID: a39f1e49-19f6-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716573256;
	bh=71Tp+L1wf0lXLrMfxl6H7PNMVHNtLSbbAAf5z1JLfnw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dk0atlaW8wjp1W03BUxoBSCE1tel44OPPxr5G4zSrzVKQb+pmZUIzLKjt35P1O/yE
	 a1HBOh4uaiT3prEI5hgEn3Biy3RA+M3VcRdMBqkBmAMOKIvGObgW7hLCNjL3tdHDXK
	 yGauezXmwwLOJogIpOSPr+1R2QdxT0xDOf4bkbi51S/Y5nnTxBoGsN0x7M0iypLwad
	 9LUdAMnlya4ulT835zXdZutTJKsBqtIsrAV7FYiO/V98lIEWYPL0LOVmeYdCd4sGXV
	 I7MQ5BBcE+jd/TmHKKu6BgrZdCmhoojd+f9AYylxD6O7BeJVylKrGy9Boj1BcEqqQ5
	 axpqpq+vhOATA==
Subject: Re: [GIT PULL] xen: branch for v6.10-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240524133733.27825-1-jgross@suse.com>
References: <20240524133733.27825-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240524133733.27825-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.10a-rc1-tag
X-PR-Tracked-Commit-Id: a3607581cd49c17128a486a526a36a97bafcb2bb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9351f138d1dcbe504cd829abe590ba7f3387f09c
Message-Id: <171657325618.4634.8934129604090299962.pr-tracker-bot@kernel.org>
Date: Fri, 24 May 2024 17:54:16 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri, 24 May 2024 15:37:33 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.10a-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9351f138d1dcbe504cd829abe590ba7f3387f09c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

