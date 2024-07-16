Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3346933237
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 21:38:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759779.1169455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTnzT-0001tE-QB; Tue, 16 Jul 2024 19:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759779.1169455; Tue, 16 Jul 2024 19:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTnzT-0001qv-MN; Tue, 16 Jul 2024 19:37:35 +0000
Received: by outflank-mailman (input) for mailman id 759779;
 Tue, 16 Jul 2024 19:37:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cjwt=OQ=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1sTnzR-0001qp-Vi
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 19:37:34 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d769c4f9-43aa-11ef-bbfc-fd08da9f4363;
 Tue, 16 Jul 2024 21:37:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 464F1CE13C9;
 Tue, 16 Jul 2024 19:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 836AFC4AF0B;
 Tue, 16 Jul 2024 19:37:25 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6FE2EC43443; Tue, 16 Jul 2024 19:37:25 +0000 (UTC)
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
X-Inumbo-ID: d769c4f9-43aa-11ef-bbfc-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721158645;
	bh=ezUxYx7dVvX+0XB8qXmtZtrBO88mhcRhMS6b9UsFxPw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=igrmwgP+BvFZ204bquq47+UZ/PgAfkHvmB203DiU2A9DXgZb5Tj5QP7QbkKozOaPW
	 LDGNdz9lOcBJQOi/uK06S8oFyx1ZF7/UYnsEcGxpWkSFohksDHJVFKlTB+W8sxUBQf
	 74ezQu5F/CbUTTMs2QxmvfJq10BDqpuOUe17pbyJZbWbpZpAwLVE96Jacp6e2r9z2G
	 kt4yuBb4L5tAu5jD9B6U/4Wfdl02HHt/RwXv5PzmSzMS6x4azGRuY+vjqqEuxtJcCe
	 9w2LXfYo601oHj1v2enyJQ9voe18otYdPI+dQMuEaLbF+XUxog2INzDf09XpyUZxNu
	 r/ICervlb7+kw==
Subject: Re: [GIT PULL] xen: branch for v6.11-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240715054732.7508-1-jgross@suse.com>
References: <20240715054732.7508-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20240715054732.7508-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.11-rc1-tag
X-PR-Tracked-Commit-Id: 9fe6a8c5b247e182c1781556794324a8e26a7cd3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f83e38fc9f1092f8a7a65ff2ea6a1ea6502efaf0
Message-Id: <172115864544.21341.8821775973276387007.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jul 2024 19:37:25 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Mon, 15 Jul 2024 07:47:32 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.11-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f83e38fc9f1092f8a7a65ff2ea6a1ea6502efaf0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

