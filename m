Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E3D7F5432
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 00:08:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639288.996447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5wK3-0007BU-Qu; Wed, 22 Nov 2023 23:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639288.996447; Wed, 22 Nov 2023 23:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5wK3-00078B-NY; Wed, 22 Nov 2023 23:07:55 +0000
Received: by outflank-mailman (input) for mailman id 639288;
 Wed, 22 Nov 2023 23:07:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5wK2-000778-8G
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 23:07:54 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5aacc80-898b-11ee-98e1-6d05b1d4d9a1;
 Thu, 23 Nov 2023 00:07:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3C094CE2610;
 Wed, 22 Nov 2023 23:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6824AC433C8;
 Wed, 22 Nov 2023 23:07:45 +0000 (UTC)
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
X-Inumbo-ID: f5aacc80-898b-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700694466;
	bh=XsOeMMLZQkt0CjbzD+cP5LkjiKiDaq5AYuVBW/oLvck=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lVW/qh3Q9C3cZTQSFQQ9GtyvW49DNjAw+BuYPepvTVO47pEKbt2Mx3Fq6HxLxJBxu
	 WZ1EVdsvMmbQ1TcO5B137PA3hro61yOhBWfqFTG466+Nes2JU/jyemqABOanQee96x
	 emS44ESVBa3uV4XWthGuzzjPdWrNL3iVspsjvXVF5e3mVwBs+nwNQ3kmCTa/CgFoMR
	 cRJNmyu6XpxfHSkd/yeXu+ExElBI4zxzUrEhnOnETAI/GCLgyZQCtod6GMJDhRDgnl
	 ZUIjoFmEoGyQ4MLElL4T8B+F3eAjil7P5bg9XLm3VbuJrTzJ7m0AYqHq3G/UEjwaEE
	 BzhMfyfXKg2kA==
Date: Wed, 22 Nov 2023 15:07:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    osstest service owner <osstest-admin@xenproject.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, oleksandr_tyshchenko@epam.com
Subject: Re: [linux-linus test] 183794: regressions - FAIL
In-Reply-To: <ff31f5a6-396e-48cc-8b1b-6941369c620b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2311221501340.2053963@ubuntu-linux-20-04-desktop>
References: <osstest-183794-mainreport@xen.org> <f7b11bb5-9d08-4678-bb97-3a2d96537439@suse.com> <alpine.DEB.2.22.394.2311201631140.773207@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2311211823110.2053963@ubuntu-linux-20-04-desktop>
 <ff31f5a6-396e-48cc-8b1b-6941369c620b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1782199463-1700694299=:2053963"
Content-ID: <alpine.DEB.2.22.394.2311221507290.2424505@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1782199463-1700694299=:2053963
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2311221507291.2424505@ubuntu-linux-20-04-desktop>

On Wed, 22 Nov 2023, Juergen Gross wrote:
> On 22.11.23 04:07, Stefano Stabellini wrote:
> > On Mon, 20 Nov 2023, Stefano Stabellini wrote:
> > > On Mon, 20 Nov 2023, Juergen Gross wrote:
> > > > On 20.11.23 03:21, osstest service owner wrote:
> > > > > flight 183794 linux-linus real [real]
> > > > > http://logs.test-lab.xenproject.org/osstest/logs/183794/
> > > > > 
> > > > > Regressions :-(
> > > > > 
> > > > > Tests which did not succeed and are blocking,
> > > > > including tests which could not be run:
> > > > >    test-arm64-arm64-examine      8 reboot                   fail REGR.
> > > > > vs.
> > > > > 183766
> > > > 
> > > > I'm seeing the following in the serial log:
> > > > 
> > > > Nov 20 00:25:41.586712 [    0.567318] kernel BUG at
> > > > arch/arm64/xen/../../arm/xen/enlighten.c:164!
> > > > Nov 20 00:25:41.598711 [    0.574002] Internal error: Oops - BUG:
> > > > 00000000f2000800 [#1] PREEMPT SMP
> > > > 
> > > > The related source code lines in the kernel are:
> > > > 
> > > > ········err = HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_info,
> > > > xen_vcpu_nr(cpu),
> > > > ································ &info);
> > > > ········BUG_ON(err);
> > > > 
> > > > I suspect commit 20f3b8eafe0ba to be the culprit.
> > > > 
> > > > Stefano, could you please have a look?
> > 
> > The good news and bad news is that I cannot repro this neither with nor
> > without CONFIG_UNMAP_KERNEL_AT_EL0. I looked at commit 20f3b8eafe0ba but
> > I cannot see anything wrong with it. Looking at the register dump, from:
> > 
> > x0 : fffffffffffffffa
> > 
> > I am guessing the error was -ENXIO which is returned from map_guest_area
> > in Xen.
> > 
> > Could it be that the struct is crossing a page boundary? Or that it is
> > not 64-bit aligned? Do we need to do something like the following?
> > 
> > diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> > index 9afdc4c4a5dc..5326070c5dc0 100644
> > --- a/arch/arm/xen/enlighten.c
> > +++ b/arch/arm/xen/enlighten.c
> > @@ -484,7 +485,7 @@ static int __init xen_guest_init(void)
> >   	 * for secondary CPUs as they are brought up.
> >   	 * For uniformity we use VCPUOP_register_vcpu_info even on cpu0.
> >   	 */
> > -	xen_vcpu_info = alloc_percpu(struct vcpu_info);
> > +	xen_vcpu_info = __alloc_percpu(struct vcpu_info, PAGE_SIZE);
> >   	if (xen_vcpu_info == NULL)
> >   		return -ENOMEM;
> >   
> 
> May I suggest to use a smaller alignment? What about:
> 
> 1 << fls(sizeof(struct vcpu_info) - 1)

See below

---
[PATCH] arm/xen: fix xen_vcpu_info allocation alignment

xen_vcpu_info is a percpu area than needs to be mapped by Xen.
Currently, it could cross a page boundary resulting in Xen being unable
to map it:

[    0.567318] kernel BUG at arch/arm64/xen/../../arm/xen/enlighten.c:164!
[    0.574002] Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP

Fix the issue by using __alloc_percpu and requesting alignment for the
memory allocation.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 9afdc4c4a5dc..09eb74a07dfc 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -484,7 +484,8 @@ static int __init xen_guest_init(void)
 	 * for secondary CPUs as they are brought up.
 	 * For uniformity we use VCPUOP_register_vcpu_info even on cpu0.
 	 */
-	xen_vcpu_info = alloc_percpu(struct vcpu_info);
+	xen_vcpu_info = __alloc_percpu(sizeof(struct vcpu_info),
+			                       1 << fls(sizeof(struct vcpu_info) - 1));
 	if (xen_vcpu_info == NULL)
 		return -ENOMEM;
 
--8323329-1782199463-1700694299=:2053963--

