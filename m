Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB38298324
	for <lists+xen-devel@lfdr.de>; Sun, 25 Oct 2020 19:35:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.11963.31388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWkrV-0006PH-Jx; Sun, 25 Oct 2020 18:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11963.31388; Sun, 25 Oct 2020 18:35:25 +0000
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
	id 1kWkrV-0006Os-GR; Sun, 25 Oct 2020 18:35:25 +0000
Received: by outflank-mailman (input) for mailman id 11963;
 Sun, 25 Oct 2020 18:35:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+mPq=EA=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1kWkrU-0006On-A3
 for xen-devel@lists.xenproject.org; Sun, 25 Oct 2020 18:35:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3ccfd54-0321-451b-955a-669e03e53ef4;
 Sun, 25 Oct 2020 18:35:23 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+mPq=EA=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
	id 1kWkrU-0006On-A3
	for xen-devel@lists.xenproject.org; Sun, 25 Oct 2020 18:35:24 +0000
X-Inumbo-ID: e3ccfd54-0321-451b-955a-669e03e53ef4
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e3ccfd54-0321-451b-955a-669e03e53ef4;
	Sun, 25 Oct 2020 18:35:23 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.10-rc1c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603650922;
	bh=1Yw38DTAm5hqdpgggMPY7fzxqYKarUJDpGy5M517d3Y=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=Ghr5L7DXNdFpn0F7DiGFM9GcF46YlKMx8DXuqJhxTw83qEHTjKaxov/IfHeMVJLYj
	 A4qzHMUY6trW9sZSs17PjT+scdpvo5QHErMVoSFIJ29uZsArLsVLf0G0dJ7kSNKE26
	 oOOiq3QrwMoGmfqx3Z5lqMZo4IThXOrOGclRakxw=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201025104141.4698-1-jgross@suse.com>
References: <20201025104141.4698-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201025104141.4698-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.10b-rc1c-tag
X-PR-Tracked-Commit-Id: 1a89c1dc9520b908e7894652ee2b19db9de37b64
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bd6aabc7ca39dd28a27fe1ec99e36e941cfb8192
Message-Id: <160365092281.20889.10785325670814123122.pr-tracker-bot@kernel.org>
Date: Sun, 25 Oct 2020 18:35:22 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Sun, 25 Oct 2020 11:41:41 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.10b-rc1c-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bd6aabc7ca39dd28a27fe1ec99e36e941cfb8192

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

