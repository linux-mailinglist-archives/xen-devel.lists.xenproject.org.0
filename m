Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 140D71AE3F2
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 19:46:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPV3P-0001Ck-TF; Fri, 17 Apr 2020 17:45:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fjPP=6B=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1jPV3O-0001Cf-IT
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 17:45:26 +0000
X-Inumbo-ID: 38371996-80d3-11ea-b4f4-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38371996-80d3-11ea-b4f4-bc764e2007e4;
 Fri, 17 Apr 2020 17:45:26 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.7-rc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587145525;
 bh=olLvWaB4ydIcFWkrvOI7Encucm4ZHe6kcAaiQlphu3M=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=jMYEzC0zUHELGIqLnf+KzQbReRKX7YDFJxwq0qDXzDszdDKlMEnawj1St9XntdvW6
 I4xZ9laJtGDl94PYdAdnR+RdwBBVcQNbohiDWNtTy9KgppnkWCjSqQnxGErsE1atS1
 xAEmhghYYOZPmrc8sAihs60svt2cyNif6LZ3HLVs=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200417151735.30600-1-jgross@suse.com>
References: <20200417151735.30600-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200417151735.30600-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.7-rc2-tag
X-PR-Tracked-Commit-Id: 74f4c438f22ca3fff157fb45e694805931487c55
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d0a4ebe7d1c5970f00cca09cbdfcb8ae1658349d
Message-Id: <158714552532.1625.5085942411616750345.pr-tracker-bot@kernel.org>
Date: Fri, 17 Apr 2020 17:45:25 +0000
To: Juergen Gross <jgross@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 torvalds@linux-foundation.org, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The pull request you sent on Fri, 17 Apr 2020 17:17:35 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.7-rc2-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d0a4ebe7d1c5970f00cca09cbdfcb8ae1658349d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

