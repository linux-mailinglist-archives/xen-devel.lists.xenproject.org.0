Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8117A95AA
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 18:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606515.944458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjMGs-0007Vm-Pf; Thu, 21 Sep 2023 16:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606515.944458; Thu, 21 Sep 2023 16:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjMGs-0007T6-Mc; Thu, 21 Sep 2023 16:11:18 +0000
Received: by outflank-mailman (input) for mailman id 606515;
 Thu, 21 Sep 2023 16:11:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Y+Y=FF=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1qjMGq-0007T0-Uf
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 16:11:16 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cee20df-5899-11ee-9b0d-b553b5be7939;
 Thu, 21 Sep 2023 18:11:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E884BB82153;
 Thu, 21 Sep 2023 16:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 969B7C5FB20;
 Thu, 21 Sep 2023 16:11:12 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 79512C41671; Thu, 21 Sep 2023 16:11:12 +0000 (UTC)
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
X-Inumbo-ID: 7cee20df-5899-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695312672;
	bh=LtqP847DUn2/wB0A+heTNMVWXmoSvHkxv/DokWcELVw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=f4mUg7AjTTouzrOrc1jDBxlW3nbK4k3U5Lut8muygCcuVdbY2O99w0rOS3tW3iXFo
	 AxhUoFo+BnZc+Hy7WOFhdXSDMuwIJrroyNlxwNcqW+z8n6GsAXxw3iH/YK6U+IKSP4
	 t0rI7qyo+mO2yjeMjLw5izrgKanXjRhPIgbaJ0skCGw0ekpMQicGeGKdOGn7jjmgbu
	 y9FiiYnEM7gdMRRqiPmcNqVa8ReriOfeGdZ24WDjdWfFpbk5qsSKw0cOsdyCBxHj/a
	 kSbPQXdOR9RIod+xm9Q0jI+voVISHQs56VsQCLM5h+HlNmqdRRk666fZPJheqBpnCa
	 riEGbdihoh5cQ==
Subject: Re: [GIT PULL] xen: branch for v6.6-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230921084110.31633-1-jgross@suse.com>
References: <20230921084110.31633-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20230921084110.31633-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.6a-rc3-tag
X-PR-Tracked-Commit-Id: 0fc6ff5a0f0488e09b496773c440ed5bb36d1f0d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 88a174a906fe9679a26c0f69fcc022743d2c8e05
Message-Id: <169531267248.30941.16423681976609784882.pr-tracker-bot@kernel.org>
Date: Thu, 21 Sep 2023 16:11:12 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Thu, 21 Sep 2023 10:41:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.6a-rc3-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/88a174a906fe9679a26c0f69fcc022743d2c8e05

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

