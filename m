Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96558214471
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 09:05:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrcEV-0007op-Tw; Sat, 04 Jul 2020 07:05:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cJvU=AP=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1jrcEU-0007ok-UK
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 07:05:06 +0000
X-Inumbo-ID: b08e5eda-bdc4-11ea-bb8b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b08e5eda-bdc4-11ea-bb8b-bc764e2007e4;
 Sat, 04 Jul 2020 07:05:06 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.8-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593846305;
 bh=mdISOtGKokzv0rP5dd5e/Ev8OPzF6jG9Dh8+t5MOrZs=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=P9TGSqzYJy8tqf7rK2dwN49odgya/v9o89YRQvdExfpDDJKRckKPnXFU53XudClne
 vP86XgbsHqndOBHwmltAMINm85YrQZi4aXjoP6SuY8OA8tENCpIfUOkIny1k+Ouir+
 Hfl0GYTA3qvw0OjG9SfqGUXAJN2W53ow63m3k53A=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200704065702.3073-1-jgross@suse.com>
References: <20200704065702.3073-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200704065702.3073-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.8b-rc4-tag
X-PR-Tracked-Commit-Id: 578c1bb9056263ad3c9e09746b3d6e4daf63bdb0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 35e884f89df4c48566d745dc5a97a0d058d04263
Message-Id: <159384630585.17224.3932318630515842404.pr-tracker-bot@kernel.org>
Date: Sat, 04 Jul 2020 07:05:05 +0000
To: Juergen Gross <jgross@suse.com>
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 torvalds@linux-foundation.org, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The pull request you sent on Sat,  4 Jul 2020 08:57:02 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.8b-rc4-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/35e884f89df4c48566d745dc5a97a0d058d04263

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

