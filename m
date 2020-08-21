Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1429B24E2FB
	for <lists+xen-devel@lfdr.de>; Sat, 22 Aug 2020 00:06:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9F9s-0002WA-89; Fri, 21 Aug 2020 22:05:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2VW/=B7=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1k9F9q-0002W5-Fw
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 22:05:10 +0000
X-Inumbo-ID: 5a699367-1738-4a23-bfa2-308b32de37be
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a699367-1738-4a23-bfa2-308b32de37be;
 Fri, 21 Aug 2020 22:05:09 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.9-rc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598047508;
 bh=ueuGh5NpCxyHbiYv/aA9SOo5J6EI+bDQFiXPnwhaBnc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=TSHxXoAr1TfPNCm2itTUzvUXiHhT0OiOkIeEYb2uRuBj7OKwJVZnKzjIfTiuYedl/
 t0M7fe6A+txbUJP0xfzY2qglpMPchTMjPQ8gQ5fsKbzKj4jc7j3zDe8k1yTbhNGqgf
 /9g/Q4mQCcDEDMHHv3Ob21f9CqDcdrX0Q9qapF8Q=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200821180217.14469-1-jgross@suse.com>
References: <20200821180217.14469-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20200821180217.14469-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.9-rc2-tag
X-PR-Tracked-Commit-Id: ee87e1557c42dc9c2da11c38e11b87c311569853
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c0a4f5b354dc26573cfaa541064fd35a794eb166
Message-Id: <159804750841.4316.16518368579794539100.pr-tracker-bot@kernel.org>
Date: Fri, 21 Aug 2020 22:05:08 +0000
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

The pull request you sent on Fri, 21 Aug 2020 20:02:17 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.9-rc2-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c0a4f5b354dc26573cfaa541064fd35a794eb166

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

