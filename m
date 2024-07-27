Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB1893E0C9
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jul 2024 22:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766006.1176579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXnhQ-0007zd-29; Sat, 27 Jul 2024 20:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766006.1176579; Sat, 27 Jul 2024 20:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXnhP-0007y4-Vm; Sat, 27 Jul 2024 20:07:27 +0000
Received: by outflank-mailman (input) for mailman id 766006;
 Sat, 27 Jul 2024 20:07:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1dS=O3=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1sXnhO-0007xy-W9
 for xen-devel@lists.xenproject.org; Sat, 27 Jul 2024 20:07:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d69ec25f-4c53-11ef-8776-851b0ebba9a2;
 Sat, 27 Jul 2024 22:07:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4935661199;
 Sat, 27 Jul 2024 20:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C1EEC4AF0B;
 Sat, 27 Jul 2024 20:07:23 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 119CEC43601; Sat, 27 Jul 2024 20:07:23 +0000 (UTC)
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
X-Inumbo-ID: d69ec25f-4c53-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722110843;
	bh=GXzX7Bh5FzfCbOvFuuUV+xdEP1fi8kCBTU+0qCZVGU0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YuhiFf4ZtQKWzDis2s6TEAfg++0Q8AgWlKTBjZNUExObaZBg1hk+4hHkk7TRvYenL
	 3pnmltXbesEl6jn5uzKv3BlOEMKXXFmM1aT1MLveBJUu8IpLoSYakG2OE749ay6ywT
	 1b9HGnrOq7agz3Q6fAwC1fBJQMMNCZo/YSjeQQlQ96fdxWf4Qo2TPg0npca3vLIRir
	 D+mCZlK6cQbyCT5YxYAgb3rg8KUFMXiQNf9DgDuvlscibNLHQMj0QVTZJkdzTuS6i9
	 zBjxTs0ggIg3ibIlGF70T5/y6RxGKZrodTfjJyrwjOhezPUJ2MKptjApG38qPEib5Y
	 2oxQkfLOhUH4Q==
Subject: Re: [GIT PULL] xen: branch for v6.11-rc1 take 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240726095758.15879-1-jgross@suse.com>
References: <20240726095758.15879-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240726095758.15879-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.11-rc1a-tag
X-PR-Tracked-Commit-Id: 4c006734898a113a64a528027274a571b04af95a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c17f1224b8d79339e9f2156fdf2966281cdb31df
Message-Id: <172211084306.16614.4055916101052089743.pr-tracker-bot@kernel.org>
Date: Sat, 27 Jul 2024 20:07:23 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri, 26 Jul 2024 11:57:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.11-rc1a-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c17f1224b8d79339e9f2156fdf2966281cdb31df

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

