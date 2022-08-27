Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ADB5A3A71
	for <lists+xen-devel@lfdr.de>; Sun, 28 Aug 2022 01:08:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394231.633558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oS4tk-0004CD-SP; Sat, 27 Aug 2022 23:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394231.633558; Sat, 27 Aug 2022 23:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oS4tk-00049f-Pp; Sat, 27 Aug 2022 23:07:28 +0000
Received: by outflank-mailman (input) for mailman id 394231;
 Sat, 27 Aug 2022 23:07:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=chTz=Y7=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1oS4tj-00049Y-2f
 for xen-devel@lists.xenproject.org; Sat, 27 Aug 2022 23:07:27 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 035d47b5-265d-11ed-bd2e-47488cf2e6aa;
 Sun, 28 Aug 2022 01:07:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 52F05B80A3B;
 Sat, 27 Aug 2022 23:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18246C433D6;
 Sat, 27 Aug 2022 23:07:23 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 F3747C04E59; Sat, 27 Aug 2022 23:07:22 +0000 (UTC)
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
X-Inumbo-ID: 035d47b5-265d-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661641643;
	bh=mvwtv0FEWGf6ATagIKJswwAtwI9gWccoZkOb0RV3LV0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LKvR/eqF8nhyiLiomaz+ylTlEvd8FnehBaYFzmhgGE326UFFEv0rb1rYiYYPQ5Ab1
	 Kj3L5+sA6yNiKTo1vsCNAY5CrjAJiVq5NLpn5anEhuxBcFvZboT1+Q8lY3DJVmzbGH
	 AmQ2OLW8fJs0z2Ey9FTS4X51ckrDqbLTvNODiw1HmeMtUdMZ79tYKehZPO5QVjvcn0
	 GsfT3LuJA3wbdARNXQto8qj6Ao5NeB0cgPLxh/Yuq8Oq15+qDnJcHELgHCVBB8UeYa
	 +vg53mqNGjtm9rAQ4blNR3lcom2MxKf82V96qREggaM6ac+VSIPLhDLCVie82Ucla3
	 lsFh+ooCfl3Ww==
Subject: Re: [GIT PULL] xen: branch for v6.0-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220827083044.5631-1-jgross@suse.com>
References: <20220827083044.5631-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20220827083044.5631-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.0-rc3-tag
X-PR-Tracked-Commit-Id: c5deb27895e017a0267de0a20d140ad5fcc55a54
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 05519f2480a3e71053b892d4ea864e641949a77f
Message-Id: <166164164299.8591.10674223294345540484.pr-tracker-bot@kernel.org>
Date: Sat, 27 Aug 2022 23:07:22 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Sat, 27 Aug 2022 10:30:44 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.0-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/05519f2480a3e71053b892d4ea864e641949a77f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

