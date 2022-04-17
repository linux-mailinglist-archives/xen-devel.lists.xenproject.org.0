Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 333695048C9
	for <lists+xen-devel@lfdr.de>; Sun, 17 Apr 2022 20:08:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.306687.521830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ng9Id-0003nr-FI; Sun, 17 Apr 2022 18:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 306687.521830; Sun, 17 Apr 2022 18:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ng9Id-0003lG-C4; Sun, 17 Apr 2022 18:07:03 +0000
Received: by outflank-mailman (input) for mailman id 306687;
 Sun, 17 Apr 2022 18:07:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=frYh=U3=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1ng9Ib-0003lA-Ra
 for xen-devel@lists.xenproject.org; Sun, 17 Apr 2022 18:07:01 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d496761-be79-11ec-a405-831a346695d4;
 Sun, 17 Apr 2022 20:07:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6A592B80D08;
 Sun, 17 Apr 2022 18:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17E76C385A9;
 Sun, 17 Apr 2022 18:06:58 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 01666E7399D; Sun, 17 Apr 2022 18:06:58 +0000 (UTC)
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
X-Inumbo-ID: 2d496761-be79-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650218818;
	bh=S/fuXmDS1XoI+nET+aUSs99FrSJzwjzC004PXgrz5xY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=A/TL+RpGdVTybhqLT1+2d/jfJtDuWvJST1gKopqnlLyNpq54UL7wVYwStZWsOEupG
	 rP/Xmj9uOMWB9vQ57HxQp2jQrB7wgmZzzCXaU80OXfpjDI2Wv+rN05cTnqv/BAyWIV
	 TvWW2uh3mFlltkWKaWmKkLGSsumFkjPfHaDsZKMqkm2kYJZbqJsd2I6tkFu6y2tLGQ
	 cmDLI/uzIq2McK7iJnhyoz8wUu9vYpwuAUELjU6KXJmnIeu064VXAiQAGOkYiTax+q
	 8ZeegY/A4prTkubPkSq+1wlx7I6SFSjmHadrw9kW1sWzRbS5sjSKhF2zczZXBrG/GZ
	 HEyQdHpSflY9Q==
Subject: Re: [GIT PULL] xen: branch for v5.18-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220417081632.11230-1-jgross@suse.com>
References: <20220417081632.11230-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220417081632.11230-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.18-rc3-tag
X-PR-Tracked-Commit-Id: 262fc47ac17461c8cdc71c70aff6c3ea45acb0b9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a1901b464e7e3e28956ae7423db2847dbbfb5be8
Message-Id: <165021881799.30246.5843841963508898915.pr-tracker-bot@kernel.org>
Date: Sun, 17 Apr 2022 18:06:57 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com

The pull request you sent on Sun, 17 Apr 2022 10:16:32 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.18-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a1901b464e7e3e28956ae7423db2847dbbfb5be8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

