Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AD7C33987
	for <lists+xen-devel@lfdr.de>; Wed, 05 Nov 2025 02:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155962.1485299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGS2w-0007w3-Iu; Wed, 05 Nov 2025 01:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155962.1485299; Wed, 05 Nov 2025 01:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGS2w-0007sv-E7; Wed, 05 Nov 2025 01:10:46 +0000
Received: by outflank-mailman (input) for mailman id 1155962;
 Wed, 05 Nov 2025 01:10:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=34ny=5N=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1vGS2u-0007sp-Lc
 for xen-devel@lists.xenproject.org; Wed, 05 Nov 2025 01:10:44 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f95c9a4-b9e4-11f0-9d16-b5c5bf9af7f9;
 Wed, 05 Nov 2025 02:10:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1D5914488A;
 Wed,  5 Nov 2025 01:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACECC116B1;
 Wed,  5 Nov 2025 01:10:40 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAE14380AA54; Wed,  5 Nov 2025 01:10:15 +0000 (UTC)
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
X-Inumbo-ID: 3f95c9a4-b9e4-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762305041;
	bh=Azv52bsIeKWa7QSW1vxmRSp2Zri86Y2h560msvWaCxY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=V+vFABp5elm84Ss97Uw9f0l2rd7J1m5ys2OvlQ2FI62hO3sWjbXhw+xsmyE0DkDYq
	 v70qxtIHD4GdSy/IQJ20zPZ2ISx2E6afClcfzrY6axaZGfRMz+inyMudse+ruZO0ei
	 zvz4zH08UjhDXJhbfXpym77/PGd0dbTZB1h6SVVQthgZhZ7yZshY/J+k3FI4FC3UcP
	 wfg5xDe3NJLFJ1cjk7PLdBYTPgrKUO/ZNyRd5zoDBGg1FqcdgASiDNz9GfA9POkq4R
	 mdzFl97BUZORZXX9uCbZb8hr/Pe72T+XrWqvev8nNO0WPpH+M2yeLIsfl5HWech4VE
	 rbZDIvWqx8Ovw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] xen/netfront: Comment Correction: Fix Spelling Error and
 Description of Queue Quantity Rules
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176230501449.3047110.1916177253371882159.git-patchwork-notify@kernel.org>
Date: Wed, 05 Nov 2025 01:10:14 +0000
References: <20251103032212.2462-1-chuguangqing@inspur.com>
In-Reply-To: <20251103032212.2462-1-chuguangqing@inspur.com>
To: Chu Guangqing <chuguangqing@inspur.com>
Cc: jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 3 Nov 2025 11:22:12 +0800 you wrote:
> The original comments contained spelling errors and incomplete logical
> descriptions, which could easily lead to misunderstandings of the code
> logic. The specific modifications are as follows:
> 
> Correct the spelling error by changing "inut max" to "but not exceed the
> maximum limit";
> 
> [...]

Here is the summary with links:
  - xen/netfront: Comment Correction: Fix Spelling Error and Description of Queue Quantity Rules
    https://git.kernel.org/netdev/net-next/c/52665fcc2241

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



