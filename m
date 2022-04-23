Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F8450CD7A
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 23:01:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311803.529060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niMrw-00081x-8G; Sat, 23 Apr 2022 21:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311803.529060; Sat, 23 Apr 2022 21:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niMrw-0007yP-3H; Sat, 23 Apr 2022 21:00:40 +0000
Received: by outflank-mailman (input) for mailman id 311803;
 Sat, 23 Apr 2022 21:00:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukTE=VB=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1niMru-0007yJ-5l
 for xen-devel@lists.xenproject.org; Sat, 23 Apr 2022 21:00:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bc9d863-c348-11ec-8fc2-03012f2f19d4;
 Sat, 23 Apr 2022 23:00:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B13460FF8;
 Sat, 23 Apr 2022 21:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DDE8C385A0;
 Sat, 23 Apr 2022 21:00:34 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6ABE9E8DBD4; Sat, 23 Apr 2022 21:00:34 +0000 (UTC)
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
X-Inumbo-ID: 6bc9d863-c348-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650747634;
	bh=RzYZ8CVv9KyE6w4BSTCQ7iFCqpRihYLBT92FFn5f1+Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bww765jZMMB8Rgrvn+scGPWxo8/sLdHM76w7xAJMiiM8UJ5UUUj3x5aQa9w1rqmO1
	 EppOZCNKyxvnIrteeEEEw/nuOPd5N2w0WiIDNJSJm8fWORljrehe1AzE/bktCsrjo0
	 3lkZjwQXNDr07zVAlMV/ZolAFadDT65OFroefsXoz+IMoGWygT/AXPK95gyjCd1Wj3
	 Eg6sxs5fn30nX+UMDAwzluRcgm+LuvXlMKibVSuwnJJJqHRtVytxkPWA4m31yZkDIH
	 IP6DWT9AzGvkN9Mk595jWKXCSQGue0+6r75kxAcjXqREV9pegjVi92doi5UhrRa0Z9
	 NJiQfKHDkaF/A==
Subject: Re: [GIT PULL] xen: branch for v5.18-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220423130806.15699-1-jgross@suse.com>
References: <20220423130806.15699-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20220423130806.15699-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.18-rc4-tag
X-PR-Tracked-Commit-Id: 533bec143a4c32f7b2014a159d0f5376226e5b4d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b51bd23c614bc5a8a905d258133246e78d611df1
Message-Id: <165074763443.21099.15482523060926556291.pr-tracker-bot@kernel.org>
Date: Sat, 23 Apr 2022 21:00:34 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Sat, 23 Apr 2022 15:08:06 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.18-rc4-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b51bd23c614bc5a8a905d258133246e78d611df1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

