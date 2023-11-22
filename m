Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 462707F3C31
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 04:07:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638397.994926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5daF-0001Vp-T1; Wed, 22 Nov 2023 03:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638397.994926; Wed, 22 Nov 2023 03:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5daF-0001Sw-P9; Wed, 22 Nov 2023 03:07:23 +0000
Received: by outflank-mailman (input) for mailman id 638397;
 Wed, 22 Nov 2023 03:07:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5daE-0001Sq-4x
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 03:07:22 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e68c95c-88e4-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 04:07:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 23286B80FE1;
 Wed, 22 Nov 2023 03:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C25C433C7;
 Wed, 22 Nov 2023 03:07:15 +0000 (UTC)
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
X-Inumbo-ID: 3e68c95c-88e4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700622436;
	bh=SgzZgSgQ3QYJT82sPJhnHOwxYNLpM41BnfzrqCGDSw8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QKpzd/RENQUaCw0HwqAjX2uiZXBGGr1ovax6dvNvlFBYN91TJoEb0dDpOuYwu1X1n
	 seMLG73rRXVwbVBC/fgl4jAvoqgQDf62PqyNBF/Lq1JIWqcrsEJSEDW17gDBZikWoe
	 oSATku+UjaDLdI+XAGcJniP7dzwEoF49uV6MGFy4h5+Z2jy1VYlXkzoIwhCSLAiRr6
	 uhBFpdHNBczvs1gjNT7baZL/kH+i+B27vjZ3trrJ4nqFeW4+m2Ui3Q7ZaBXvaHR7VV
	 uq6rKuBZxNyXNVMgcih8vQFlhfgPpVxAEGRNrYmhTMc/5VCmeduSjOwtSS8zzqBVYu
	 T1xqM2FuayXEA==
Date: Tue, 21 Nov 2023 19:07:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Juergen Gross <jgross@suse.com>, 
    osstest service owner <osstest-admin@xenproject.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, oleksandr_tyshchenko@epam.com
Subject: Re: [linux-linus test] 183794: regressions - FAIL
In-Reply-To: <alpine.DEB.2.22.394.2311201631140.773207@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2311211823110.2053963@ubuntu-linux-20-04-desktop>
References: <osstest-183794-mainreport@xen.org> <f7b11bb5-9d08-4678-bb97-3a2d96537439@suse.com> <alpine.DEB.2.22.394.2311201631140.773207@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-941497147-1700620947=:2053963"
Content-ID: <alpine.DEB.2.22.394.2311211845100.2053963@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-941497147-1700620947=:2053963
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2311211845101.2053963@ubuntu-linux-20-04-desktop>

On Mon, 20 Nov 2023, Stefano Stabellini wrote:
> On Mon, 20 Nov 2023, Juergen Gross wrote:
> > On 20.11.23 03:21, osstest service owner wrote:
> > > flight 183794 linux-linus real [real]
> > > http://logs.test-lab.xenproject.org/osstest/logs/183794/
> > > 
> > > Regressions :-(
> > > 
> > > Tests which did not succeed and are blocking,
> > > including tests which could not be run:
> > >   test-arm64-arm64-examine      8 reboot                   fail REGR. vs.
> > > 183766
> > 
> > I'm seeing the following in the serial log:
> > 
> > Nov 20 00:25:41.586712 [    0.567318] kernel BUG at
> > arch/arm64/xen/../../arm/xen/enlighten.c:164!
> > Nov 20 00:25:41.598711 [    0.574002] Internal error: Oops - BUG:
> > 00000000f2000800 [#1] PREEMPT SMP
> > 
> > The related source code lines in the kernel are:
> > 
> > ········err = HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_info, xen_vcpu_nr(cpu),
> > ································ &info);
> > ········BUG_ON(err);
> > 
> > I suspect commit 20f3b8eafe0ba to be the culprit.
> > 
> > Stefano, could you please have a look?

The good news and bad news is that I cannot repro this neither with nor
without CONFIG_UNMAP_KERNEL_AT_EL0. I looked at commit 20f3b8eafe0ba but
I cannot see anything wrong with it. Looking at the register dump, from:

x0 : fffffffffffffffa

I am guessing the error was -ENXIO which is returned from map_guest_area
in Xen.

Could it be that the struct is crossing a page boundary? Or that it is
not 64-bit aligned? Do we need to do something like the following?

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 9afdc4c4a5dc..5326070c5dc0 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -484,7 +485,7 @@ static int __init xen_guest_init(void)
 	 * for secondary CPUs as they are brought up.
 	 * For uniformity we use VCPUOP_register_vcpu_info even on cpu0.
 	 */
-	xen_vcpu_info = alloc_percpu(struct vcpu_info);
+	xen_vcpu_info = __alloc_percpu(struct vcpu_info, PAGE_SIZE);
 	if (xen_vcpu_info == NULL)
 		return -ENOMEM;
 
--8323329-941497147-1700620947=:2053963--

