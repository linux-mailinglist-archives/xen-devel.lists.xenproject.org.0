Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 417AE7EE113
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 14:07:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634204.989532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3c5I-00063p-GD; Thu, 16 Nov 2023 13:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634204.989532; Thu, 16 Nov 2023 13:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3c5I-00060p-D3; Thu, 16 Nov 2023 13:07:04 +0000
Received: by outflank-mailman (input) for mailman id 634204;
 Thu, 16 Nov 2023 13:07:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fy5f=G5=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1r3c5H-0005yA-F1
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 13:07:03 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 070fae05-8481-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 14:07:00 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 6A6A4B81C8B;
 Thu, 16 Nov 2023 13:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C153FC433C9;
 Thu, 16 Nov 2023 13:06:58 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A427DC4166E; Thu, 16 Nov 2023 13:06:58 +0000 (UTC)
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
X-Inumbo-ID: 070fae05-8481-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700140018;
	bh=+22+/jE0pQQI30EI1P0oDbwnv2LjVE6mj8Acc/SkOAI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=leI6U/9QdOhRBNiweyhhw/zl8eOkUvoGajn5JusR0Qww/nFOXIJXWElUL0eEYgvpr
	 arc+/6jyWUk3rKa2EeiidnZRS+UHBNjXJByF3WdxDSYfKcsuBR1k/2iLpP5EafzqQb
	 Msn1U92RkF09w5Y20qnrVRGUp+cMmZzUkohMtqGHecLeGg3LFjnfU04U5nLAhT8U7g
	 gJ0FZjlojbF6BmSAQHic0X0yPNMsyVBuXWjNWr/BAByXl43hvHTubvy2kYAolGONY1
	 0ZS/+cIz7FWVyhW6ebD4zGa+ce+7mKkkde2v3XOUUn2rQa/6mquKl+1SuR0bwg5b47
	 NvP+rUrI6S05g==
Subject: Re: [GIT PULL] xen: branch for v6.7-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20231116114241.26403-1-jgross@suse.com>
References: <20231116114241.26403-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20231116114241.26403-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.7a-rc2-tag
X-PR-Tracked-Commit-Id: cee96422e863f0b0e9d3d0c2d617271ef2255858
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6eb1acd9766a0dc9d85927843d85787408395e15
Message-Id: <170014001866.19711.14089555975336471922.pr-tracker-bot@kernel.org>
Date: Thu, 16 Nov 2023 13:06:58 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Thu, 16 Nov 2023 12:42:41 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.7a-rc2-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6eb1acd9766a0dc9d85927843d85787408395e15

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

