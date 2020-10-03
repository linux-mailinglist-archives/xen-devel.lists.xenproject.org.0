Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE92282681
	for <lists+xen-devel@lfdr.de>; Sat,  3 Oct 2020 21:59:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2590.7434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOnfk-000763-0f; Sat, 03 Oct 2020 19:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2590.7434; Sat, 03 Oct 2020 19:58:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOnfj-00075e-Tp; Sat, 03 Oct 2020 19:58:23 +0000
Received: by outflank-mailman (input) for mailman id 2590;
 Sat, 03 Oct 2020 19:58:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3plm=DK=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1kOnfi-00075Z-Kx
 for xen-devel@lists.xenproject.org; Sat, 03 Oct 2020 19:58:22 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe7d3c7e-589c-4256-9443-d4a62689f3d9;
 Sat, 03 Oct 2020 19:58:22 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3plm=DK=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
	id 1kOnfi-00075Z-Kx
	for xen-devel@lists.xenproject.org; Sat, 03 Oct 2020 19:58:22 +0000
X-Inumbo-ID: fe7d3c7e-589c-4256-9443-d4a62689f3d9
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fe7d3c7e-589c-4256-9443-d4a62689f3d9;
	Sat, 03 Oct 2020 19:58:22 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.9-rc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601755101;
	bh=LcL5cn9XLk5mudrBuslWNR7HhK+P5LDzqeGHvnZrkCQ=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=aMRjThDceaYwrUwlyauhNwGpf6lqCWx+LDH4EH9XF1FOyZKeNrqPzPLDo4VQQdm7/
	 UN+V5tmLjyIITJWx4GsS/PEj7k9z7F/i6ZeMaPs9OxITP23XXGVIN4ERGyTQuz1zQQ
	 i0jlWil1amaPWZqPwYKbxUlRMCg8KlqdgexfA2Qw=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201003073253.1861-1-jgross@suse.com>
References: <20201003073253.1861-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201003073253.1861-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.9b-rc8-tag
X-PR-Tracked-Commit-Id: 0891fb39ba67bd7ae023ea0d367297ffff010781
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5ee56135b2f5886cb0333d18640043a8f73fa830
Message-Id: <160175510128.27812.2872072780024080723.pr-tracker-bot@kernel.org>
Date: Sat, 03 Oct 2020 19:58:21 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Sat,  3 Oct 2020 09:32:53 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.9b-rc8-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5ee56135b2f5886cb0333d18640043a8f73fa830

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

