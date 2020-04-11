Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB801A4D2F
	for <lists+xen-devel@lfdr.de>; Sat, 11 Apr 2020 03:21:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jN4ow-0001cj-4y; Sat, 11 Apr 2020 01:20:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Nm9=53=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1jN4ou-0001ce-9O
 for xen-devel@lists.xenproject.org; Sat, 11 Apr 2020 01:20:28 +0000
X-Inumbo-ID: a01e3c6a-7b92-11ea-b4f4-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a01e3c6a-7b92-11ea-b4f4-bc764e2007e4;
 Sat, 11 Apr 2020 01:20:27 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.7-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586568026;
 bh=iqJZVbs51UGDnqdGVU5/jtBGKszBWnavKyMrnA8OuoI=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=na8C7w3eu94yAlZRV/XZDZ4vkGtwQTzLcgHTuiJpmuCdK015QDUFgXNp1IAOsNJO9
 YX9rgxTmvjl7kiPx2sS6nOYrmBKmuzzDCkJwm/P5G5bHU8/dEPN6TCFYNTinWpQxjr
 SBwR8ZgDKErH4YZfQHutm7Paf4oX0ZrV23/Q3jSA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200410062430.20949-1-jgross@suse.com>
References: <20200410062430.20949-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200410062430.20949-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.7-rc1b-tag
X-PR-Tracked-Commit-Id: d6f34f4c6b4a962eb7a86c923fea206f866a40be
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e6383b185a998861cadb2f95d97cfe29945b9c32
Message-Id: <158656802668.16442.9324878577683276685.pr-tracker-bot@kernel.org>
Date: Sat, 11 Apr 2020 01:20:26 +0000
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

The pull request you sent on Fri, 10 Apr 2020 08:24:30 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.7-rc1b-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e6383b185a998861cadb2f95d97cfe29945b9c32

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

