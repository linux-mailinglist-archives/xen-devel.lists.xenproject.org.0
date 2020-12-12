Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DF52D8989
	for <lists+xen-devel@lfdr.de>; Sat, 12 Dec 2020 20:02:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51283.90178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koA8n-0007bO-Us; Sat, 12 Dec 2020 19:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51283.90178; Sat, 12 Dec 2020 19:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koA8n-0007b2-RO; Sat, 12 Dec 2020 19:01:13 +0000
Received: by outflank-mailman (input) for mailman id 51283;
 Sat, 12 Dec 2020 19:01:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GRo8=FQ=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1koA8n-0007ax-6T
 for xen-devel@lists.xenproject.org; Sat, 12 Dec 2020 19:01:13 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 913e356a-4934-4f40-b0c9-836062720428;
 Sat, 12 Dec 2020 19:01:12 +0000 (UTC)
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
X-Inumbo-ID: 913e356a-4934-4f40-b0c9-836062720428
Subject: Re: [GIT PULL] xen: branch for v5.10-rc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607799671;
	bh=/z4e4OBG9dX34wwm48LbjXS2Jefc/mywFk+XdssA/Ws=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=COim9VWaDQNCkRwjVETWa6JIi88ouDhkK0sLAqw9k4SxZaJfC2DbE5z+3tpvY6nje
	 lx7hjbWu8CYxXnQcYFpwHXNkgZwDiqGqYHJBPNB8Eq37+8o/v3FJhIDtemKO1CWbGJ
	 3P31QoluUQ9XWyuDs/Y2edDVkxF+AgmA6eiuIQB3CCaqbLZ5NMyAgxc1/QZU+9+2eJ
	 6EAbcFJ/4VOL9hM8xUswWWQSsi1lyVhWLaVJFFLf2SSaVPmtetKeKXOU0yir8VJDMo
	 RTV2YvVAT/rHM8wy9U0UaXgzwqkNzuSiL7HtitZjH6soF3ZftZNvk/IDcesuCn/z9s
	 kLziimxS04E+Q==
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201211085309.8128-1-jgross@suse.com>
References: <20201211085309.8128-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20201211085309.8128-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.10c-rc8-tag
X-PR-Tracked-Commit-Id: ee32f32335e8c7f6154bf397f4ac9b6175b488a8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b53966ffd4c0676c02987d4fc33b99bdfc548cf0
Message-Id: <160779967131.16081.10288142971358980370.pr-tracker-bot@kernel.org>
Date: Sat, 12 Dec 2020 19:01:11 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Fri, 11 Dec 2020 09:53:09 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.10c-rc8-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b53966ffd4c0676c02987d4fc33b99bdfc548cf0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

