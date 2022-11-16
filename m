Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DB662C832
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 19:51:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444389.699546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovNVQ-0003L9-Tv; Wed, 16 Nov 2022 18:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444389.699546; Wed, 16 Nov 2022 18:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovNVQ-0003IW-Q6; Wed, 16 Nov 2022 18:51:28 +0000
Received: by outflank-mailman (input) for mailman id 444389;
 Wed, 16 Nov 2022 18:51:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ah7g=3Q=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1ovNVP-0003IQ-7r
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 18:51:27 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abddb04a-65df-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 19:51:25 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DDB36B81DA8;
 Wed, 16 Nov 2022 18:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C673C433D6;
 Wed, 16 Nov 2022 18:51:23 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8011EE21EFD; Wed, 16 Nov 2022 18:51:23 +0000 (UTC)
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
X-Inumbo-ID: abddb04a-65df-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668624683;
	bh=Ix65TQWZ4DpjbScvYzV559zitmw6e2Fr+crZYEqU9vU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CImTd82z0bEtf8pkWKBANxbBU3MPuIwCtromsO3gBx4MZ8AsWWIjxJMpcKNL9Itd9
	 oIfv6jGQQ87JqZZvGtBgTV3O8g2+ukgLzoKud0IJYEMKolxZ2c8py01HinLofd+H0i
	 AvSXZzqTuUnklVzguBOTtxgFlvyo1jTI+hJH8GPvkaus4/KsXMA+tfr67BvMc0ELF8
	 i9P1hgCXzfOBc6abb5wJkkIj6IvoQOqfCzUAI4d/njFC1GQo2YXKupa46rrjpRWC0e
	 UFfKtqwLChPckbxM5JuE/EYuSdT976v8JonLLAjudT7tfmtNN1y2NtT5v0KL+rLXh4
	 9rM4o6E4n3VMw==
Subject: Re: [GIT PULL] xen: branch for v6.1-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20221116120055.4299-1-jgross@suse.com>
References: <20221116120055.4299-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20221116120055.4299-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.1-rc6-tag
X-PR-Tracked-Commit-Id: 4abb77fc5531381484477cac95913336c97176b7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cc675d22e422442f6d230654a55a5fc5682ea018
Message-Id: <166862468351.19828.7207830520981155384.pr-tracker-bot@kernel.org>
Date: Wed, 16 Nov 2022 18:51:23 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Wed, 16 Nov 2022 13:00:55 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.1-rc6-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cc675d22e422442f6d230654a55a5fc5682ea018

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

