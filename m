Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0842D3B486F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 19:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147355.271563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwpwu-0006Bx-MW; Fri, 25 Jun 2021 17:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147355.271563; Fri, 25 Jun 2021 17:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwpwu-00068s-IM; Fri, 25 Jun 2021 17:49:04 +0000
Received: by outflank-mailman (input) for mailman id 147355;
 Fri, 25 Jun 2021 17:49:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p8Eg=LT=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1lwpws-00068k-Nh
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 17:49:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7e2f43d-290b-4e42-9893-de16d6449cef;
 Fri, 25 Jun 2021 17:49:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 83676616EA;
 Fri, 25 Jun 2021 17:49:01 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7DCE860A37;
 Fri, 25 Jun 2021 17:49:01 +0000 (UTC)
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
X-Inumbo-ID: e7e2f43d-290b-4e42-9893-de16d6449cef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624643341;
	bh=q1IXRZ38qk3iRDF+4a0s9gUKtrwRwjE4zvG25cKiv/U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YRKCKRsAAh/RarveQLlHQqHm2y/0MCbv/VOirSm3pzsUj/shWEp4Gajt5LsV0i0XE
	 8kvMlTjm1jURNIH7ilXuEx1ZzJd/b86udxX0mtYhluH+OfCA8Zh/Jw1R1dqVT+Gqla
	 XGmye5FLRwQvINggVz0TyS2khVLVeQCGPcBhm0LBUE8FCYh+MU2Jsp71bu4EFCN8jU
	 wds24sF1YVCfO6GoOzN8b8o8+z0oIAVuIxPz2kxr/hPVT9eEuOzSDlk7S1OUW0iUzZ
	 kWvPoeQfeJAv+aTjpLj7HtixdcHTBMhvn6iAnjvOa0VQK0ruk62dIOzsPKHAzJhPj6
	 XBFS7zTF1F9xA==
Subject: Re: [GIT PULL] xen: branch for v5.13-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210625144832.20839-1-jgross@suse.com>
References: <20210625144832.20839-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20210625144832.20839-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.13b-rc8-tag
X-PR-Tracked-Commit-Id: 3de218ff39b9e3f0d453fe3154f12a174de44b25
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b960e0147451915b5d4cd208b7abd3b07ceaf1a2
Message-Id: <162464334150.2214.18063317640641616641.pr-tracker-bot@kernel.org>
Date: Fri, 25 Jun 2021 17:49:01 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Fri, 25 Jun 2021 16:48:32 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.13b-rc8-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b960e0147451915b5d4cd208b7abd3b07ceaf1a2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

