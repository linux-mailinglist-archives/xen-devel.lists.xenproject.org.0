Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F18FB574B22
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 12:49:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367514.598565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwPE-0007KV-KF; Thu, 14 Jul 2022 10:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367514.598565; Thu, 14 Jul 2022 10:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwPE-0007Gj-H6; Thu, 14 Jul 2022 10:49:16 +0000
Received: by outflank-mailman (input) for mailman id 367514;
 Thu, 14 Jul 2022 10:49:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5WS=XT=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1oBwGX-0002w5-G9
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 10:40:17 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 593e6253-0361-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 12:40:16 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7C133B82489;
 Thu, 14 Jul 2022 10:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 156B9C34115;
 Thu, 14 Jul 2022 10:40:14 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E7C31E45228; Thu, 14 Jul 2022 10:40:13 +0000 (UTC)
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
X-Inumbo-ID: 593e6253-0361-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657795214;
	bh=Ooz89c2I2B1VTAZ2/C/Wt525paEje7ftISA5Of5DqxA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CJfxU8cIVWihxpp7021m42vgK2Ei/0zSEQole+TY1e8PG9PGGBXGl7Hcrq9Lzh4UF
	 yBEuU+1Vuw2ixt2yr8vibBI8KKpOfZjcvYYpYbv4rse/SJvPbDev2FsVydHRJTcBYM
	 quoke4L0MtCfQsQVjNSecZEFfTuffUEQw93vCVQeBl6J8N1DzsWS3rM1BXiWo3uXLh
	 9FPJRj9f2lvKorZXb06gOHS3sXe9WAKSBW8VZKFHKutNDNPCJgxo+BmmWo5ua198DZ
	 ATujL9ZgwnSa6aHmmp2kmPlNN73gMetSwua21imuZWyORO1J1rxiVri971b9EGPXE9
	 G1dS7RhwStHVQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] xen-netfront: XSA-403 follow-on
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <165779521394.17700.1175257223306226603.git-patchwork-notify@kernel.org>
Date: Thu, 14 Jul 2022 10:40:13 +0000
References: <7fca0e44-43b5-8448-3653-249d117dc084@suse.com>
In-Reply-To: <7fca0e44-43b5-8448-3653-249d117dc084@suse.com>
To: Jan Beulich <JBeulich@suse.com>
Cc: netdev@vger.kernel.org, xen-devel@lists.xenproject.org, jgross@suse.com,
 stefano@stabellini.net, oleksandr_tyshchenko@epam.com

Hello:

This series was applied to netdev/net-next.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 13 Jul 2022 11:18:03 +0200 you wrote:
> While investigating the XSA, I did notice a few more things. The two
> patches aren't really dependent on one another.
> 
> 1: remove leftover call to xennet_tx_buf_gc()
> 2: re-order error checks in xennet_get_responses()
> 
> Jan

Here is the summary with links:
  - [net-next,1/2] xen-netfront: remove leftover call to xennet_tx_buf_gc()
    https://git.kernel.org/netdev/net-next/c/ad39bafda736
  - [net-next,2/2] xen-netfront: re-order error checks in xennet_get_responses()
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



