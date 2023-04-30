Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D116F2747
	for <lists+xen-devel@lfdr.de>; Sun, 30 Apr 2023 03:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527724.820383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psvkY-0002P2-Mr; Sun, 30 Apr 2023 01:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527724.820383; Sun, 30 Apr 2023 01:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psvkY-0002MT-JS; Sun, 30 Apr 2023 01:21:14 +0000
Received: by outflank-mailman (input) for mailman id 527724;
 Sun, 30 Apr 2023 01:21:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=idFW=AV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1psvkX-0002MN-TP
 for xen-devel@lists.xenproject.org; Sun, 30 Apr 2023 01:21:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ab3a7da-e6f5-11ed-b225-6b7b168915f2;
 Sun, 30 Apr 2023 03:21:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81A0960A2A;
 Sun, 30 Apr 2023 01:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01214C433EF;
 Sun, 30 Apr 2023 01:21:08 +0000 (UTC)
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
X-Inumbo-ID: 4ab3a7da-e6f5-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682817669;
	bh=zvdiHVD+yQZ6YgLLxkqDm2WUcDmMrw3uH/G3jHJgrnE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WkdxA0MsIkRlVTvyBg7Zv2f9vLtXaQ7swIawx3jhreSRj4v0nFkIppGpJ//SL50+w
	 1Hf/YR2dghTSynRaX46B0HR9kEtK/iCccTfKkZ1oUlInkOCG23qqjVplT1H4egWfGV
	 5z/CVel353VtfOjiI1umyw9aIE8IKytFFajZaQjgoufODcMHg+p0ir+PnL6N6SI2Di
	 kUVDcedzaVdvXlhk3AN6IIw8OFZmOalJYMoxaYr3dGccPPZUlqutvJuSya5PRzSM2/
	 yLgDOMSmSAw/bM7gUvWWYXLM8TCk+g/3kx0vzeSZ+GhLuO8drzFtCgsxGk3Xxq8Vjf
	 sJVBeTAN+RKBw==
Date: Sat, 29 Apr 2023 18:21:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: andrew.cooper3@citrix.com
cc: Stefano Stabellini <sstabellini@kernel.org>, alejandro.vallejo@cloud.com, 
    committers@xenproject.org, michal.orzel@amd.com, 
    xen-devel@lists.xenproject.org
Subject: Re: xen | Failed pipeline for staging | 6a47ba2f
In-Reply-To: <ca0144a6-2c57-0cc3-fd27-5dbe59491ef3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2304291808420.974517@ubuntu-linux-20-04-desktop>
References: <644bfbc6939d8_2a49bbb403253f4@gitlab-sidekiq-catchall-v2-78885c497-qxnp2.mail> <alpine.DEB.2.22.394.2304281905020.974517@ubuntu-linux-20-04-desktop> <ca0144a6-2c57-0cc3-fd27-5dbe59491ef3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1229086743-1682817254=:974517"
Content-ID: <alpine.DEB.2.22.394.2304291814590.974517@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1229086743-1682817254=:974517
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2304291814591.974517@ubuntu-linux-20-04-desktop>

On Sat, 29 Apr 2023, andrew.cooper3@citrix.com wrote:
> On 29/04/2023 4:05 am, Stefano Stabellini wrote:
> > On Fri, 28 Apr 2023, GitLab wrote:
> >> Pipeline #852233694 triggered by
> >> [568538936b4ac45a343cb3a4ab0c6cda?s=48&d=identicon]
> >> Ganis
> >> had 3 failed jobs
> >> Failed jobs
> >> ✖
> >> test
> >> qemu-smoke-dom0less-arm64-gcc
> > This is a real failure on staging. Unfortunately it is intermittent. It
> > usually happens once every 3-8 tests for me.
> >
> > The test script is:
> > automation/scripts/qemu-smoke-dom0less-arm64.sh
> >
> > and for this test it is invoked without arguments. It is starting 2
> > dom0less VMs in parallel, then dom0 does a xl network-attach and the
> > domU is supposed to setup eth0 and ping.
> >
> > The failure is that nothing happens after "xl network-attach". The domU
> > never hotplugs any interfaces. I have logs that show that eth0 never
> > shows up and the only interface is lo no matter how long we wait.
> >
> >
> > On a hunch, I removed Alejandro patches. Without them, I ran 20 tests
> > without any failures. I have not investigated further but it looks like
> > one of these 4 commits is the problem:
> >
> > 2023-04-28 11:41 Alejandro Vallejo    tools: Make init-xenstore-domain use xc_domain_getinfolist()
> > 2023-04-28 11:41 Alejandro Vallejo    tools: Refactor console/io.c to avoid using xc_domain_getinfo()
> > 2023-04-28 11:41 Alejandro Vallejo    tools: Create xc_domain_getinfo_single()
> > 2023-04-28 11:41 Alejandro Vallejo    tools: Make some callers of xc_domain_getinfo() use xc_domain_getinfol 
> 
> In commit order (reverse of above), these patches are:
> 
> 1) Modify the python bindings and xenbaked
> 2) Introduce a new library function with a better API/ABI
> 3) Modify xenconsoled
> 4) Modify init-xenstore-domain
> 
> The test isn't using anything from 4 or 1, and 2 definitely isn't
> breaking anything on its own.
> 
> That just leaves 3.  This test does turn activate xenconsoled by virtue
> of invoking xencommons, but that doesn't help explain why a change in
> xenconsoled interferes (and only intermittently on this one single test)
> with `xl network-attach`.
> 
> The xenconsoled change does have correctness fix in it, requiring
> xenconsoled to ask for all domains info in one go.  This does mean it's
> hypercall-buffering (i.e. bouncing) a 4M array now where previously it
> was racy figuring out which VMs had come and gone.

Your guess was correct. I have done more bisecting today. The culprit is
the following commit (I reverted only this commit and ran 25 tests
successfully, usually it fails in less than 5):

e522c98c3    tools: Refactor console/io.c to avoid using xc_domain_getinfo()

I don't know why. Traditionally if this was OSSTest we would revert the
commit until we understand what is going on to unblock master/staging. I
suggest to do the same here to be consistent. And also because otherwise
future failures in this test due to other bugs might be masked by this
unsolved issue.

I have nothing against this commit and I'd be happy for it to go in
again as soon as things are not necessarely resolved, but at least
better understood.
--8323329-1229086743-1682817254=:974517--

