Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8ED31A5D5
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 21:13:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84438.158376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAenz-0003jn-IP; Fri, 12 Feb 2021 20:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84438.158376; Fri, 12 Feb 2021 20:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAenz-0003jO-Ez; Fri, 12 Feb 2021 20:12:43 +0000
Received: by outflank-mailman (input) for mailman id 84438;
 Fri, 12 Feb 2021 20:12:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5RG=HO=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1lAeny-0003jJ-7t
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 20:12:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0a0294e-a9a2-412f-ad16-8420414fdf23;
 Fri, 12 Feb 2021 20:12:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BC30364E00;
 Fri, 12 Feb 2021 20:12:40 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AC1E660A2B;
 Fri, 12 Feb 2021 20:12:40 +0000 (UTC)
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
X-Inumbo-ID: e0a0294e-a9a2-412f-ad16-8420414fdf23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613160760;
	bh=kAG+MDkUcogL/a24ByGyYkIfAvRYJiLx0RY3ITP4sXI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LeqvodM7vNQRhcCy4kpTkP/yu2q9sY3z0lVn8ql4qnbXcqlqBXqdZ/4gaRwOkv5eE
	 QYSOqAsYwlsV708lxc0Yv9OfnncI+juKimab0V9vA4LPGC+yL7brD6afM/qrsB2odD
	 /KsPheEvgP2N+lU/Ke2W9a9TCqsjptfI1fTRR3dxQ/BJmYAdi8vNhzyKGoJk6SQYvI
	 tQk2rERbgwAqjBs/FMA0gc9Usbg8kqYO68yNbUzJtFa/9djRltF3EH1Q0Y1QOfLlrN
	 i72HaJdKHV0l0o9dkzBXQSxpg1NMcij7wB4MG/zzfMQ557Nf6HBnv7qvtWOWIVBKNg
	 Z0FMzCM5GnAXA==
Subject: Re: [GIT PULL] xen: branch for v5.11-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210212060111.22013-1-jgross@suse.com>
References: <20210212060111.22013-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20210212060111.22013-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.11-rc8-tag
X-PR-Tracked-Commit-Id: c4295ab0b485b8bc50d2264bcae2acd06f25caaf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2dbbaae5f7b3855697e2decc5de79c7574403254
Message-Id: <161316076064.13717.12655994858613087035.pr-tracker-bot@kernel.org>
Date: Fri, 12 Feb 2021 20:12:40 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Fri, 12 Feb 2021 07:01:11 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.11-rc8-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2dbbaae5f7b3855697e2decc5de79c7574403254

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

