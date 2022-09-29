Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3C35EEBA6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 04:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413476.657138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odjA3-0003sF-LH; Thu, 29 Sep 2022 02:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413476.657138; Thu, 29 Sep 2022 02:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odjA3-0003pd-IX; Thu, 29 Sep 2022 02:20:27 +0000
Received: by outflank-mailman (input) for mailman id 413476;
 Thu, 29 Sep 2022 02:20:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VlF=2A=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1odjA1-0003pX-Rx
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 02:20:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 455f7e0f-3f9d-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 04:20:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 117E961F95;
 Thu, 29 Sep 2022 02:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FC7DC433B5;
 Thu, 29 Sep 2022 02:20:21 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 56BDAE21EC6; Thu, 29 Sep 2022 02:20:21 +0000 (UTC)
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
X-Inumbo-ID: 455f7e0f-3f9d-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664418021;
	bh=CqP6AJQBgb3mLDY8tX8RWjFHzQtZGZK5lDjmqSz457Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jxWk6v5Ze0QvpoE73wtK36/dRnzL8GjGUNrU8TpMTWm4lo3rPFLDWHHwWntlXm1Bf
	 zwzubAi+xqy50lByLS5Spj2NoK9l1v4OrzaDe8PGS8VMjs36AQueBm+CUueKtsiveF
	 4eNtAajPYESx6utyzoaTcXyVgWhW4SVVDdLwvPvzGgVDUw1blcHveV/AlzGdVelXOO
	 5NgYV4NRwrA8dezfB5NC/HdgIJg763M8c1peVPDYcBJXHIAFMTKfjxMw5qWNChz5Fk
	 0trMS3n5BXHlAGmFXHD2HfF5+nr9dRTvu6VQVan0eG10zxJWSaHv7XPMWcPrGlfMlL
	 UXDN+FP6zgN7w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/4] shrink struct ubuf_info
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <166441802135.18961.14047192093792393033.git-patchwork-notify@kernel.org>
Date: Thu, 29 Sep 2022 02:20:21 +0000
References: <cover.1663892211.git.asml.silence@gmail.com>
In-Reply-To: <cover.1663892211.git.asml.silence@gmail.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 wei.liu@kernel.org, paul@xen.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, mst@redhat.com,
 jasowang@redhat.com

Hello:

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 23 Sep 2022 17:39:00 +0100 you wrote:
> struct ubuf_info is large but not all fields are needed for all
> cases. We have limited space in io_uring for it and large ubuf_info
> prevents some struct embedding, even though we use only a subset
> of the fields. It's also not very clean trying to use this typeless
> extra space.
> 
> Shrink struct ubuf_info to only necessary fields used in generic paths,
> namely ->callback, ->refcnt and ->flags, which take only 16 bytes. And
> make MSG_ZEROCOPY and some other users to embed it into a larger struct
> ubuf_info_msgzc mimicking the former ubuf_info.
> 
> [...]

Here is the summary with links:
  - [net-next,1/4] net: introduce struct ubuf_info_msgzc
    https://git.kernel.org/netdev/net-next/c/6eaab4dfdd30
  - [net-next,2/4] xen/netback: use struct ubuf_info_msgzc
    https://git.kernel.org/netdev/net-next/c/b63ca3e822e7
  - [net-next,3/4] vhost/net: use struct ubuf_info_msgzc
    https://git.kernel.org/netdev/net-next/c/dfff202be5ea
  - [net-next,4/4] net: shrink struct ubuf_info
    https://git.kernel.org/netdev/net-next/c/e7d2b510165f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



