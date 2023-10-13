Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C300F7C820F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 11:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616344.958276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrEV3-0006CO-3V; Fri, 13 Oct 2023 09:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616344.958276; Fri, 13 Oct 2023 09:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrEV3-0006Ah-0a; Fri, 13 Oct 2023 09:30:29 +0000
Received: by outflank-mailman (input) for mailman id 616344;
 Fri, 13 Oct 2023 09:30:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9owW=F3=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1qrEV2-0006Ab-0a
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 09:30:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2350b3d6-69ab-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 11:30:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 546F76203B;
 Fri, 13 Oct 2023 09:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EADFAC433C7;
 Fri, 13 Oct 2023 09:30:23 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C7684C73FEA; Fri, 13 Oct 2023 09:30:23 +0000 (UTC)
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
X-Inumbo-ID: 2350b3d6-69ab-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697189424;
	bh=zfKLiUU/AufCJHwWSWrzPG7oidZX9KQ3FzwTiUS/QeQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ESFd132eq0rgvM1vQqVC1SPnM6aEpKXWoBHDvCGj/tSGkIeohsRVbh4OVBmgNR0oo
	 dJiYncP0ndiyM9JTsWjfYQ+gu2jDMtWbMgu3MDoABkfdiJg6tW7EoVaSXZNKNpo5Xg
	 UvdCRRJNGaS8Xc7SfO+Nr9SskHnNyYkHYcP1J96lpLpfPpz6WjV1HOE+ksvDTNIzph
	 G+rd66Xbx93ggz3oY0oIhxJpMukDIu5qclR8+NARJFmjqaRC90CnlBBmyddzbNSz5r
	 UxhKR08dNbmm9wAtIDN/v0QThdqI71d12lcHIvL24RmnDXHL1nYhI99RQSWsZXSsYo
	 snarzUSSufkdA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/1] Add software timestamp capabilities to xen-netback device
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <169718942381.12102.14938354463321505614.git-patchwork-notify@kernel.org>
Date: Fri, 13 Oct 2023 09:30:23 +0000
References: <20231010142630.984585-1-luca.fancellu@arm.com>
In-Reply-To: <20231010142630.984585-1-luca.fancellu@arm.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: linux-kernel@vger.kernel.org, wei.liu@kernel.org, paul@xen.org,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org, rahul.singh@arm.com

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue, 10 Oct 2023 15:26:29 +0100 you wrote:
> Hi all,
> 
> during some experiment using PTP (ptp4l) between a Dom0 domain and a DomU guest,
> I noticed that the virtual interface brought up by the toolstack was not able
> to be used as ptp4l interface on the Dom0 side, a brief investigation on the
> drivers revealed that the backend driver doesn't have the SW timestamp
> capabilities, so in order to provide them, I'm sending this patch.
> 
> [...]

Here is the summary with links:
  - [1/1] xen-netback: add software timestamp capabilities
    https://git.kernel.org/netdev/net-next/c/0b38d2ec2282

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



