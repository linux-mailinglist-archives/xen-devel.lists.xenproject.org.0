Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAB24C333C
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 18:10:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278543.475840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNHd8-0005y8-U4; Thu, 24 Feb 2022 17:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278543.475840; Thu, 24 Feb 2022 17:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNHd8-0005vu-R4; Thu, 24 Feb 2022 17:10:14 +0000
Received: by outflank-mailman (input) for mailman id 278543;
 Thu, 24 Feb 2022 17:10:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sGkr=TH=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1nNHd7-0005vm-Ec
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 17:10:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fec0376-9594-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 18:10:12 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9E0861B7C;
 Thu, 24 Feb 2022 17:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2ACD8C340F0;
 Thu, 24 Feb 2022 17:10:10 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0F611EAC09B; Thu, 24 Feb 2022 17:10:10 +0000 (UTC)
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
X-Inumbo-ID: 9fec0376-9594-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645722610;
	bh=rGTcIsyPfUg5jarnpPAC5c1oD8wbki17rcNUhK+rn+A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q/k7zPwArBHqe8/t+oyHeDXRSwRligPTjz43URI2HteAX66Lhn8sn2Yflw7v+9GIw
	 rd/KJNZWLi0Zwo9dH5sMGGo9QzxwssloFXHU7zL+lmW7ftHNEftNVIW2Ap1/xfcIq4
	 Z4Mw8XH7VNSoCUDI43BrvCrFSLAu5U7F+VHs2GKBOK8+V8T2/VntTwrP8PBJffKP0M
	 kF+Nj4f1quM4mfg9ewfVR1uVotEiX0R60OhpCmlCYoDskzM6CmfoAsobRutHr2Ol45
	 6lDEHtu6dWkxhDemDOZVn9SPzYAGaeCJOPmqfI3i3erpXATf/u7cGY9gDWfIAaRMBg
	 5eOoPUNZaMbqw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] Revert "xen-netback: remove 'hotplug-status' once it
 has served its purpose"
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <164572261005.890.15777493366001996059.git-patchwork-notify@kernel.org>
Date: Thu, 24 Feb 2022 17:10:10 +0000
References: <20220222001817.2264967-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20220222001817.2264967-1-marmarek@invisiblethingslab.com>
To: =?utf-8?q?Marek_Marczykowski-G=C3=B3recki_=3Cmarmarek=40invisiblethingslab?=@ci.codeaurora.org,
	=?utf-8?q?=2Ecom=3E?=@ci.codeaurora.org
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, mcb30@ipxe.org,
 wei.liu@kernel.org, paul@xen.org, davem@davemloft.net, kuba@kernel.org,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org

Hello:

This series was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 22 Feb 2022 01:18:16 +0100 you wrote:
> This reverts commit 1f2565780e9b7218cf92c7630130e82dcc0fe9c2.
> 
> The 'hotplug-status' node should not be removed as long as the vif
> device remains configured. Otherwise the xen-netback would wait for
> re-running the network script even if it was already called (in case of
> the frontent re-connecting). But also, it _should_ be removed when the
> vif device is destroyed (for example when unbinding the driver) -
> otherwise hotplug script would not configure the device whenever it
> re-appear.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] Revert "xen-netback: remove 'hotplug-status' once it has served its purpose"
    https://git.kernel.org/netdev/net/c/0f4558ae9187
  - [v2,2/2] Revert "xen-netback: Check for hotplug-status existence before watching"
    https://git.kernel.org/netdev/net/c/e8240addd0a3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



