Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED025F013
	for <lists+xen-devel@lfdr.de>; Sun,  6 Sep 2020 21:15:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kF07J-0005jz-00; Sun, 06 Sep 2020 19:14:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z27E=CP=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1kF07H-0005ju-Cc
 for xen-devel@lists.xenproject.org; Sun, 06 Sep 2020 19:14:19 +0000
X-Inumbo-ID: 921378b8-9e1a-485f-a5fa-5bacbe301598
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 921378b8-9e1a-485f-a5fa-5bacbe301598;
 Sun, 06 Sep 2020 19:14:18 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.9-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599419657;
 bh=b0sjA3RRmE3Ctkx5sSi6A7jcGmb2AJfka3zvRYsP/wU=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=nXOptfINJoSA073riFbrAXutgZhaprtMwKp4gK9XY/0ojryKDSlve9udCxWIokA+z
 r7WAei5yZN5ljtu2M8s4fgezs9el9idy/Y5yjG3Ypj7Qo+KQUr6LBjnHLi0u8VzaVe
 KTF7xEm0WkYa0UjLV1BbUPHfAHrRYAFX32Se5jQ4=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200906044433.24820-1-jgross@suse.com>
References: <20200906044433.24820-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20200906044433.24820-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.9-rc4-tag
X-PR-Tracked-Commit-Id: 9e2369c06c8a181478039258a4598c1ddd2cadfa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 68beef571071014ef34a3beac65fe2af7e8e3cf6
Message-Id: <159941965789.19439.10257590173501018968.pr-tracker-bot@kernel.org>
Date: Sun, 06 Sep 2020 19:14:17 +0000
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

The pull request you sent on Sun,  6 Sep 2020 06:44:33 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.9-rc4-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/68beef571071014ef34a3beac65fe2af7e8e3cf6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

