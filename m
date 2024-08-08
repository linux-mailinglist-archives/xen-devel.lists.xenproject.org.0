Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F18A294C749
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 01:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774498.1184919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scCPb-0007WK-Na; Thu, 08 Aug 2024 23:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774498.1184919; Thu, 08 Aug 2024 23:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scCPb-0007U8-Kz; Thu, 08 Aug 2024 23:19:15 +0000
Received: by outflank-mailman (input) for mailman id 774498;
 Thu, 08 Aug 2024 23:19:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1bC=PH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1scCPa-0007U2-CX
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 23:19:14 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d8b752e-55dc-11ef-8776-851b0ebba9a2;
 Fri, 09 Aug 2024 01:19:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 921F1CE1407;
 Thu,  8 Aug 2024 23:19:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A68C32782;
 Thu,  8 Aug 2024 23:19:07 +0000 (UTC)
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
X-Inumbo-ID: 9d8b752e-55dc-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723159147;
	bh=wV0KOCd6lbXLJN77s0oj0mlEgtKOhM0ptbv+zoNhRyM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gtly/fGm8A5RMtcXHBQvL57MHZzYyol+Dv3UmKM2Q43pHGBJ54D71x9ZqT7to0HiR
	 Cg+chKoYi8VaT6CtX3ovMzRhThS12DHWG1WfAn1W5458eg3d23dMTSdidfejG82Ttq
	 gCD/cdWgcGCs28aRPGAxqHIb+4S/ujm+omVKlpwtPQvExEMVY/Zv+pBDIdPwFpAEYB
	 tlyomKfGVG/9j/EMUfIuYkgdwFNsUA1EWBvZT59Ed8RqBmNerIGx2ct4VKZIlco0kZ
	 uS26KQM2BPTd2V4NNPNdt/LnUyfSKpVv2oEE2lKAKYmqMmBRz7SxW3HsPZ8dos77Dq
	 5SbwhUdaMjX+A==
Date: Thu, 8 Aug 2024 16:19:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: xen | Failed pipeline for staging | 08aacc39
In-Reply-To: <D3AMYKSVBGFR.2IZRXPNCIUUIM@cloud.com>
Message-ID: <alpine.DEB.2.22.394.2408081552570.4954@ubuntu-linux-20-04-desktop>
References: <66b4bd64b9733_2f15a5d3890299@gitlab-sidekiq-catchall-v2-754c69bc57-l5rxx.mail> <c655dbd9-046a-451a-a7e8-670a1eaf4ab0@suse.com> <D3AMYKSVBGFR.2IZRXPNCIUUIM@cloud.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 Aug 2024, Alejandro Vallejo wrote:
> On Thu Aug 8, 2024 at 2:02 PM BST, Jan Beulich wrote:
> > On 08.08.2024 14:43, GitLab wrote:
> > > 
> > > 
> > > Pipeline #1405649318 has failed!
> > > 
> > > Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> > > Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> > > 
> > > Commit: 08aacc39 ( https://gitlab.com/xen-project/hardware/xen/-/commit/08aacc392d86d4c7dbebdb5e664060ae2af72057 )
> > > Commit Message: x86/emul: Fix misaligned IO breakpoint behaviou...
> > > Commit Author: Matthew Barnes
> > > Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> > > 
> > > 
> > > Pipeline #1405649318 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1405649318 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> > > had 4 failed jobs.
> > > 
> > > Job #7535428747 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7535428747/raw )
> > > 
> > > Stage: build
> > > Name: qemu-system-aarch64-6.0.0-arm64-export
> > > Job #7535428873 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7535428873/raw )
> > > 
> > > Stage: build
> > > Name: alpine-3.18-gcc-debug-arm64-static-shared-mem
> > > Job #7535428869 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7535428869/raw )
> > > 
> > > Stage: build
> > > Name: alpine-3.18-gcc-debug-arm64-staticmem
> > > Job #7535429434 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7535429434/raw )
> > > 
> > > Stage: test
> > > Name: qemu-smoke-dom0less-arm32-gcc
> >
> > All Arm failures when the three commits under test only touch x86 code.
> > How can that be? And Stefano, note how this would needlessly have blocked
> > a merge request, if we were already using that model you're proposing to
> > switch to.
> >
> > Jan
> 
> I'd argue it the other way around. It would (may?) have prevented reaching that
> situation in the first place.

Thanks, Alejandro. That's exactly the right mindset and precisely why we
should transition to pre-commit testing. Recently, we encountered a few
broken tests caused by easily avoidable errors from untested commits.

As it happens, due to a change in the ARM GitLab runner on August 10, I
added two new temporary ARM GitLab runners. However, one of them appears
to be experiencing intermittent network issues, I might have to disable
it.

