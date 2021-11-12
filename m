Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE8944EBA0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 17:53:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225340.389139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlZmq-0000ef-BA; Fri, 12 Nov 2021 16:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225340.389139; Fri, 12 Nov 2021 16:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlZmq-0000cP-7w; Fri, 12 Nov 2021 16:52:24 +0000
Received: by outflank-mailman (input) for mailman id 225340;
 Fri, 12 Nov 2021 16:52:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cipi=P7=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1mlZmp-0000cJ-7M
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 16:52:23 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4fc73c2-43d8-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 17:52:21 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 1ACGq2fY082934
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 12 Nov 2021 11:52:08 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 1ACGq29O082932;
 Fri, 12 Nov 2021 08:52:02 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: e4fc73c2-43d8-11ec-9787-a32c541c8605
Date: Fri, 12 Nov 2021 08:52:02 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Henry Wang <Henry.Wang@arm.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: ACPI/UEFI support for Xen/ARM status?
Message-ID: <YY6bsu8/y/LeMfg3@mattapan.m5p.com>
References: <YY3tSAFTCR4r2FaI@mattapan.m5p.com>
 <AM9PR08MB62428F41C4F998AD676C027C92959@AM9PR08MB6242.eurprd08.prod.outlook.com>
 <YY6L5JQPn0s3c6Jp@mattapan.m5p.com>
 <1d3561ef-548a-ea13-d362-0f95d7dba33b@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d3561ef-548a-ea13-d362-0f95d7dba33b@xen.org>
X-Spam-Status: No, score=0.0 required=10.0 tests=none autolearn=unavailable
	autolearn_force=no version=3.4.5
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on mattapan.m5p.com

On Fri, Nov 12, 2021 at 04:02:36PM +0000, Julien Grall wrote:
> Hi Elliott,
> 
> On 12/11/2021 15:44, Elliott Mitchell wrote:
> > On Fri, Nov 12, 2021 at 05:54:08AM +0000, Henry Wang wrote:
> >>
> >>> -----Original Message-----
> >>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> >>> Elliott Mitchell
> >>>
> >>> I've been busy with another part of this project, so I've lost track of
> >>> progress on ACPI/UEFI support on ARM.
> >>>
> >>> Last I'd read full support for ACPI/UEFI seemed a ways off.  Using a stub
> >>> domain to constrain ACPI table parsing seemed the favored approach.  I
> >>> was under the impression that would take some time.
> >>>
> >>> What is the status?  Do the Xen/ARM leads have any guesses for when full
> >>> ACPI/UEFI support might reach completion?
> >>
> >> I am doing some development based on the Xen UEFI/ACPI on AArch64 using
> >> the Arm FVP_Base platform. Using edk2 and master branch of Xen with
> >> `CONFIG_ACPI=y`, it seems everything can work properly.
> >>
> >> Here are some of my logs:
> >> Shell> FS2:EFI\XEN\xen.efi
> >> Xen 4.16-rc (c/s Fri Nov 12 02:34:01 2021 +0000 git:323b47ffd9-dirty) EFI loader
> >> ...
> >> (XEN) PFN compression on bits 20...22
> >> (XEN) ACPI: RSDP F5E30018, 0024 (r2 LINARO)
> >> (XEN) ACPI: XSDT F5E3FE98, 005C (r1 LINARO RTSMVEV8        2       1000013)
> >> (XEN) ACPI: FACP F5E3FA98, 0114 (r6 LINARO RTSMVEV8        2 LNRO        2)
> >> (XEN) ACPI: DSDT F5E3ED98, 02AB (r2 LINARO RTSMVEV8        4 INTL 20200925)
> >> (XEN) ACPI: GTDT F5E3FC18, 00E0 (r2 LINARO RTSMVEV8        2 LNRO        2)
> >> (XEN) ACPI: APIC F5E3E998, 02D4 (r4 LINARO RTSMVEV8        2 LNRO        2)
> >> (XEN) ACPI: SPCR F5E3FF98, 0050 (r2 LINARO RTSMVEV8        2 LNRO        2)
> >> (XEN) Domain heap initialised
> > 
> >> ...
> >> [    0.000000] ACPI: SPCR 0x00000000F5E3FF98 000050 (v02 LINARO RTSMVEV8 00000002 LNRO 00000002)
> >> [    0.000000] ACPI: SPCR: console: pl011,mmio32,0x1c090000,115200
> >> ...
> >>
> >> Hopefully this answers your question. :)
> > 
> > Thanks for the attempt at answering, but the SPCR entry tells me there is
> > a substantial portion of ACPI/UEFI functionality you're not testing.  I'm
> > specifically looking for framebuffer console support and SPCR says you're
> > using serial console.  While serial console is appropriate for true
> > servers, for some use cases it is inadequate.
> 
> We don't have any support for framebuffer in Xen on Arm (even for 
> Device-Tree). I would be happy to consider any patches if you are plan 
> to post some.

Xen on ARM doesn't need a framebuffer itself, but it can be valuable to
have Domain 0 able to access a framebuffer.


> > Julien Grall and Stefano Stabellini had been proposing doing ACPI table
> > parsing in a stub domain, but I'm unaware of the status.  Not finding
> > much suggests it hasn't gone very far yet.
> 
> This was a very early proposal in case we needed to parse the DSDT in 
> Xen. This hasn't been needed so far, hence why this is not implemented 
> and no-one worked on it.
> 
> I am not very familiar how the framebuffer is detected in ACPI. Can you 
> provide more details on what exactly you want to parse?
> 
> Alternatively, UEFI is meant to provide an API to access the 
> framebuffer. Would that be suitable for you?

Last time I tried booting on UEFI, Domain 0 (Linux) was unable to access
the framebuffer on this device.  Whereas the same kernel directly on top
of UEFI/ACPI was fully able to access the framebuffer (and graphics
chip).

I had been left with the impression the DSDT parsing was going to be
needed for Domain 0 to access the framebuffer.  This was found
unnecessary for framebuffer access for Domain 0?

(Raspberry PI 4B with the Tianocore/EDK2 image)


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



