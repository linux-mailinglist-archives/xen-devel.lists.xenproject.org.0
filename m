Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C002F90C4
	for <lists+xen-devel@lfdr.de>; Sun, 17 Jan 2021 06:35:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69154.123830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l10in-0005ip-Rx; Sun, 17 Jan 2021 05:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69154.123830; Sun, 17 Jan 2021 05:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l10in-0005iQ-Of; Sun, 17 Jan 2021 05:35:29 +0000
Received: by outflank-mailman (input) for mailman id 69154;
 Sun, 17 Jan 2021 02:20:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JBdI=GU=kernel.org=patchwork-bot+netdevbpf@srs-us1.protection.inumbo.net>)
 id 1l0xfp-0004Kx-8c
 for xen-devel@lists.xenproject.org; Sun, 17 Jan 2021 02:20:13 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 693e18d8-f302-443e-b6ff-cac171085d4e;
 Sun, 17 Jan 2021 02:20:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1EA7322CB8;
 Sun, 17 Jan 2021 02:20:10 +0000 (UTC)
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 0AEBD60658;
 Sun, 17 Jan 2021 02:20:10 +0000 (UTC)
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
X-Inumbo-ID: 693e18d8-f302-443e-b6ff-cac171085d4e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610850010;
	bh=ORQl1ZFd11tXszy9IjdFFuITzpen0YjySzTPviRMEh4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LBqHqoWJucjw3HIAcEiRHddbHmZGc/5C4egWd3sUP+8sDHxa0OHsmth8puPy2dWsd
	 vJf/Az2S4ocZDZmHYbQpKNneAnc7At1mKvWjmrEKToq8hnJUu+CC/nInGc6WyDKBnm
	 6flzMGPOoSjiTeJ7IdgNQxCWlVJq89w4IZ1zYBJwfcyYwvI2ZkFbBrdcXpKDv5bc9f
	 u5XeQNfe553p0wxKpQdtZ4GsQ2j9pfNxFoKQ+nkvsfP40Zm5XNxD6Eq9fbmg81j/Cn
	 LVtRvh1kHLuzhYc5Oi6POmY2Wmb/cwHx6OShdHvNAftGN6hzRB/nAnHQi0kD7hOPwu
	 sVtsfh7ba/xzw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND v2 0/7] Rid W=1 warnings in Ethernet
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <161085001003.18239.10975020699076928503.git-patchwork-notify@kernel.org>
Date: Sun, 17 Jan 2021 02:20:10 +0000
References: <20210115200905.3470941-1-lee.jones@linaro.org>
In-Reply-To: <20210115200905.3470941-1-lee.jones@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, ast@kernel.org, benh@kernel.crashing.org,
 bpf@vger.kernel.org, daniel@iogearbox.net, drt@linux.ibm.com,
 dnevil@snmc.com, davem@davemloft.net, erik@vt.edu, geoff@infradead.org,
 grygorii.strashko@ti.com, gustavoars@kernel.org, kou.ishizaki@toshiba.co.jp,
 ivan.khoronzhuk@linaro.org, kuba@kernel.org, Jens.Osterkamp@de.ibm.com,
 hawk@kernel.org, jallen@linux.vnet.ibm.com, john.fastabend@gmail.com,
 kurt@linutronix.de, ljp@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, netdev@vger.kernel.org, nico@fluxnic.net, paul@xen.org,
 paulus@samba.org, pc@denkart.be, rmk@arm.linux.org.uk, rusty@rustcorp.com.au,
 santi_leon@yahoo.com, sukadev@linux.ibm.com, tlfalcon@linux.vnet.ibm.com,
 utz.bacher@de.ibm.com, wei.liu@kernel.org, xen-devel@lists.xenproject.org

Hello:

This series was applied to netdev/net-next.git (refs/heads/master):

On Fri, 15 Jan 2021 20:08:58 +0000 you wrote:
> Resending the stragglers again.
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> No changes since v2, just a rebase onto net-next.
> 
> [...]

Here is the summary with links:
  - [1/7] net: ethernet: smsc: smc91x: Fix function name in kernel-doc header
    https://git.kernel.org/netdev/net-next/c/7d2a92445e3f
  - [2/7] net: xen-netback: xenbus: Demote nonconformant kernel-doc headers
    https://git.kernel.org/netdev/net-next/c/090c7ae8e0d0
  - [3/7] net: ethernet: ti: am65-cpsw-qos: Demote non-conformant function header
    https://git.kernel.org/netdev/net-next/c/935888cda820
  - [4/7] net: ethernet: ti: am65-cpts: Document am65_cpts_rx_enable()'s 'en' parameter
    https://git.kernel.org/netdev/net-next/c/e49e4647f3e2
  - [5/7] net: ethernet: ibm: ibmvnic: Fix some kernel-doc misdemeanours
    https://git.kernel.org/netdev/net-next/c/807086021bf5
  - [6/7] net: ethernet: toshiba: ps3_gelic_net: Fix some kernel-doc misdemeanours
    https://git.kernel.org/netdev/net-next/c/b51036321461
  - [7/7] net: ethernet: toshiba: spider_net: Document a whole bunch of function parameters
    https://git.kernel.org/netdev/net-next/c/e242d5989965

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



