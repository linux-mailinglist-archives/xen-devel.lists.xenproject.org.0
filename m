Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F08382AE3FC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 00:25:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24066.51124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcd0w-0005Cm-Vp; Tue, 10 Nov 2020 23:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24066.51124; Tue, 10 Nov 2020 23:25:26 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcd0w-0005CP-Sl; Tue, 10 Nov 2020 23:25:26 +0000
Received: by outflank-mailman (input) for mailman id 24066;
 Tue, 10 Nov 2020 23:25:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZSK1=EQ=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kcd0v-0005CI-Tj
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 23:25:25 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a377acb8-f98e-4998-8919-e2203896ffd4;
 Tue, 10 Nov 2020 23:25:24 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0AANPBFC043559
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 10 Nov 2020 18:25:17 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0AANPAQB043558;
 Tue, 10 Nov 2020 15:25:10 -0800 (PST) (envelope-from ehem)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ZSK1=EQ=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kcd0v-0005CI-Tj
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 23:25:25 +0000
X-Inumbo-ID: a377acb8-f98e-4998-8919-e2203896ffd4
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a377acb8-f98e-4998-8919-e2203896ffd4;
	Tue, 10 Nov 2020 23:25:24 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0AANPBFC043559
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 10 Nov 2020 18:25:17 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 0AANPAQB043558;
	Tue, 10 Nov 2020 15:25:10 -0800 (PST)
	(envelope-from ehem)
Date: Tue, 10 Nov 2020 15:25:10 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: J??rgen Gro?? <jgross@suse.com>, Julien Grall <julien@xen.org>,
        roman@zededa.com, xen-devel@lists.xenproject.org
Subject: Re: Xen on RP4
Message-ID: <20201110232510.GA43420@mattapan.m5p.com>
References: <20201023211941.GA90171@mattapan.m5p.com>
 <alpine.DEB.2.21.2010231647290.12247@sstabellini-ThinkPad-T480s>
 <20201024053540.GA97417@mattapan.m5p.com>
 <4fcf4832-9266-443f-54d0-fa1fff4b6e14@xen.org>
 <20201026160316.GA20589@mattapan.m5p.com>
 <7a904044-8206-b45d-8ec2-d4e48b07ea83@xen.org>
 <20201028015423.GA33407@mattapan.m5p.com>
 <alpine.DEB.2.21.2010281704250.12247@sstabellini-ThinkPad-T480s>
 <e885b2a9-f6ea-e224-b906-125936cfe550@suse.com>
 <alpine.DEB.2.21.2010291255070.12247@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2010291255070.12247@sstabellini-ThinkPad-T480s>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Thu, Oct 29, 2020 at 12:57:58PM -0700, Stefano Stabellini wrote:
> On Thu, 29 Oct 2020, J??rgen Gro?? wrote:
> > What about having a small domain parsing the ACPI booting first and use
> > that information for booting dom0?
> > 
> > That dom would be part of the Xen build and the hypervisor wouldn't need
> > to gain all the ACPI AML logic.
> 
> That could work, but in practice we don't have such a domain today --
> the infrastructure is missing. I wonder whether the bootloader (uboot or
> grub) would know about the platform and might be able to pass that
> information to Xen somehow.

How long would such likely take to implement?  This reads like a
complicated project, and likely to take a while...


Then would be the issue of efifb.



I've been pondering allocate_memory_11() and coming up with a rather
complicated potential problem.  ACPI appears to potentially allow for
non-power of 2 DMA ranges; I'm unaware of any such device, but the code
should allow for such.

I can imagine a device which has multiple DMA ranges.  The ranges could
be fully contained within each other, the ranges could partially overlap,
or the ranges could be disjoint.

Someone might wish to allocate all DMA-capable memory to domain 0,
someone might wish to allocate less.  Additionally if all DMA-capable
memory is allocated to domain 0, some non-DMA-capable memory could be
desired.

Ideally Xen would move to non-DMA memory.  This would protect Xen against
a malicious domain 0 and allow allocating more DMA-capable memory to
domain 0.

This interacts with ballooning.  If memory is removed from domain 0,
non-DMA memory should be removed first.  If domain 0 is allocated more
memory, DMA memory should be added first (if any isn't allocated to
domain 0).

Then again I may be severely overthinking things.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



