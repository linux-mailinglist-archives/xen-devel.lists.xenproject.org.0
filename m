Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C666F228C
	for <lists+xen-devel@lfdr.de>; Sat, 29 Apr 2023 05:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527527.820229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psath-0003eB-Jj; Sat, 29 Apr 2023 03:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527527.820229; Sat, 29 Apr 2023 03:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psath-0003as-Df; Sat, 29 Apr 2023 03:05:17 +0000
Received: by outflank-mailman (input) for mailman id 527527;
 Sat, 29 Apr 2023 03:05:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDeG=AU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1psatf-0003ad-OV
 for xen-devel@lists.xenproject.org; Sat, 29 Apr 2023 03:05:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a75a8d12-e63a-11ed-8611-37d641c3527e;
 Sat, 29 Apr 2023 05:05:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4AC1060B68;
 Sat, 29 Apr 2023 03:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76CEC433EF;
 Sat, 29 Apr 2023 03:05:08 +0000 (UTC)
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
X-Inumbo-ID: a75a8d12-e63a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682737509;
	bh=HhmEzj+Ra0V1lJ0JXB1vLQGIJK7CQHfjNVMp9u4weR8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=B+hJc5H85Lit+Q7ez48jXGr9nqIsL2fQePpHVL733ReLhd/LXYyE8y5T599ef8Gfn
	 KLjCkgrpN1zjVXYD5ELKC9tBfcwDbkbpTXtS5Ry8GN6/ZmZYfbUM/nCJ29eycSc42i
	 5HxhOxYNUYGiurHzBWKKxPmJFyof4XVJPoIKdIocLMJMitJC12UwxmzVblTbYsUAcI
	 sLQ1ZVp/f3RtUlXsKizwldkp+n+k5C2hnRWqXOgC5OT/STDG2RtbDtJlK3NDemYJDo
	 c5CeiEk3KakKphTl/dvTg0P90htRbH0cGNjswKoAAC/YGwzt3rp6LFMLUihKgoWHoJ
	 kt8cgp8FSb1Tg==
Date: Fri, 28 Apr 2023 20:05:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: alejandro.vallejo@cloud.com
cc: committers@xenproject.org, michal.orzel@amd.com, 
    xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    sstabellini@kernel.org
Subject: Re: xen | Failed pipeline for staging | 6a47ba2f
In-Reply-To: <644bfbc6939d8_2a49bbb403253f4@gitlab-sidekiq-catchall-v2-78885c497-qxnp2.mail>
Message-ID: <alpine.DEB.2.22.394.2304281905020.974517@ubuntu-linux-20-04-desktop>
References: <644bfbc6939d8_2a49bbb403253f4@gitlab-sidekiq-catchall-v2-78885c497-qxnp2.mail>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-960710983-1682733920=:974517"
Content-ID: <alpine.DEB.2.22.394.2304281905250.974517@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-960710983-1682733920=:974517
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2304281905251.974517@ubuntu-linux-20-04-desktop>

On Fri, 28 Apr 2023, GitLab wrote:
> Pipeline #852233694 triggered by
> [568538936b4ac45a343cb3a4ab0c6cda?s=48&d=identicon]
> Ganis
> had 3 failed jobs
> Failed jobs
> ✖
> test
> qemu-smoke-dom0less-arm64-gcc

This is a real failure on staging. Unfortunately it is intermittent. It
usually happens once every 3-8 tests for me.

The test script is:
automation/scripts/qemu-smoke-dom0less-arm64.sh

and for this test it is invoked without arguments. It is starting 2
dom0less VMs in parallel, then dom0 does a xl network-attach and the
domU is supposed to setup eth0 and ping.

The failure is that nothing happens after "xl network-attach". The domU
never hotplugs any interfaces. I have logs that show that eth0 never
shows up and the only interface is lo no matter how long we wait.


On a hunch, I removed Alejandro patches. Without them, I ran 20 tests
without any failures. I have not investigated further but it looks like
one of these 4 commits is the problem:

2023-04-28 11:41 Alejandro Vallejo    tools: Make init-xenstore-domain use xc_domain_getinfolist()
2023-04-28 11:41 Alejandro Vallejo    tools: Refactor console/io.c to avoid using xc_domain_getinfo()
2023-04-28 11:41 Alejandro Vallejo    tools: Create xc_domain_getinfo_single()
2023-04-28 11:41 Alejandro Vallejo    tools: Make some callers of xc_domain_getinfo() use xc_domain_getinfol 
--8323329-960710983-1682733920=:974517--

