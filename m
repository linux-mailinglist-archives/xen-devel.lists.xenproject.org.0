Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 557FA256A02
	for <lists+xen-devel@lfdr.de>; Sat, 29 Aug 2020 22:17:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kC7Hl-0000h7-0z; Sat, 29 Aug 2020 20:17:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fznO=CH=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1kC7Hj-0000h2-BL
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2020 20:17:11 +0000
X-Inumbo-ID: 2b282d26-e643-47ec-b2bc-c785339628bc
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b282d26-e643-47ec-b2bc-c785339628bc;
 Sat, 29 Aug 2020 20:17:09 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.9-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598732229;
 bh=u0KaLes9XSWWVINqvo18NfTe+oQVn8AvU5s9XQnvG24=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=JiYYZUznA8dWuEVInkc9jrXo9q2A0sUdIDmQJYD8UptJtvxbTL4u5E47unqUHpXkN
 nLadsQCJS1unImdEtzhkZFO4kz+9nI2OedKQWOyFT5Hmlz2J8Qh5YDwxZ04K9XSHJN
 qCEfxQhZzK0eAYL9ul8gEndGOUZk+SC7itvknkhM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200829100405.23826-1-jgross@suse.com>
References: <20200829100405.23826-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20200829100405.23826-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.9-rc3-tag
X-PR-Tracked-Commit-Id: 9d3004bf7ba32c89873bb8422671d52b4bb52ce1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c8b5563abe02c5e9abdd6a74043c651a9ec31e9e
Message-Id: <159873222908.9079.13679605240472486612.pr-tracker-bot@kernel.org>
Date: Sat, 29 Aug 2020 20:17:09 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The pull request you sent on Sat, 29 Aug 2020 12:04:05 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.9-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c8b5563abe02c5e9abdd6a74043c651a9ec31e9e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

