Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881E96D074C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 15:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516740.801346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phsfb-0004tn-Bu; Thu, 30 Mar 2023 13:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516740.801346; Thu, 30 Mar 2023 13:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phsfb-0004rV-8P; Thu, 30 Mar 2023 13:50:27 +0000
Received: by outflank-mailman (input) for mailman id 516740;
 Thu, 30 Mar 2023 13:50:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hp/D=7W=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1phsfZ-0004rM-JT
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 13:50:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ced9b997-cf01-11ed-b464-930f4c7d94ae;
 Thu, 30 Mar 2023 15:50:20 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74A956206D;
 Thu, 30 Mar 2023 13:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD5A9C4339C;
 Thu, 30 Mar 2023 13:50:17 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B025FE2A037; Thu, 30 Mar 2023 13:50:17 +0000 (UTC)
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
X-Inumbo-ID: ced9b997-cf01-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680184217;
	bh=nCIxYfeOpNNYAdQJkG3B1YlgdvS8aT3sViVNWAQZLwA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RzU9+D40oss0bDCVl4JKyGqFN4Ay8AtGAFtuDOuNtAFRQ83P3OFSAP9yAuERvCxK+
	 Lb7bHSs3foWMf+8ZckXx9yRqHJ/mGGpsCdUVvDvisqtiTiULxgd8bSO5y3F4rGbg1Y
	 JQysUuQgHtChR+EFiMwGNin2g1dIjbVsX2Br5o0lNXHM81QPNwM7EpNEKffQ6flO50
	 hHNDNa3+uf5EsGI29LeQVTbSYElfh0FJ0DUo5arJZ5Yx9AMBLzT9sPevlf1e0AFjzv
	 0W/xJ5jBnJDMt44ndG9cQSTp1KACJGz0BvvR2ytTqAJldakrh9k/8RjtdnhTZL+Rag
	 g2H9lz8o1m04w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] xen/netback: use same error messages for same errors
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <168018421771.9777.1140138877861718257.git-patchwork-notify@kernel.org>
Date: Thu, 30 Mar 2023 13:50:17 +0000
References: <20230329080259.14823-1-jgross@suse.com>
In-Reply-To: <20230329080259.14823-1-jgross@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, wei.liu@kernel.org,
 paul@xen.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, xen-devel@lists.xenproject.org, jbeulich@suse.com

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 29 Mar 2023 10:02:59 +0200 you wrote:
> Issue the same error message in case an illegal page boundary crossing
> has been detected in both cases where this is tested.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch
> V3:
> - modify message text (Jan Beulich)
> 
> [...]

Here is the summary with links:
  - [v3] xen/netback: use same error messages for same errors
    https://git.kernel.org/netdev/net/c/2eca98e5b24d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



