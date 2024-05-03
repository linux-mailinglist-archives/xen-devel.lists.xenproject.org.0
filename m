Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D26158BB645
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 23:45:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716688.1118852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s30hm-0003Nk-RU; Fri, 03 May 2024 21:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716688.1118852; Fri, 03 May 2024 21:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s30hm-0003L0-OD; Fri, 03 May 2024 21:44:34 +0000
Received: by outflank-mailman (input) for mailman id 716688;
 Fri, 03 May 2024 21:44:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYw2=MG=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1s30hl-0003Ku-SQ
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 21:44:33 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51085549-0996-11ef-b4bb-af5377834399;
 Fri, 03 May 2024 23:44:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 257E3CE1A4F;
 Fri,  3 May 2024 21:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D86AC116B1;
 Fri,  3 May 2024 21:44:22 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 48585C4339F; Fri,  3 May 2024 21:44:22 +0000 (UTC)
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
X-Inumbo-ID: 51085549-0996-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714772662;
	bh=PUzXMSbC+X5EcWRG/at4HlBAQNJNqZepjSdVbkYW9hw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gnDWUcIB+KvvqI0jQWF+yIL6sQYUyALL1OYAkDRfTTnTmrS+TXRgg9Lsi90PpdduQ
	 hnoPjYtg/ocLBNWcyynP0kHKEW68WX0ecx/4M/PaWOW6CQQpOPgkSy9suVYjIvSHr/
	 r2P8NZd6hGs1ll4kqvYNlh9RmySa/7rxX6WgoIoZ6Zvia7yTU07usXzCF+IABsqIEU
	 aIM7o6z+/Ehv++2CpOG3o9J+0NGavF2t1w0AuAGMlFc6MCWR6WytKq0Pq//qeejmOc
	 kP49CpU40vKB9pjpI1Tg7erW9ugdFkDblaWxgQlRnRXWZBRC2m4aGYFpZKnFpTX307
	 RJYSxYZVS2o0Q==
Subject: Re: [GIT PULL] xen: branch for v6.9-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240503122028.16437-1-jgross@suse.com>
References: <20240503122028.16437-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240503122028.16437-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.9a-rc7-tag
X-PR-Tracked-Commit-Id: 802600ebdf23371b893a51a4ad046213f112ea3b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ddb4c3f25b7b95df3d6932db0b379d768a6ebdf7
Message-Id: <171477266229.28875.12276129093596082835.pr-tracker-bot@kernel.org>
Date: Fri, 03 May 2024 21:44:22 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri,  3 May 2024 14:20:28 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.9a-rc7-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ddb4c3f25b7b95df3d6932db0b379d768a6ebdf7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

