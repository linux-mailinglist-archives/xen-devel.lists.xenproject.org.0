Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BFF5FCE80
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 00:34:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421464.666790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oikI5-000697-60; Wed, 12 Oct 2022 22:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421464.666790; Wed, 12 Oct 2022 22:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oikI5-00066E-2N; Wed, 12 Oct 2022 22:33:29 +0000
Received: by outflank-mailman (input) for mailman id 421464;
 Wed, 12 Oct 2022 22:33:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VHLF=2N=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1oikI3-000668-MY
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 22:33:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e24f83f4-4a7d-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 00:33:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 13CF661644;
 Wed, 12 Oct 2022 22:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B08EC433C1;
 Wed, 12 Oct 2022 22:33:23 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5B1C6E21EC5; Wed, 12 Oct 2022 22:33:23 +0000 (UTC)
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
X-Inumbo-ID: e24f83f4-4a7d-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665614003;
	bh=useAVEG1SCn7DezhXEEy/Oj9mOvG627lbhcokJs58C4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YFrBq0OnNPLs8udUx1RN41lWZqUQxhAH+XBRENaNPIJIcQgfu8JwIR93BR38DtwyJ
	 OSwEEqYfbC7YuNckwYygYuVWgzTnn3cb2xiDYsQLufKhNAHlRp2javXbsTbPprTtkd
	 301GAarQ0pqfIaWBQIgvtNMMZf6iBpCP0qPPbhvWzOkCFlAUXF9jCsnY5ybBSj3lZx
	 eNPI8CrEE5yECsmm5q3uiRCHzIydwgoOjJgKZq5s6BH9fSusYmqx4ou3Qae3EumDjB
	 ZCg4DaxHKheHxSrugOXvHpQPMvt6yB26097RaqYUFcSsgtNaTnNUfvmaQ8gzBs1mBz
	 84jzlCcYfXXOw==
Subject: Re: [GIT PULL] xen: branch for v6.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20221012071618.8859-1-jgross@suse.com>
References: <20221012071618.8859-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20221012071618.8859-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.1-rc1-tag
X-PR-Tracked-Commit-Id: 7880672bdc975daa586e8256714d9906d30c615e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 778ce723e93ee803ef5883619fe2391e00dbc209
Message-Id: <166561400336.16489.1809685200706007965.pr-tracker-bot@kernel.org>
Date: Wed, 12 Oct 2022 22:33:23 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Wed, 12 Oct 2022 09:16:18 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.1-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/778ce723e93ee803ef5883619fe2391e00dbc209

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

