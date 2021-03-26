Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5DE34AEC3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 19:49:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.102050.195479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPrVV-0005Uq-O3; Fri, 26 Mar 2021 18:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102050.195479; Fri, 26 Mar 2021 18:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPrVV-0005UR-Ki; Fri, 26 Mar 2021 18:48:29 +0000
Received: by outflank-mailman (input) for mailman id 102050;
 Fri, 26 Mar 2021 18:48:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rKN6=IY=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1lPrVU-0005UH-Ka
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 18:48:28 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4eb19bad-2cfc-464d-81e9-48dab581ed33;
 Fri, 26 Mar 2021 18:48:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 32EC961A32;
 Fri, 26 Mar 2021 18:48:27 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1900160952;
 Fri, 26 Mar 2021 18:48:27 +0000 (UTC)
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
X-Inumbo-ID: 4eb19bad-2cfc-464d-81e9-48dab581ed33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616784507;
	bh=o3vDg6yqgyA1Twdd5bXDGYIg+8P1k+tonUCRFj0cgFs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ldSeRY2niZjtW89vymy5Rpzk4LwHllb9JP4S2W9PL/2/DjEykeE0wCQywnnMBlL5v
	 l6zr5zLFrI7b8RqhijSPVJEcJYihTkX6q+rJzRhCnvJiEcs0v6iYd0MAPf+2PlIPQg
	 U8niqtpxT4AmLFOnlrpKeM7g/Q1cpsqEj0u3swNgYKSGF0/qIe3OhVvTXEAsk22pYg
	 4GK3Qb9Qbz3OEf+n+yEyj4aG7jnFqilGLLTLvCcuKfOVBhrr1KMA5IL0fndvv+k4fr
	 IONsi/rVn+1LPEV5t3Pux3QLGpGQwbo9xTJZ+xkUQdiqMFCnIhAbOoBWqB2jh+TjU2
	 W0QJoozBIkYJQ==
Subject: Re: [GIT PULL] xen: branch for v5.12-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210326152041.25735-1-jgross@suse.com>
References: <20210326152041.25735-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20210326152041.25735-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12b-rc5-tag
X-PR-Tracked-Commit-Id: af44a387e743ab7aa39d3fb5e29c0a973cf91bdc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6c20f6df61ee7b8b562143504cf3e89ae802de87
Message-Id: <161678450709.8437.15896961548334222943.pr-tracker-bot@kernel.org>
Date: Fri, 26 Mar 2021 18:48:27 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Fri, 26 Mar 2021 16:20:41 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12b-rc5-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6c20f6df61ee7b8b562143504cf3e89ae802de87

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

