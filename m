Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D5588025E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 17:33:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695499.1085311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmcO9-0001eQ-WB; Tue, 19 Mar 2024 16:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695499.1085311; Tue, 19 Mar 2024 16:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmcO9-0001bm-TB; Tue, 19 Mar 2024 16:32:33 +0000
Received: by outflank-mailman (input) for mailman id 695499;
 Tue, 19 Mar 2024 16:32:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jjkz=KZ=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1rmcO8-0001bf-8h
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 16:32:32 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4638af73-e60e-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 17:32:29 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7D0C0CE0EC7;
 Tue, 19 Mar 2024 16:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1588C433C7;
 Tue, 19 Mar 2024 16:32:25 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 AA2E8D84BA6; Tue, 19 Mar 2024 16:32:25 +0000 (UTC)
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
X-Inumbo-ID: 4638af73-e60e-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710865945;
	bh=thznYSl/RULrLuI/zS56kmqKZGuZNeDoORWBvdGwIrQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=EVywMTv1T8LmU8pLrqbhN3KB0Tjxm1ynvn8vr9rEGry566r3cnlITHyEQT37ukb+M
	 7NCa+nkF7qP2B+ZoESetk9riut7VP51dlE3Joh/F9AZeQFaTJ703Pqd1V0wO+cc4p1
	 gu+TsE/l/294+dfDW1RcaollOUut83o9espjDZv+xeBCmaZW1762lOI4oPqWXUzTgM
	 M/JCLancaMXuMKPa/S/+GgzZkG+HMSHT9TCdL8QNyrZbEjWQdpaponpgGLmtsTDBDr
	 mQ2gitEHVHY24bakpDPG4A/SKd4CU43ga5aN8N1n4VZJnT+y4sEnbu3QpKE93Ca4UO
	 MxfXp4vR6x/Fw==
Subject: Re: [GIT PULL] xen: branch for v6.9-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240319071022.7513-1-jgross@suse.com>
References: <20240319071022.7513-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240319071022.7513-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.9-rc1-tag
X-PR-Tracked-Commit-Id: d277f9d82802223f242cd9b60c988cfdda1d6be0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0815d5cc7dfb4a2c6d02a6eb86974ab3992b803d
Message-Id: <171086594569.7768.14518623666259076339.pr-tracker-bot@kernel.org>
Date: Tue, 19 Mar 2024 16:32:25 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Tue, 19 Mar 2024 08:10:22 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.9-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0815d5cc7dfb4a2c6d02a6eb86974ab3992b803d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

