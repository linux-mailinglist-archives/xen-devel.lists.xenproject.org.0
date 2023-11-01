Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3492B7DE6F4
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 21:50:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626643.977075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyIAT-00019W-Hq; Wed, 01 Nov 2023 20:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626643.977075; Wed, 01 Nov 2023 20:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyIAT-00016B-Ef; Wed, 01 Nov 2023 20:50:25 +0000
Received: by outflank-mailman (input) for mailman id 626643;
 Wed, 01 Nov 2023 20:50:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rL0d=GO=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1qyIAR-000165-V0
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 20:50:23 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44ec1db5-78f8-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 21:50:21 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 495D9CE1EEE;
 Wed,  1 Nov 2023 20:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 754FBC433C9;
 Wed,  1 Nov 2023 20:50:14 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 607BAC3959F; Wed,  1 Nov 2023 20:50:14 +0000 (UTC)
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
X-Inumbo-ID: 44ec1db5-78f8-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698871814;
	bh=RPJ/6C0oDYWolB1OcgR+Qo4OIIWKuJEI9yonjfjEeTI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iPrWcHmRt+5es69KVR6TWaA3ucEbZnmFJqaK6Pk0rqaSIzySYdGVXNO3KE9usHvdA
	 ff5mkFQnfTj7i7jUynkJ8M2GPyvmHnYgNw1z0pDveBAxGGOqm6ON4oRury4VaE1teg
	 zTeRcMFa78rTdTbISrsgCLQmHv4nl2eTCC3HmeYvSKeQzuDXiNENhZje3A+UUoaCkw
	 Y/qSqyj4esqc1ZHzQgHHV8UNXgQ41Cnaq1jdPlznZyNDRCitFKg+LfF2N6nSRNwkVT
	 R01bV7+v+tPf9ZMqH0Ttdo4uuFSzT9CE3sIrWHTjPCdnfcJoZfiXpFHID/sImbEt+0
	 XmEK6WWr+2KKA==
Subject: Re: [GIT PULL] xen: branch for v6.7-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20231028155524.19315-1-jgross@suse.com>
References: <20231028155524.19315-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20231028155524.19315-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.7-rc1-tag
X-PR-Tracked-Commit-Id: 2c269f42d0f382743ab230308b836ffe5ae9b2ae
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ca995ce438cc641c47d4b8e4abeb1878a3d07c5f
Message-Id: <169887181438.2957.13741778337095541343.pr-tracker-bot@kernel.org>
Date: Wed, 01 Nov 2023 20:50:14 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Sat, 28 Oct 2023 17:55:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.7-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ca995ce438cc641c47d4b8e4abeb1878a3d07c5f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

