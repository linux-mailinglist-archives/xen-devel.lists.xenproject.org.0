Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D0B6BF03B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 18:56:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511207.790163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdEIr-0000hb-MP; Fri, 17 Mar 2023 17:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511207.790163; Fri, 17 Mar 2023 17:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdEIr-0000eJ-Jh; Fri, 17 Mar 2023 17:55:45 +0000
Received: by outflank-mailman (input) for mailman id 511207;
 Fri, 17 Mar 2023 17:55:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UK7g=7J=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1pdEIq-0000eD-M9
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 17:55:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee761bf4-c4ec-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 18:55:41 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 50CD560AAD;
 Fri, 17 Mar 2023 17:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B57F9C433EF;
 Fri, 17 Mar 2023 17:55:39 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A17BEC43161; Fri, 17 Mar 2023 17:55:39 +0000 (UTC)
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
X-Inumbo-ID: ee761bf4-c4ec-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679075739;
	bh=pOiJt/GdXT+g7wc43tRROZKnfISDSVnPoMPzLBoXC5E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SpMiI8O9VWo8E0fg4RFzJFY+Ahj/F3mOtw+HslrKnIB7N+QUFJFPr7ZkjoorHdZDy
	 +zfQC6NUZEf/P/q1DhIbxZG0eEy5n3+1hzmZDMqF1c1XWtrHuKXDKupLkBIQrFmaEJ
	 XfiDl7Nn7No9rSZNSqlGekZsqm/TL5/CRk5jEnOqurBOG3fbCQmZg/hy6LRRl3mFuf
	 kUjBNZty9QaEx5l0JXf3NG6KiLyW5nVyMK0+2yd+ulDd7wLLFWb/Siqw+wrvl8tJkv
	 jRHdHbP1+q3Tv2EonLpg43NRzovZuNs/QlYKq+IcgkIswSa1YCga+D61iEq4nxPYaA
	 1y44zJxQSY4EQ==
Subject: Re: [GIT PULL] xen: branch for v6.3-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230317064023.1229-1-jgross@suse.com>
References: <20230317064023.1229-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230317064023.1229-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.3-rc3-tag
X-PR-Tracked-Commit-Id: 7ad2c39860dc0ca01d2152232224d2124e160fe3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0eb392ec095ee29b932985deefb43e6d86d8a463
Message-Id: <167907573965.19035.6263826550490708525.pr-tracker-bot@kernel.org>
Date: Fri, 17 Mar 2023 17:55:39 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri, 17 Mar 2023 07:40:23 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.3-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0eb392ec095ee29b932985deefb43e6d86d8a463

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

