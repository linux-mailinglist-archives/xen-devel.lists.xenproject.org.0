Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6E87F8CA8
	for <lists+xen-devel@lfdr.de>; Sat, 25 Nov 2023 18:14:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641190.999970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6wDZ-00077p-18; Sat, 25 Nov 2023 17:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641190.999970; Sat, 25 Nov 2023 17:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6wDY-000769-TZ; Sat, 25 Nov 2023 17:13:20 +0000
Received: by outflank-mailman (input) for mailman id 641190;
 Sat, 25 Nov 2023 17:13:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jIEU=HG=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1r6wDX-000763-IH
 for xen-devel@lists.xenproject.org; Sat, 25 Nov 2023 17:13:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb56c64d-8bb5-11ee-9b0e-b553b5be7939;
 Sat, 25 Nov 2023 18:13:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3EDEA60DE4;
 Sat, 25 Nov 2023 17:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1A90C433C8;
 Sat, 25 Nov 2023 17:13:13 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C1926EAA958; Sat, 25 Nov 2023 17:13:13 +0000 (UTC)
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
X-Inumbo-ID: eb56c64d-8bb5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700932393;
	bh=W0F/lRbpZj2Yy5ZtrfTRl4NAOBt7IGaRShsMv19f7A4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=eown95AF5iXiVU5DzcxsHte5XXmyGDs2qI4t3kXE/SF7xlCfia5STArF/YIwaLQ+3
	 ztDewWDLjZMMybm0L+RGXURn+eEg2QdrIFiX33uzo9nT+ALZ+Vf/+nlRWmcltotGGm
	 UDnWY26QTSvRRLWC1ubLjsTCTNa92eHy+QGdhYSPqObM0fdgh+ak5YqW/lDtHG9W94
	 imXkc/NxEAd29gpXA20g8jAWalOD9OSe6kj5FwmH2BI/TWkfPrNTIuJ7BpYHv5jQVx
	 iipinUh04FcctLcptCcYYRPK24cyqayehl+5AXT+E2WDzMCM+ZdBe1X5NPTskhag/h
	 0LvaFelKR4UAA==
Subject: Re: [GIT PULL] xen: branch for v6.7-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20231125092205.8378-1-jgross@suse.com>
References: <20231125092205.8378-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20231125092205.8378-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.7a-rc3-tag
X-PR-Tracked-Commit-Id: 7bf9a6b46549852a37e6d07e52c601c3c706b562
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 00cff7b29b1dbc4ff48ae9278eb1aa4dc0bfad6a
Message-Id: <170093239378.710.7580413467376806013.pr-tracker-bot@kernel.org>
Date: Sat, 25 Nov 2023 17:13:13 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Sat, 25 Nov 2023 10:22:05 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.7a-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/00cff7b29b1dbc4ff48ae9278eb1aa4dc0bfad6a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

