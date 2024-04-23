Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D448ADACA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 02:21:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710258.1109403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rz3tj-00066R-AH; Tue, 23 Apr 2024 00:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710258.1109403; Tue, 23 Apr 2024 00:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rz3tj-00064F-7S; Tue, 23 Apr 2024 00:20:35 +0000
Received: by outflank-mailman (input) for mailman id 710258;
 Tue, 23 Apr 2024 00:20:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GBR6=L4=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1rz3th-000649-4i
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 00:20:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4aaca3e7-0107-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 02:20:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9269E6118B;
 Tue, 23 Apr 2024 00:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 358B3C3277B;
 Tue, 23 Apr 2024 00:20:29 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2132FC43440; Tue, 23 Apr 2024 00:20:29 +0000 (UTC)
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
X-Inumbo-ID: 4aaca3e7-0107-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713831629;
	bh=nJGAdOsdxMFruesh3otRdPG+Ht1wDcOMr82PxGSWAnk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=c7ugc2X7dHeJldLg8Co0ipOSwNbiMfXWf0J9o75SttFerU4GC1FiHVRdYtcQ8evjw
	 +qGe6GDTZpCtf/FsduqDc3PKpO0kxKkaMYBJ4OIsXRs/g7B3tL+IgqE2aHmtovhFLV
	 Rcrd7NPSaT3vD3QUZZI/ELoiz/990yTcOENRoII51YNEgRP9H8LrOJvaiH+UEPqkCG
	 1PKan/7teo1eKV95we6CkgiGcj4SXGmq8/aaWwaB4jM5kZLUtNS4Wk6okxCJ20Qqa3
	 26OItwB2wYMdNq1b9efepdmGPDrj5SBBWMvwsa47h3BV0J22FFKOnEyiQaUiDBjs9I
	 0NIWxLTVIYCkA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH io_uring-next/net-next v2 0/4] implement io_uring notification
 (ubuf_info) stacking
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171383162913.28674.10529865050261202154.git-patchwork-notify@kernel.org>
Date: Tue, 23 Apr 2024 00:20:29 +0000
References: <cover.1713369317.git.asml.silence@gmail.com>
In-Reply-To: <cover.1713369317.git.asml.silence@gmail.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org, netdev@vger.kernel.org, axboe@kernel.dk,
 davem@davemloft.net, kuba@kernel.org, dsahern@kernel.org,
 edumazet@google.com, willemdebruijn.kernel@gmail.com, jasowang@redhat.com,
 wei.liu@kernel.org, paul@xen.org, xen-devel@lists.xenproject.org,
 mst@redhat.com, virtualization@lists.linux.dev, kvm@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 19 Apr 2024 12:08:38 +0100 you wrote:
> Please, don't take directly, conflicts with io_uring.
> 
> To have per request buffer notifications each zerocopy io_uring send
> request allocates a new ubuf_info. However, as an skb can carry only
> one uarg, it may force the stack to create many small skbs hurting
> performance in many ways.
> 
> [...]

Here is the summary with links:
  - [io_uring-next/net-next,v2,1/4] net: extend ubuf_info callback to ops structure
    https://git.kernel.org/netdev/net-next/c/7ab4f16f9e24
  - [io_uring-next/net-next,v2,2/4] net: add callback for setting a ubuf_info to skb
    https://git.kernel.org/netdev/net-next/c/65bada80dec1
  - [io_uring-next/net-next,v2,3/4] io_uring/notif: simplify io_notif_flush()
    (no matching commit)
  - [io_uring-next/net-next,v2,4/4] io_uring/notif: implement notification stacking
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



