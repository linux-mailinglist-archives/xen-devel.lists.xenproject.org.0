Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 875E6331BFA
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 02:00:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95166.179562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJQia-0003mm-FR; Tue, 09 Mar 2021 00:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95166.179562; Tue, 09 Mar 2021 00:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJQia-0003mN-CP; Tue, 09 Mar 2021 00:59:24 +0000
Received: by outflank-mailman (input) for mailman id 95166;
 Tue, 09 Mar 2021 00:59:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4vHL=IH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lJQiY-0003mI-6p
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 00:59:22 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e17971c6-bdda-4ff8-9961-4067cc8121c7;
 Tue, 09 Mar 2021 00:59:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 358F86514D;
 Tue,  9 Mar 2021 00:59:20 +0000 (UTC)
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
X-Inumbo-ID: e17971c6-bdda-4ff8-9961-4067cc8121c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615251560;
	bh=WREUcIWLYSGaofIfbvyGvcvkIqLBJGwNTp9dVTZ1dUk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kEDvxtot74SK5FUdiFo5xh/9hv0B3uu6ap+EVYJAzaf1L7AAAcHQxFRwBmm7wzAWp
	 QPhPHTqXdtMUj+ExB7n4o8FbAwE/5cIMnGOdt94Yb4EDitIbSJogYNIPAKHbB+OM6S
	 oF6NKzaP3xvx4HTCFY5QrOMmLJq6Zz03Xr2DkHPVqqNHMlfK7aeEIlS8L5MHIHwwqj
	 CZwTz1J9M1LnZCx6wb6jwWtdQs2Vo4QEKUQYzVon+z84bTvH4yDcUw5L1bzoDyI7Dq
	 vgiw4CxzmV/uD0Ot1Glt4FVC4J0acDfGlZyfF1baJ7exsOHcC9+Xq8NKaHb+kLDnj0
	 6tpUv30ZoSi5A==
Date: Mon, 8 Mar 2021 16:59:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, famzheng@amazon.com, 
    sstabellini@kernel.org, cardoe@cardoe.com, wl@xen.org, 
    Bertrand.Marquis@arm.com, andrew.cooper3@citrix.com
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported
 to 4.9 (5.1 on arm64)
In-Reply-To: <af575951-9d48-09da-d120-a6120ca29ead@xen.org>
Message-ID: <alpine.DEB.2.21.2103081654030.16374@sstabellini-ThinkPad-T480s>
References: <161507188317.11025.6744028462008264481@c667a6b167f6> <af575951-9d48-09da-d120-a6120ca29ead@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 7 Mar 2021, Julien Grall wrote:
> On 06/03/2021 23:04, no-reply@patchew.org wrote:
> > Hi,
> > 
> > Patchew automatically ran gitlab-ci pipeline with this patch (series)
> > applied, but the job failed. Maybe there's a bug in the patches?
> > 
> > You can find the link to the pipeline near the end of the report below:
> > 
> > Type: series
> > Message-id: 20210306214148.27021-1-julien@xen.org
> > Subject: [PATCH for-4.15] xen: Bump the minimum version of GCC supported to
> > 4.9 (5.1 on arm64)
> > 
> > === TEST SCRIPT BEGIN ===
> > #!/bin/bash
> > sleep 10
> > patchew gitlab-pipeline-check -p xen-project/patchew/xen
> > === TEST SCRIPT END ===
> > 
> > warning: redirecting to https://gitlab.com/xen-project/patchew/xen.git/
> > warning: redirecting to https://gitlab.com/xen-project/patchew/xen.git/
> >  From https://gitlab.com/xen-project/patchew/xen
> >   * [new tag]               patchew/20210306214148.27021-1-julien@xen.org ->
> > patchew/20210306214148.27021-1-julien@xen.org
> > Switched to a new branch 'test'
> > f332859b88 xen: Bump the minimum version of GCC supported to 4.9 (5.1 on
> > arm64)
> > 
> > === OUTPUT BEGIN ===
> > [2021-03-06 21:45:17] Looking up pipeline...
> > [2021-03-06 21:45:18] Found pipeline 266507477:
> > 
> > https://gitlab.com/xen-project/patchew/xen/-/pipelines/266507477
> > 
> > [2021-03-06 21:45:18] Waiting for pipeline to finish...
> > [2021-03-06 22:00:21] Still waiting...
> > [2021-03-06 22:15:26] Still waiting...
> > [2021-03-06 22:30:31] Still waiting...
> > [2021-03-06 22:45:35] Still waiting...
> > [2021-03-06 23:00:41] Still waiting...
> > [2021-03-06 23:04:42] Pipeline failed
> > [2021-03-06 23:04:42] Job 'qemu-smoke-x86-64-clang-pvh' in stage 'test' is
> > skipped
> > [2021-03-06 23:04:42] Job 'qemu-smoke-x86-64-gcc-pvh' in stage 'test' is
> > skipped
> > [2021-03-06 23:04:42] Job 'qemu-smoke-x86-64-clang' in stage 'test' is
> > skipped
> > [2021-03-06 23:04:42] Job 'qemu-smoke-x86-64-gcc' in stage 'test' is skipped
> > [2021-03-06 23:04:42] Job 'qemu-smoke-arm64-gcc' in stage 'test' is skipped
> > [2021-03-06 23:04:42] Job 'qemu-alpine-arm64-gcc' in stage 'test' is skipped
> > [2021-03-06 23:04:42] Job 'build-each-commit-gcc' in stage 'test' is skipped
> > [2021-03-06 23:04:42] Job 'alpine-3.12-clang' in stage 'build' is failed
> 
> The following jobs are failing:
> 
> alpine-3.12-clang [1]
> debian-unstable-32-gcc-debug
> debian-unstable-clang
> debian-unstable-gcc-randconfig
> ubuntu-bionic-clang
> 
> Cloning into 'qemu-xen-dir-remote.tmp'...
> error: inflate: data stream error (incorrect data check)
> fatal: serious inflate inconsistency
> fatal: index-pack failed
> 
> This looks unrelated to my patch. Possibly a network error?

Yeah.


> =========
> 
> centos-7-2-gcc [2]
> centos-7-2-gcc-debug
> centos-7-gcc
> centos-7-gcc-debug
> 
> Centos 7 is using GCC 4.8.5. This patch is bumping the minimum version to 4.9.
> So the failure is expected.
> 
> We may have to disable the jobs if my patch goes ahead. May I ask why we chose
> to build on Centos 7?

CentOS 7 is still the latest and it is maintained until 2024:

https://wiki.centos.org/About/Product

I don't have a lot of direct experience with x86 users any longer, but
this seems to be problematic?


> ==========
> 
> ubuntu-trusty-gcc [3]
> ubuntu-trusty-gcc-debug
> 
> Ubuntu trusty is using GCC 4.8.4. This patch is bumping the minimum version to
> 4.9. So the failure is expected. We may have to disable the jobs if my patch
> goes ahead. May I ask why we chose to build on Ubuntu trusty?

Ubuntu Trusty is in "Extended Security Maintenance", so technically
still supported also:

https://ubuntu.com/about/release-cycle

 
> Cheers,
> 
> [1] https://gitlab.com/xen-project/patchew/xen/-/jobs/1078273595
> [2] https://gitlab.com/xen-project/patchew/xen/-/jobs/1078273539
> [3] https://gitlab.com/xen-project/patchew/xen/-/jobs/1078273575
> 
> 
> > === OUTPUT END ===
> > 
> > Test command exited with code: 1


