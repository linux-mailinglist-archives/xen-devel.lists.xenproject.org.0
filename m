Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 976FF99AE34
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 23:45:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.817402.1231432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szNRG-0008U5-NV; Fri, 11 Oct 2024 21:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 817402.1231432; Fri, 11 Oct 2024 21:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szNRG-0008SY-Kq; Fri, 11 Oct 2024 21:44:46 +0000
Received: by outflank-mailman (input) for mailman id 817402;
 Fri, 11 Oct 2024 21:44:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4YAD=RH=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1szNRE-0008SS-TJ
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 21:44:44 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06475cd4-881a-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 23:44:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 87728A40E71;
 Fri, 11 Oct 2024 21:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B2BC4CEC3;
 Fri, 11 Oct 2024 21:44:41 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE0BE38363CB; Fri, 11 Oct 2024 21:44:47 +0000 (UTC)
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
X-Inumbo-ID: 06475cd4-881a-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728683081;
	bh=lyE3IdLoFf6GehAflP7TZsS18klwfqRvgYqcD7Rf8Zc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SAAYxKv72iVULX4VtGFuI3aorGuCI7MpN5fbkFtsFQ+OaMJh8VCnaiRj5IXPLYCxP
	 N36xM1phH6y4xR4cbgi+sAy7zUtwFYztFROoJl+2Nnn4uyMcF/fPYbVGhzrdfW/DDi
	 8j4Ry7ecAbIfbtAQNelfjGX4ipsSy8FC5la/tQUbp5W7AoUeonwa4P0RBXqjQg7Lvz
	 NKwxE+5HP0ciML2icAGjXfKuSOLWem/kCO4gJp+7PuFCPu1s+BozJRoEbbEliHdEE+
	 6aZeV2ulFhxrDzH/SzsFGRTWyN5CR5SdJN59EszQOrEIgdXL8gZ/NlfzbrG9Q9jTD3
	 3ysdDl7TILyYw==
Subject: Re: [GIT PULL] xen: branch for v6.12-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241011122752.13233-1-jgross@suse.com>
References: <20241011122752.13233-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20241011122752.13233-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.12a-rc3-tag
X-PR-Tracked-Commit-Id: bf56c410162dbf2e27906acbdcd904cbbfdba302
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d947d6848a790616d6d2ca64097b6e818ffe3017
Message-Id: <172868308617.3005321.8107316848439661327.pr-tracker-bot@kernel.org>
Date: Fri, 11 Oct 2024 21:44:46 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri, 11 Oct 2024 14:27:52 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.12a-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d947d6848a790616d6d2ca64097b6e818ffe3017

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

