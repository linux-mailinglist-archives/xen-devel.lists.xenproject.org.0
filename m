Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BAE7406C6
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 01:11:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556300.868720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEHpF-0000Di-HV; Tue, 27 Jun 2023 23:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556300.868720; Tue, 27 Jun 2023 23:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEHpF-0000BK-Dv; Tue, 27 Jun 2023 23:10:21 +0000
Received: by outflank-mailman (input) for mailman id 556300;
 Tue, 27 Jun 2023 23:10:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z27E=CP=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1qEHpD-0000BE-Kf
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 23:10:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c70a3092-153f-11ee-b237-6b7b168915f2;
 Wed, 28 Jun 2023 01:10:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C40F36123F;
 Tue, 27 Jun 2023 23:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38753C433CC;
 Tue, 27 Jun 2023 23:10:15 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0D412E5380A; Tue, 27 Jun 2023 23:10:15 +0000 (UTC)
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
X-Inumbo-ID: c70a3092-153f-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687907415;
	bh=yng0FmqgKRoBmPf/eooWitt8N2NyVf7Z939LZHz7L4M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jk2JGaIBYH30CQ8nYzHdI8GQNE4FsBYyS7QRDWce5o2xbnJbFJcj23X+c7ZIi3RS/
	 ncABrrLEpfjFG0bzz4lcbefVQSLQuMv+yQ0oek6+vL++P/AOAuHZILmRRYuqSZ2Ogr
	 fgkL362nzZy/2S68s+OExOpbOyXDPawH/tFma4rWyANykcbYqlK32Sk6aBphQJ8vxM
	 V8wi7nX6lKsX1W5M7cnIlh2N+UBrdfpAOmRKdogZd/quUfQGgCM53mv8ihoXp6rzSG
	 CNK+w6zOqUihHd2HbHlnMGKyoJwYaiPgrQHlUuvQraKDzS5AZuDSbkteqrIYeB3C9J
	 lTZWDfwOkhSJQ==
Subject: Re: [GIT PULL] xen: branch for v6.5-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230627060906.14981-1-jgross@suse.com>
References: <20230627060906.14981-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20230627060906.14981-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.5-rc1-tag
X-PR-Tracked-Commit-Id: fb9b7b4b2b82d72031bff6d615215c1c74064bb3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 18eb3b6dff007f2e4ef4f0d8567dfb5cdb6086fc
Message-Id: <168790741504.21322.17901076437712757797.pr-tracker-bot@kernel.org>
Date: Tue, 27 Jun 2023 23:10:15 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Tue, 27 Jun 2023 08:09:06 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.5-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/18eb3b6dff007f2e4ef4f0d8567dfb5cdb6086fc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

