Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB8442723E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 22:27:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204859.360045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYwRi-0000xD-U7; Fri, 08 Oct 2021 20:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204859.360045; Fri, 08 Oct 2021 20:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYwRi-0000uY-QJ; Fri, 08 Oct 2021 20:26:22 +0000
Received: by outflank-mailman (input) for mailman id 204859;
 Fri, 08 Oct 2021 20:26:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7pG=O4=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1mYwRh-0000uS-Bq
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 20:26:21 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea281b29-3ba2-48f0-9772-d9bcdd205d9e;
 Fri, 08 Oct 2021 20:26:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E1550610E7;
 Fri,  8 Oct 2021 20:26:19 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D1F5960985;
 Fri,  8 Oct 2021 20:26:19 +0000 (UTC)
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
X-Inumbo-ID: ea281b29-3ba2-48f0-9772-d9bcdd205d9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633724779;
	bh=vT5acUdijVlmgJ73PQ7CevuSDxlM5VYf0E2NOdYsC4Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dXgWir2THYdjizavZQrBr72bREyVMCL0fFpYMn29dzmeShRaLJd5jlE2Wi1pe80o8
	 Tr8el6+5cD8eDSz6bQcfw9gBJayKunkq0UJNfU7+amqCrr0Hvr9T30S53209U5zCHF
	 bYBg3NK6a4O2typZRFPlx+RXGHZRsCiojNtPAF2Iq+2+Ng/uWhK+HuU28Dfwwz/2Xa
	 aO+ejv/wdSMY8oktyzs3Gnp67uoC6xCLnNG3OX8euEDWTq/Ps58jiI8zpRq/V5ERDu
	 EwoTDbGw3wnOhbwECJomsf5vb3fFiHHWRsYo/6zdwXOa5Su350qDCu3beeTEv/cjmy
	 z5QK57SMRmVvQ==
Subject: Re: [GIT PULL] xen: branch for v5.15-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20211008141911.25271-1-jgross@suse.com>
References: <20211008141911.25271-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20211008141911.25271-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.15b-rc5-tag
X-PR-Tracked-Commit-Id: 319933a80fd4f07122466a77f93e5019d71be74c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3946b46cab8b4714a9274af91772b9ad17a10e12
Message-Id: <163372477980.4543.4165045948379929086.pr-tracker-bot@kernel.org>
Date: Fri, 08 Oct 2021 20:26:19 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Fri,  8 Oct 2021 16:19:11 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.15b-rc5-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3946b46cab8b4714a9274af91772b9ad17a10e12

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

