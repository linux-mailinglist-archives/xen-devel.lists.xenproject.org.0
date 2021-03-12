Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8F93397E4
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 21:03:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97310.184831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKo0W-0003gd-T0; Fri, 12 Mar 2021 20:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97310.184831; Fri, 12 Mar 2021 20:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKo0W-0003gH-Ps; Fri, 12 Mar 2021 20:03:36 +0000
Received: by outflank-mailman (input) for mailman id 97310;
 Fri, 12 Mar 2021 20:03:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Haal=IK=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1lKo0U-0003gC-O2
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 20:03:34 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 553fef3b-7165-4ee9-8390-9ea0f98af803;
 Fri, 12 Mar 2021 20:03:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1323D64F83;
 Fri, 12 Mar 2021 20:03:33 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0DD61609E7;
 Fri, 12 Mar 2021 20:03:33 +0000 (UTC)
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
X-Inumbo-ID: 553fef3b-7165-4ee9-8390-9ea0f98af803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615579413;
	bh=2iIUDg5MQhW2lt2WKw0Mjk82CAhvya2PmWSvMJh1obg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rXHhU5G7ocbzs5s0OeLFicRsQs4ViIH8N7IMrOfv1HTN+DMqoQK/c/Y4QRxd2RX3k
	 j38D0udm7fracNLiQrpGGm7yGEhFkjckbESEvRSJI/8O2h5IX6sKdVSnNkp9HCICQq
	 JOp2EfkpHcLEvs5bbAj7R5u9zNWFx6T53xZLTuif4KMR0dXrsJMFHzw6lWh7ooh6jg
	 ckPlFKl0sTyRMwAPekhmY3kGcNEob2KEaqVvCFHLuHjlFajTRdP3l1h69rImFWim0W
	 tC5jMAZz/ES+1Vc3PmZzPhA2bWxnbOwR24F4SkxdMZuAPNNRnlN4jLbrdJmj0MzjIo
	 M5ZlZdNOo64Cg==
Subject: Re: [GIT PULL] xen: branch for v5.12-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210312083400.2594-1-jgross@suse.com>
References: <20210312083400.2594-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210312083400.2594-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12b-rc3-tag
X-PR-Tracked-Commit-Id: f1d20d8643e54dcde242fd2c8748063ed75702a8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6bf8819fede1fef9805e1d803261c0d3bb62f239
Message-Id: <161557941305.10515.9029579817339264425.pr-tracker-bot@kernel.org>
Date: Fri, 12 Mar 2021 20:03:33 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Fri, 12 Mar 2021 09:34:00 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.12b-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6bf8819fede1fef9805e1d803261c0d3bb62f239

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

