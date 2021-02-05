Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6701131039C
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 04:33:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81497.150712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7rrG-0004TV-Bj; Fri, 05 Feb 2021 03:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81497.150712; Fri, 05 Feb 2021 03:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7rrG-0004T6-8J; Fri, 05 Feb 2021 03:32:34 +0000
Received: by outflank-mailman (input) for mailman id 81497;
 Fri, 05 Feb 2021 03:32:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HLiv=HH=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1l7rrF-0004Sl-6U
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 03:32:33 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61187142-8eaa-4a28-8043-e8503f06f38b;
 Fri, 05 Feb 2021 03:32:30 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 1153WDlV037679
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 4 Feb 2021 22:32:19 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 1153WD1H037678;
 Thu, 4 Feb 2021 19:32:13 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 61187142-8eaa-4a28-8043-e8503f06f38b
Date: Thu, 4 Feb 2021 19:32:13 -0800
From: Elliott Mitchell <ehem+undef@m5p.com>
To: Rob Herring <robh@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien.grall.oss@gmail.com>,
        Elliott Mitchell <ehem+xen@m5p.com>,
        xen-devel <xen-devel@lists.xenproject.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, julien@xen.org
Subject: Re: Question on PCIe Device Tree bindings, Was: [PATCH] xen/arm:
 domain_build: Ignore device nodes with invalid addresses
Message-ID: <YBy8PbYeLEHjcELY@mattapan.m5p.com>
References: <alpine.DEB.2.21.2102031315350.29047@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1LsqOMFXV5GLYEkF7=akMx7fT_vpgVtT6xP6MPfmP9vQ@mail.gmail.com>
 <alpine.DEB.2.21.2102031519540.29047@sstabellini-ThinkPad-T480s>
 <9b97789b-5560-0186-642a-0501789830e5@xen.org>
 <alpine.DEB.2.21.2102040944520.29047@sstabellini-ThinkPad-T480s>
 <CAL_JsqJuvZPheRkacaopHtbATj8uRua=wj_XU5ib41sSpVO-ug@mail.gmail.com>
 <alpine.DEB.2.21.2102041228560.29047@sstabellini-ThinkPad-T480s>
 <CAL_JsqKTz8J3txk9W5ekqmfON_g_TdLYsLi0YXYU3rmiyubL2A@mail.gmail.com>
 <alpine.DEB.2.21.2102041309430.29047@sstabellini-ThinkPad-T480s>
 <CAL_Jsq+cedzG5NBfLRub=msZEK6umBrk-O7FYB=Dk34=k9fuCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+cedzG5NBfLRub=msZEK6umBrk-O7FYB=Dk34=k9fuCA@mail.gmail.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Thu, Feb 04, 2021 at 03:52:26PM -0600, Rob Herring wrote:
> On Thu, Feb 4, 2021 at 3:33 PM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
> >
> > On Thu, 4 Feb 2021, Rob Herring wrote:
> > > On Thu, Feb 4, 2021 at 2:36 PM Stefano Stabellini
> > > <sstabellini@kernel.org> wrote:
> > > >
> > > > On Thu, 4 Feb 2021, Rob Herring wrote:
> > > > > On Thu, Feb 4, 2021 at 11:56 AM Stefano Stabellini
> > > > > <sstabellini@kernel.org> wrote:
> > > > > >
> > > > > > Hi Rob,
> > > > > >
> > > > > > We have a question on the PCIe device tree bindings. In summary, we have
> > > > > > come across the Raspberry Pi 4 PCIe description below:
> > > > > >
> > > > > >
> > > > > > pcie0: pcie@7d500000 {
> > > > > >    compatible = "brcm,bcm2711-pcie";
> > > > > >    reg = <0x0 0x7d500000  0x0 0x9310>;
> > > > > >    device_type = "pci";
> > > > > >    #address-cells = <3>;
> > > > > >    #interrupt-cells = <1>;
> > > > > >    #size-cells = <2>;
> > > > > >    interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> > > > > >                 <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> > > > > >    interrupt-names = "pcie", "msi";
> > > > > >    interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> > > > > >    interrupt-map = <0 0 0 1 &gicv2 GIC_SPI 143
> > > > > >                                                      IRQ_TYPE_LEVEL_HIGH>;
> > > > > >    msi-controller;
> > > > > >    msi-parent = <&pcie0>;
> > > > > >
> > > > > >    ranges = <0x02000000 0x0 0xc0000000 0x6 0x00000000
> > > > > >              0x0 0x40000000>;
> > > > > >    /*
> > > > > >     * The wrapper around the PCIe block has a bug
> > > > > >     * preventing it from accessing beyond the first 3GB of
> > > > > >     * memory.
> > > > > >     */
> > > > > >    dma-ranges = <0x02000000 0x0 0x00000000 0x0 0x00000000
> > > > > >                  0x0 0xc0000000>;
> > > > > >    brcm,enable-ssc;
> > > > > >
> > > > > >    pci@1,0 {
> > > > > >            #address-cells = <3>;
> > > > > >            #size-cells = <2>;
> > > > > >            ranges;
> > > > > >
> > > > > >            reg = <0 0 0 0 0>;
> > > > > >
> > > > > >            usb@1,0 {
> > > > > >                    reg = <0x10000 0 0 0 0>;
> > > > > >                    resets = <&reset RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
> > > > > >            };
> > > > > >    };
> > > > > > };
> > > > > >
> > > > > >
> > > > > > Xen fails to parse it with an error because it tries to remap reg =
> > > > > > <0x10000 0 0 0 0> as if it was a CPU address and of course it fails.
> > > > > >
> > > > > > Reading the device tree description in details, I cannot tell if Xen has
> > > > > > a bug: the ranges property under pci@1,0 means that pci@1,0 is treated
> > > > > > like a default bus (not a PCI bus), hence, the children regs are
> > > > > > translated using the ranges property of the parent (pcie@7d500000).
> > > > > >
> > > > > > Is it possible that the device tree is missing device_type =
> > > > > > "pci" under pci@1,0? Or is it just implied because pci@1,0 is a child of
> > > > > > pcie@7d500000?
> > > > >
> > > > > Indeed, it should have device_type. Linux (only recently due to
> > > > > another missing device_type case) will also look at node name, but
> > > > > only 'pcie'.
> > > > >
> > > > > We should be able to create (or extend pci-bus.yaml) a schema to catch
> > > > > this case.
> > > >
> > > > Ah, that is what I needed to know, thank you!  Is Linux considering a
> > > > node named "pcie" as if it has device_type = "pci"?
> > >
> > > Yes, it was added for Rockchip RK3399 to avoid a DT update and regression.
> > >
> > > > In Xen, also to cover the RPi4 case, maybe I could add a check for the
> > > > node name to be "pci" or "pcie" and if so Xen could assume device_type =
> > > > "pci".
> > >
> > > I assume this never worked for RPi4 (and Linux will have the same
> > > issue), so can't we just update the DT in this case?
> >
> > I am not sure where the DT is coming from, probably from the RPi4 kernel
> > trees or firmware. I think it would be good if somebody got in touch to
> > tell them they have an issue.
> 
> So you just take whatever downstream RPi invents? Good luck.
> 
> > Elliot, where was that device tree coming from originally?

Please excuse my very weak device-tree fu...

I'm unsure which section is the problem, but looking at `git blame` what
shows is commt d5c8dc0d4c880fbde5293cc186b1ab23466254c4.

This commit is present in the Linux master branch and the linux-5.10.y
branch.

You were saying?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



