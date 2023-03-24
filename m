Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40FC6C8325
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 18:16:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514373.796530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfl17-0002so-As; Fri, 24 Mar 2023 17:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514373.796530; Fri, 24 Mar 2023 17:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfl17-0002px-7a; Fri, 24 Mar 2023 17:15:53 +0000
Received: by outflank-mailman (input) for mailman id 514373;
 Fri, 24 Mar 2023 17:15:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F0pF=7Q=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1pfl16-0002pr-HC
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 17:15:52 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86af5c05-ca67-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 18:15:51 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ED015B825BE;
 Fri, 24 Mar 2023 17:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C03EC433EF;
 Fri, 24 Mar 2023 17:15:49 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 89A6AE2A039; Fri, 24 Mar 2023 17:15:49 +0000 (UTC)
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
X-Inumbo-ID: 86af5c05-ca67-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679678149;
	bh=Sucp0yBdmA5wuFWYxBMiZRdQcUTiMd2RWfUoCqPCMNM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=EPMDQBKIrGvsfVIAg9OyNCjwN22tH0OFr8DF86qoEg+AJRPPpoydOsr9DQ3enRsCS
	 X8upGR2oU5wtTHh29Pm+YOR8a7ZNCU9PmRItVdRqzFIcJJ9RYBJZmhGW5RI01zgphM
	 B7Q4DTAczfUKwNO10LUrV1zCPgTxpGbDFFBQ+Ib0HbVTb1CGJpFX1qrZxfbQIptQn3
	 dBa4UNqw9EcH4vVyKHLjMEiTcH35gW4DS0+hZcr8YM/bCzLw1T/Emi5tYw/zFw7DfS
	 Skief0BlplmTeCfRuVSpALh+DZojS1jtqOE1D6rZD90Dw1gmAjP81zFsmGo43cP7++
	 4XkpUJYJ1QVHg==
Subject: Re: [GIT PULL] xen: branch for v6.3-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230324113550.8218-1-jgross@suse.com>
References: <20230324113550.8218-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230324113550.8218-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.3-rc4-tag
X-PR-Tracked-Commit-Id: aadbd07ff8a75ed342388846da78dfaddb8b106a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2495697422d374b097151205d399ff0dcbaa08e0
Message-Id: <167967814955.905.2593283607607592203.pr-tracker-bot@kernel.org>
Date: Fri, 24 Mar 2023 17:15:49 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri, 24 Mar 2023 12:35:50 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.3-rc4-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2495697422d374b097151205d399ff0dcbaa08e0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

