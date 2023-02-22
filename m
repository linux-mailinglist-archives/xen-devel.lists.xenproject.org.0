Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB6769EC70
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 02:44:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499229.770284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUeAC-0000nE-Ky; Wed, 22 Feb 2023 01:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499229.770284; Wed, 22 Feb 2023 01:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUeAC-0000js-Ep; Wed, 22 Feb 2023 01:43:20 +0000
Received: by outflank-mailman (input) for mailman id 499229;
 Wed, 22 Feb 2023 01:43:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZCMp=6S=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1pUeAB-0000jm-R0
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 01:43:19 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47c8d55a-b252-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 02:43:18 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9B2FCB811C5;
 Wed, 22 Feb 2023 01:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 416B0C4339C;
 Wed, 22 Feb 2023 01:43:16 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 22161C43151; Wed, 22 Feb 2023 01:43:16 +0000 (UTC)
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
X-Inumbo-ID: 47c8d55a-b252-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677030196;
	bh=Ot4IlMt86aLhIt4eznKFWGHa4CeI1g3LzAsedP1CeGU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=oeZVUqDzX5xEOo/Nai3x2ChVWabCoMF1MLh4pTLSJ9CCk2tGseSE7Phs2ibL3+PSr
	 SRZBBv9fbUXgHIBazveRH41MmAxFnMG3OGh2LecINwbpgVrKCScnRSFjf59U1KUo8A
	 CHp5aPSIoLfVbChQyTcuI3x4lpF+hTqZ3kuebqNhvbkzXYXB7PgKGTcZRyGIKme7Ha
	 rNjlbXKfFX0DCyrUnVZhM8dzCYqvhD/M9QrmNqYe8A3FUZoc7f8s9yvQwxSjdM1iFH
	 zGXYaRt50N+eWxBisfoAuA4NIR3e1YLJayAxH1gh9GkO05T3r41FsuRXJPVtJpN65d
	 UAAVbmIdYmoZA==
Subject: Re: [GIT PULL] xen: branch for v6.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230219053326.4980-1-jgross@suse.com>
References: <20230219053326.4980-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20230219053326.4980-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.3-rc1-tag
X-PR-Tracked-Commit-Id: 4ecc96cba8d93d86abf46d17067e9b4c96241a29
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 239451e90355be68130410ef8fadef8cd130a35d
Message-Id: <167703019613.10177.1154874445058167246.pr-tracker-bot@kernel.org>
Date: Wed, 22 Feb 2023 01:43:16 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Sun, 19 Feb 2023 06:33:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.3-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/239451e90355be68130410ef8fadef8cd130a35d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

