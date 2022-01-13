Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D80048CFCA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 01:46:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256913.441166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7oF8-0005cd-Tb; Thu, 13 Jan 2022 00:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256913.441166; Thu, 13 Jan 2022 00:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7oF8-0005aS-Pc; Thu, 13 Jan 2022 00:45:30 +0000
Received: by outflank-mailman (input) for mailman id 256913;
 Thu, 13 Jan 2022 00:45:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9vnq=R5=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1n7oF6-0005aM-Rp
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 00:45:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 188aa066-740a-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 01:45:27 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B55161BC4;
 Thu, 13 Jan 2022 00:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F18B4C36AE9;
 Thu, 13 Jan 2022 00:45:23 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 DEDF1F60794; Thu, 13 Jan 2022 00:45:23 +0000 (UTC)
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
X-Inumbo-ID: 188aa066-740a-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642034724;
	bh=O68F3Nu2VEdBbj9G5SZBlcgk3FUUK/jllIRq5moEFi8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lywSjBNlmD8Trgad8wMZqS9CzgCufgEAJ7i42zJj5xE+dq5QHwCyh3w4DSwE89Pmu
	 hK0hNRvq3Qw/8ajln5lxGMKdNJxI8QcWdQ0auDWmsxk9YEfjfesmONnlN4exShg/du
	 SjPl+6m62+/ms8E/GNHDkS8nBeFfWm6dR4HkxeFtN4X3uM0PYv34/jO4pE9tflrM7m
	 AJjkB8yRzkuR9+QUhciWEhyjak5vB/LoXuBkn9XtT7Eqff9kbhcBWH5KNEbEtEXjMj
	 UozkFiYvt3b/1aiXqrkOKKcyLX/5NJ3u9rlrr5oPtiYFeoemM/nOXFujTP5muP5ty2
	 GFDtGZgBHHF7g==
Subject: Re: [GIT PULL] xen: branch for v5.17-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220112155011.1990-1-jgross@suse.com>
References: <20220112155011.1990-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20220112155011.1990-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.17-rc1-tag
X-PR-Tracked-Commit-Id: 54bb4a91b281e1b21235a4bc175e1293e787c016
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ce990f1de0bc6ff3de43d385e0985efa980fba24
Message-Id: <164203472390.19726.4581721172474922590.pr-tracker-bot@kernel.org>
Date: Thu, 13 Jan 2022 00:45:23 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Wed, 12 Jan 2022 16:50:11 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.17-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ce990f1de0bc6ff3de43d385e0985efa980fba24

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

