Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4072B38200C
	for <lists+xen-devel@lfdr.de>; Sun, 16 May 2021 18:45:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127997.240384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liJtA-0007v8-Ds; Sun, 16 May 2021 16:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127997.240384; Sun, 16 May 2021 16:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liJtA-0007sf-Ah; Sun, 16 May 2021 16:45:12 +0000
Received: by outflank-mailman (input) for mailman id 127997;
 Sun, 16 May 2021 16:45:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nw2+=KL=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1liJt9-0007sZ-BX
 for xen-devel@lists.xenproject.org; Sun, 16 May 2021 16:45:11 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3cfb92b8-fd65-41af-9f32-9f0b661e89f6;
 Sun, 16 May 2021 16:45:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B451A610CA;
 Sun, 16 May 2021 16:45:09 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A15C960A23;
 Sun, 16 May 2021 16:45:09 +0000 (UTC)
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
X-Inumbo-ID: 3cfb92b8-fd65-41af-9f32-9f0b661e89f6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621183509;
	bh=4FKIJRZigr3MmLKiP7lAxUR2d8nC79R8APeyi0lOsz0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=sGHPtMJYH59AGTjqnQWE23IiNWId05Sv8rBZMN0T0EhGyXNMgq+Y0cOC9UotDFGcC
	 45uMBbw116dGMMmhoHl7EiTQ3MNbkFx7p65oTsEqI3x1/ZNypKZizvwBFrskC0eT/4
	 u1LUN0LQiTyV2OEgPQTL/OCrCFrf2beprmBYj7S/pKIZ21C+KXYfI0/ZG0nDFKIzls
	 hs+Dx4mObHsEsfkMktTO3Mi/364PHPvRww632YxZDn6JTrnNkPsXS8m2yvLUlj6yLB
	 fkHiExVCgQ4jF8H5dvEf2AA1Ue3Wlb1ouapii6SsrA7tXYeeMLJFpaQUYn7w2NBlE6
	 yEV1fqQzJ5ikg==
Subject: Re: [GIT PULL] xen: branch for v5.13-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210516063020.3349-1-jgross@suse.com>
References: <20210516063020.3349-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210516063020.3349-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.13b-rc2-tag
X-PR-Tracked-Commit-Id: 97729b653de52ba98e08732dd8855586e37a3a31
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f44e58bb1905ada4910f26676d2ea22a35545276
Message-Id: <162118350959.14702.2339566205360958922.pr-tracker-bot@kernel.org>
Date: Sun, 16 May 2021 16:45:09 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Sun, 16 May 2021 08:30:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.13b-rc2-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f44e58bb1905ada4910f26676d2ea22a35545276

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

