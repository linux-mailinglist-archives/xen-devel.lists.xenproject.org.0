Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CA52991C0
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 17:03:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12407.32311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX4y2-0003v9-Ag; Mon, 26 Oct 2020 16:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12407.32311; Mon, 26 Oct 2020 16:03:30 +0000
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
	id 1kX4y2-0003uk-7P; Mon, 26 Oct 2020 16:03:30 +0000
Received: by outflank-mailman (input) for mailman id 12407;
 Mon, 26 Oct 2020 16:03:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GsP=EB=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kX4y0-0003uf-LX
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:03:28 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c09a792-74c5-4dc5-86d0-3e7a2ffafaee;
 Mon, 26 Oct 2020 16:03:27 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09QG3GtK021006
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 26 Oct 2020 12:03:22 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09QG3GJD021005;
 Mon, 26 Oct 2020 09:03:16 -0700 (PDT) (envelope-from ehem)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/GsP=EB=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kX4y0-0003uf-LX
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:03:28 +0000
X-Inumbo-ID: 7c09a792-74c5-4dc5-86d0-3e7a2ffafaee
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7c09a792-74c5-4dc5-86d0-3e7a2ffafaee;
	Mon, 26 Oct 2020 16:03:27 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09QG3GtK021006
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 26 Oct 2020 12:03:22 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09QG3GJD021005;
	Mon, 26 Oct 2020 09:03:16 -0700 (PDT)
	(envelope-from ehem)
Date: Mon, 26 Oct 2020 09:03:16 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, roman@zededa.com,
        xen-devel@lists.xenproject.org
Subject: Re: Xen on RP4
Message-ID: <20201026160316.GA20589@mattapan.m5p.com>
References: <20201016003024.GA13290@mattapan.m5p.com>
 <23885c28-dee5-4e9a-dc43-6ccf19a94df6@xen.org>
 <20201022021655.GA74011@mattapan.m5p.com>
 <alpine.DEB.2.21.2010221620230.12247@sstabellini-ThinkPad-T480s>
 <20201023005629.GA83870@mattapan.m5p.com>
 <alpine.DEB.2.21.2010221801490.12247@sstabellini-ThinkPad-T480s>
 <20201023211941.GA90171@mattapan.m5p.com>
 <alpine.DEB.2.21.2010231647290.12247@sstabellini-ThinkPad-T480s>
 <20201024053540.GA97417@mattapan.m5p.com>
 <4fcf4832-9266-443f-54d0-fa1fff4b6e14@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fcf4832-9266-443f-54d0-fa1fff4b6e14@xen.org>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Mon, Oct 26, 2020 at 01:31:42PM +0000, Julien Grall wrote:
> On 24/10/2020 06:35, Elliott Mitchell wrote:
> > ACPI has a distinct
> > means of specifying a limited DMA-width; the above fails, because it
> > assumes a *device-tree*.
> 
> Do you know if it would be possible to infer from the ACPI static table 
> the DMA-width?

Yes, and it is.  Due to not knowing much about ACPI tables I don't know
what the C code would look like though (problem is which documentation
should I be looking at first?).

Handy bit of information is in the RP4 Tianocore table source:
https://github.com/tianocore/edk2-platforms/blob/d492639638eee331ac3389e6cf53ea266c3c84b3/Platform/RaspberryPi/AcpiTables/Dsdt.asl

      Name (_DMA, ResourceTemplate() {
        //
        // Only the first GB is available.
        // Bus 0xC0000000 -> CPU 0x00000000.
        //
        QWordMemory (ResourceConsumer,
          ,
          MinFixed,
          MaxFixed,
          NonCacheable,
          ReadWrite,
          0x0,
          0x00000000C0000000, // MIN
          0x00000000FFFFFFFF, // MAX
          0xFFFFFFFF40000000, // TRA
          0x0000000040000000, // LEN
          ,
          ,
          )
      })

There should be some corresponding code in the Linux 5.9 kernels.  From
the look of that, it might even be possible to specify a memory range
which didn't start at address 0.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



