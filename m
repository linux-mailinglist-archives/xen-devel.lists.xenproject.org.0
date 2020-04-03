Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0449F19DFD0
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 22:50:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKTGh-00061C-F9; Fri, 03 Apr 2020 20:50:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dSDP=5T=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1jKTGf-000617-9j
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 20:50:21 +0000
X-Inumbo-ID: bae464d1-75ec-11ea-bd6e-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bae464d1-75ec-11ea-bd6e-12813bfff9fa;
 Fri, 03 Apr 2020 20:50:20 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.7-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585947019;
 bh=nqSzCyjbIKQdgBpyZ/g6s47+6ROMV5bNk+xGz6zu8bw=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=1ZO1mXz2CWdYrzMcObLvo7sBmkm8VEnzxgNMLH5w1u0LBOc/dryvxxpx2mxZnE2Iq
 +0NRCB28b7OTfdryymNAu4CR5+cBm5yoWlle+4BKEwsP37u3GHu8s5hwtGTE/xJVZQ
 ruF54mnpoeKfjvOtdmVDT0H3yuNutTxH5d1f//rg=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200403155457.27562-1-jgross@suse.com>
References: <20200403155457.27562-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200403155457.27562-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.7-rc1-tag
X-PR-Tracked-Commit-Id: c3881eb58d56116c79ac4ee4f40fd15ead124c4b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6cd3d4019ba3f45aa1a87e4e914e81d367b59937
Message-Id: <158594701954.4594.6283769979479835894.pr-tracker-bot@kernel.org>
Date: Fri, 03 Apr 2020 20:50:19 +0000
To: Juergen Gross <jgross@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 torvalds@linux-foundation.org, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The pull request you sent on Fri,  3 Apr 2020 17:54:57 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.7-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6cd3d4019ba3f45aa1a87e4e914e81d367b59937

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

