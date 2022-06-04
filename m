Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C944E53D88E
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jun 2022 22:56:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341961.567101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxaoW-0007zR-IW; Sat, 04 Jun 2022 20:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341961.567101; Sat, 04 Jun 2022 20:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxaoW-0007wc-E0; Sat, 04 Jun 2022 20:56:04 +0000
Received: by outflank-mailman (input) for mailman id 341961;
 Sat, 04 Jun 2022 20:56:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJVq=WL=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1nxaoU-0007wW-LS
 for xen-devel@lists.xenproject.org; Sat, 04 Jun 2022 20:56:02 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd3f2cc3-e448-11ec-bd2c-47488cf2e6aa;
 Sat, 04 Jun 2022 22:56:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E1796B80AD5;
 Sat,  4 Jun 2022 20:55:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93E55C385B8;
 Sat,  4 Jun 2022 20:55:58 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 77C0BEAC081; Sat,  4 Jun 2022 20:55:58 +0000 (UTC)
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
X-Inumbo-ID: bd3f2cc3-e448-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654376158;
	bh=ZlwVPaT7l/IdNQNwYIHS1lieP4Aisx5mKwnqL0f1nXE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=esF5ImWVpzAlPFEH0Tw+L9gHkm+zOiW+H+3JO9Gb4kcwKZNzRsa7E0RIKro6UsdNs
	 h144wUIHI7huwMbk6uTHSxO69PD7QI0AITNeuo3/xcwEXwoSiGVExLxxIKeao5ywFJ
	 Kx7N6rdtYJ3ofV+IgLSsqmYF9aDbLGPC6IwhgSQbeeAHQLZTRVn1M4RACfAZxQ/4xc
	 fDVko6YjZ5Cfwc8RdXDtgH8UzYgpOKtvCMAN+0fia4GtxEmswX9ERjYZ/niKVqTI5b
	 zRJLb+ENwLkNzOFkueKvcCPMt67YZlUQm9Oewl5hJbB5TCSK5Bd8Hx+fkpYNwhXUQ9
	 JzwX/TSy2EErQ==
Subject: Re: [GIT PULL] xen: branch for v5.19-rc1b
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220604055608.9037-1-jgross@suse.com>
References: <20220604055608.9037-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20220604055608.9037-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.19-rc1b-tag
X-PR-Tracked-Commit-Id: 41925b105e345ebc84cedb64f59d20cb14a62613
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4ccbe91de91a8f9559052179d15c0229a8ac9f8a
Message-Id: <165437615848.25005.15611342522221631046.pr-tracker-bot@kernel.org>
Date: Sat, 04 Jun 2022 20:55:58 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Sat,  4 Jun 2022 07:56:08 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.19-rc1b-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4ccbe91de91a8f9559052179d15c0229a8ac9f8a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

