Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9FE830EC4
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 22:48:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668569.1040853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQDkQ-0003X8-9Z; Wed, 17 Jan 2024 21:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668569.1040853; Wed, 17 Jan 2024 21:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQDkQ-0003Tv-6l; Wed, 17 Jan 2024 21:46:58 +0000
Received: by outflank-mailman (input) for mailman id 668569;
 Wed, 17 Jan 2024 21:46:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=64a2=I3=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1rQDkO-0003Tp-EQ
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 21:46:56 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebdac8c9-b581-11ee-9b0f-b553b5be7939;
 Wed, 17 Jan 2024 22:46:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A1C0ECE1BF8;
 Wed, 17 Jan 2024 21:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1B6DC433C7;
 Wed, 17 Jan 2024 21:46:45 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CAE14D8C978; Wed, 17 Jan 2024 21:46:45 +0000 (UTC)
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
X-Inumbo-ID: ebdac8c9-b581-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705528005;
	bh=JeVSfy1WcN0zA1TvZfy+lzPXJGr3Ws8eFBa8RciWznk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WUzUTHgi+rCsrJ66GGn5YRUwFF3+dH18VYSAUPqHbZifEkAH3GRA7HOZXc49+oozm
	 tmlR/VwOBcJSFy58BMKe21/IAk/thoOPBhXqoz77iSFlBMhYy7DMnqbdPaEl9TGmV7
	 WB3IvPot/PnUa/YRqOaIeVstui/iIEgV0hWSXcfSS+ioiS/sg8f9TrEQpo9m8FwA9h
	 T8J79nn2RD59T/PpL2pyY9frLDOp/4rnm9nagvk7tcog5cJBgsyAtUd4EwtGO9tueD
	 i1fYr1vRGwZbYmYAcUTGepWESq9b6eftd3gll/VoOoRUFp3iK1IgwIhOzC0vUAsbRN
	 6oqAAJL5t1a0w==
Subject: Re: [GIT PULL] xen: branch for v6.8-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240111121943.3342-1-jgross@suse.com>
References: <20240111121943.3342-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20240111121943.3342-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.8-rc1-tag
X-PR-Tracked-Commit-Id: 2d2db7d40254d5fb53b11ebd703cd1ed0c5de7a1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 82fd5ee9d8a516d47a17e8c99c2712a3fd937014
Message-Id: <170552800582.31446.6268487683399554343.pr-tracker-bot@kernel.org>
Date: Wed, 17 Jan 2024 21:46:45 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Thu, 11 Jan 2024 13:19:43 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.8-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/82fd5ee9d8a516d47a17e8c99c2712a3fd937014

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

