Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1A26080ED
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 23:47:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428009.677720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olzrg-0003GP-A9; Fri, 21 Oct 2022 21:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428009.677720; Fri, 21 Oct 2022 21:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olzrg-0003EO-7C; Fri, 21 Oct 2022 21:47:40 +0000
Received: by outflank-mailman (input) for mailman id 428009;
 Fri, 21 Oct 2022 21:47:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ozE=2W=kernel.org=pr-tracker-bot@srs-se1.protection.inumbo.net>)
 id 1olzrf-0003EI-2e
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 21:47:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9faf046-5189-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 23:47:37 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AAD2E61F8A;
 Fri, 21 Oct 2022 21:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FFE3C433D7;
 Fri, 21 Oct 2022 21:47:36 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 F361AE270E0; Fri, 21 Oct 2022 21:47:35 +0000 (UTC)
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
X-Inumbo-ID: f9faf046-5189-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666388856;
	bh=J7+fm1rjaT/LZD3cv5obF8wpb4IoLIy0LmAjPcWm1xo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gmvfrcw4LP9OjQHWubzsf642byo/MXHY1DN8t52f4itWDgPcUIO+6Dgo+jSSrxEc/
	 eJpYzZdP0Evq65K5nosLhn1tgPfh26KtfREeINRkOE5RIvU+RQ48IfnLl+SUiOs5ca
	 HQgmk86qs0r/qXjaxB3nXvXHVDjz/3OCQplPsD7bpkI0xCNHogy/eds4X9zLtLcg4V
	 aGHQ/l4xa2U8yEJGspocsIEHacRQfFgiz5VBo3a47QAjUBGZZzwZjIZcAzh/Cx1wLu
	 0XOsyI0PyS/EA7hCKe+et1//XLYKhW9Qjg/hx/8ze9BifFWOl3JVDMTSVkPIVoHkTE
	 2zq7NMft+snyw==
Subject: Re: [GIT PULL] xen: branch for v6.1-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20221021093119.25978-1-jgross@suse.com>
References: <20221021093119.25978-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20221021093119.25978-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.1-rc2-tag
X-PR-Tracked-Commit-Id: a383dcb1cca8305497877119fba0a320f41fe853
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1d61754caa8c69f566504e63c8b3f3a2df0954c8
Message-Id: <166638885598.26127.18249995136071823508.pr-tracker-bot@kernel.org>
Date: Fri, 21 Oct 2022 21:47:35 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org

The pull request you sent on Fri, 21 Oct 2022 11:31:19 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-6.1-rc2-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1d61754caa8c69f566504e63c8b3f3a2df0954c8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

