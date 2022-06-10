Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DF6546C4C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 20:26:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346651.572521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzjKh-0007TO-38; Fri, 10 Jun 2022 18:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346651.572521; Fri, 10 Jun 2022 18:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzjKh-0007R0-0P; Fri, 10 Jun 2022 18:26:07 +0000
Received: by outflank-mailman (input) for mailman id 346651;
 Fri, 10 Jun 2022 18:26:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iHn/=WR=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1nzjKf-0007Qu-LD
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 18:26:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7c832e6-e8ea-11ec-8901-93a377f238d6;
 Fri, 10 Jun 2022 20:26:02 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B917621EA;
 Fri, 10 Jun 2022 18:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C1A9C34114;
 Fri, 10 Jun 2022 18:26:00 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E8375E737EA; Fri, 10 Jun 2022 18:25:59 +0000 (UTC)
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
X-Inumbo-ID: c7c832e6-e8ea-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654885560;
	bh=hnJGEJ6cGM5h+26mHdcmFFEsRgKuweQknb6iEEtMA3E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LE4Se7DCHVSvtvi3x7Cx7yZmxbN4gLsxqeZ3lEUZhlffWdVuMXR7GkYvAv3VCSRmq
	 M6uZe5QV+TxYmmoN2O9JVLFdSWl7kc4SD/eB+pPC58aqKHTHcL1PQA4rop8H7ErDnT
	 3zZUNKeErrRLfxaiaFoSirpJceI3WMlFz0k2s6kkZDm20BrpkA64E6OmCOCEys3IpN
	 qNXL9mSl1k5tGf3FSSI+v2Uq07kCYjZOKVT0PFH1gtI7RvOqpl1RdUKFU2deGJdN8n
	 klwyEuNEai5z0pTPty7OJxmZow2rmsR30Fg7iaq48nAe1PqAQrCvefgJeQ9A3rDv2j
	 8OUqi5DmmOO1A==
Subject: Re: [GIT PULL] xen: branch for v5.19-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220610044858.30822-1-jgross@suse.com>
References: <20220610044858.30822-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20220610044858.30822-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.19a-rc2-tag
X-PR-Tracked-Commit-Id: dbac14a5a05ff8e1ce7c0da0e1f520ce39ec62ea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f2ecc964b9414a407828f9bef242b77483e95a6d
Message-Id: <165488555994.32117.5799921241915272315.pr-tracker-bot@kernel.org>
Date: Fri, 10 Jun 2022 18:25:59 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri, 10 Jun 2022 06:48:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.19a-rc2-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f2ecc964b9414a407828f9bef242b77483e95a6d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

