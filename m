Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A6A2BB3EE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 19:40:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32561.63618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgBKI-0007c7-F4; Fri, 20 Nov 2020 18:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32561.63618; Fri, 20 Nov 2020 18:40:06 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgBKI-0007ai-BV; Fri, 20 Nov 2020 18:40:06 +0000
Received: by outflank-mailman (input) for mailman id 32561;
 Fri, 20 Nov 2020 18:40:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShNn=E2=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1kgBKG-0007O8-Oc
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 18:40:04 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84a21b75-b21a-47c3-b7d7-62b12c91a21b;
 Fri, 20 Nov 2020 18:40:04 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ShNn=E2=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
	id 1kgBKG-0007O8-Oc
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 18:40:04 +0000
X-Inumbo-ID: 84a21b75-b21a-47c3-b7d7-62b12c91a21b
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 84a21b75-b21a-47c3-b7d7-62b12c91a21b;
	Fri, 20 Nov 2020 18:40:04 +0000 (UTC)
Subject: Re: [GIT PULL] xen: branch for v5.10-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605897603;
	bh=yrhE7j00Mtsf9/fQt335X97bxVz/PrGLW3m6roM1KR4=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=08MvlJg85Q1TZ/e5dO04m95fWliauAvm09XpRu0pSGoM4dptkUo6grfMn3qH+fRyT
	 gjmliPDEsW56C8VhyKaN5nYjN2yw8xPf3es1h55RtC/bjRJygNg4sjlUlEpbA1+j+I
	 BR7aCx6LdR/L1cjax4HB6sE4jTUxu7OknBrzFDfo=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20201120055947.613-1-jgross@suse.com>
References: <20201120055947.613-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20201120055947.613-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.10b-rc5-tag
X-PR-Tracked-Commit-Id: 65cae18882f943215d0505ddc7e70495877308e6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4ccf7a01e805f04defd423fb410f47a13af76399
Message-Id: <160589760312.4306.8801434833258557230.pr-tracker-bot@kernel.org>
Date: Fri, 20 Nov 2020 18:40:03 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Fri, 20 Nov 2020 06:59:47 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.10b-rc5-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4ccf7a01e805f04defd423fb410f47a13af76399

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

