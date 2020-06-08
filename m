Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EEE1F1D04
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:14:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKPF-0007zQ-Cv; Mon, 08 Jun 2020 16:13:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yn46=7V=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jiKPE-0007zL-Pq
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:13:48 +0000
X-Inumbo-ID: 08c0ebc6-a9a3-11ea-9ad7-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08c0ebc6-a9a3-11ea-9ad7-bc764e2007e4;
 Mon, 08 Jun 2020 16:13:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E19A206D5;
 Mon,  8 Jun 2020 16:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591632827;
 bh=LOpsTFq0ZkH2cN8y/1ahan3fKry7WioraIBzGJYpYKc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ijKc48iDnvfE6umhezyzgLNp2NmeFP2lfaMZux/yz2F4m8OhpMwcFrUa8I7Yj7jUb
 Qevc38IayBOhthG+N6Sfq18A7Wuha4JxG2d4D2F9YrJ8R3upwMcCQTQuhIhXoy8q+2
 19DFUjHR74KUxwCoS4pWw6FIRyUXAg4Zws9MKJv0=
Date: Mon, 8 Jun 2020 09:13:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: CodeWiz2280 <codewiz2280@gmail.com>
Subject: Re: Keystone Issue
In-Reply-To: <CALYbLDizxgaXJzhNVeKVZ6q-Hbttm1T+ZPP7f-1PDvi49VFOjA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2006080911500.2815@sstabellini-ThinkPad-T480s>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <3ff17aa9-0aae-d598-40ce-4e90d4e50cc7@xen.org>
 <00E14EAD-BD23-4A3A-872E-0C47C26B7B41@arm.com>
 <c2466674-a56e-08a4-7f3f-2438d5565953@xen.org>
 <CALYbLDjNptWfVMGjw801y6f0zu40b2pzBnLS+w2Zx5eVStCUYQ@mail.gmail.com>
 <da23ecc8-60f0-8a26-58d5-ea692dcf0102@xen.org>
 <CALYbLDhpwbHTrjDaNmfW81m5Fqt6HbfqoqbGDH1qUxxJtMBmEA@mail.gmail.com>
 <8C6A23AE-6C2B-411F-ACAD-F5574211E8ED@arm.com>
 <CALYbLDiOX0JW_=6AgAb+m5q++3WvQtivJRy+ePrp5pJXd7T9Vg@mail.gmail.com>
 <14244e49-e1ac-a29d-bbd9-bd4c202bf186@xen.org>
 <CALYbLDjCdDvwja1VoahJmnrKDfKyw7DNhYBBcmJv70QDA4+6Ag@mail.gmail.com>
 <77006AAF-BC3B-4C6E-BDFC-577CF87DE64E@arm.com>
 <CALYbLDheT8jWSAqJJZvvjzWGvygJaJ6UG7ejgpLLYeQB-tCsJA@mail.gmail.com>
 <CALYbLDjZu-YzqZPjCk785=4hpd3BRsoXeotd3ygESD_Ezm63Yg@mail.gmail.com>
 <99E77330-049F-4471-ABF9-13F9AB4E95B5@arm.com>
 <CALYbLDizxgaXJzhNVeKVZ6q-Hbttm1T+ZPP7f-1PDvi49VFOjA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On Mon, 8 Jun 2020, CodeWiz2280 wrote:
> It actually shows only 1 interrupt for any of the devices in that list
> (e.g. spi, ttyS0, ethernet) so you're probably right on the money with
> it being an interrupt acknowledge issue.  Any help you can provide is
> greatly appreciated.
> 
> On Mon, Jun 8, 2020 at 4:40 AM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
> >
> >
> >
> > > On 5 Jun 2020, at 20:12, CodeWiz2280 <codewiz2280@gmail.com> wrote:
> > >
> > > On Fri, Jun 5, 2020 at 11:05 AM CodeWiz2280 <codewiz2280@gmail.com> wrote:
> > >>
> > >> On Fri, Jun 5, 2020 at 8:47 AM Bertrand Marquis
> > >> <Bertrand.Marquis@arm.com> wrote:
> > >>>
> > >>>
> > >>>
> > >>>> On 5 Jun 2020, at 13:42, CodeWiz2280 <codewiz2280@gmail.com> wrote:
> > >>>>
> > >>>> On Fri, Jun 5, 2020 at 8:30 AM Julien Grall <julien@xen.org> wrote:
> > >>>>>
> > >>>>> Hi,
> > >>>>>
> > >>>>> On 05/06/2020 13:25, CodeWiz2280 wrote:
> > >>>>>> The Keystone uses the netcp driver, which has interrupts from 40-79
> > >>>>>> listed in the device tree (arch/arm/boot/keystone-k2e-netcp.dtsi).
> > >>>>>> I'm using the same device tree between my non-xen standalone kernel
> > >>>>>> and my dom0 kernel booted by xen.  In the standalone (non-xen) kernel
> > >>>>>> the ethernet works fine, but I don't see any of its interrupts in the
> > >>>>>> output of /proc/iomem.  I'm not seeing them in /proc/iomem when
> > >>>>>> running dom0 under Xen either.  When booting with Xen I get this
> > >>>>>> behavior where the ifconfig output shows 1 RX message and 1 TX
> > >>>>>> message, and then nothing else.
> > >>>>>
> > >>>>> I am not sure whether this is a typo in the e-mail. /proc/iomem is
> > >>>>> listing the list of the MMIO regions. You want to use /proc/interrupts.
> > >>>>>
> > >>>>> Can you confirm which path you are dumping?
> > >>>> Yes, that was a typo.  Sorry about that.  I meant that I am dumping
> > >>>> /proc/interrupts and do not
> > >>>> see them under the non-xen kernel or xen booted dom0.
> > >>>
> > >>> Could you post both /proc/interrupts content ?
> > >>
> > >> Standalone non-xen kernel (Ethernet works)
> > >> # cat /proc/interrupts
> > >>           CPU0       CPU1       CPU2       CPU3
> > >> 17:          0          0          0          0     GICv2  29 Level
> > >>  arch_timer
> > >> 18:       9856       1202        457        650     GICv2  30 Level
> > >>  arch_timer
> > >> 21:          0          0          0          0     GICv2 142 Edge
> > >>  timer-keystone
> > >> 22:          0          0          0          0     GICv2  52 Edge      arm-pmu
> > >> 23:          0          0          0          0     GICv2  53 Edge      arm-pmu
> > >> 24:          0          0          0          0     GICv2  54 Edge      arm-pmu
> > >> 25:          0          0          0          0     GICv2  55 Edge      arm-pmu
> > >> 26:          0          0          0          0     GICv2  36 Edge
> > >>  26202a0.keystone_irq
> > >> 27:       1435          0          0          0     GICv2 309 Edge      ttyS0
> > >> 29:          0          0          0          0     GICv2 315 Edge
> > >>  2530000.i2c
> > >> 30:          1          0          0          0     GICv2 318 Edge
> > >>  2530400.i2c
> > >> 31:          0          0          0          0     GICv2 321 Edge
> > >>  2530800.i2c
> > >> 32:         69          0          0          0     GICv2 324 Edge
> > >>  21000400.spi
> > >> 33:          0          0          0          0     GICv2 328 Edge
> > >>  21000600.spi
> > >> 34:          0          0          0          0     GICv2 332 Edge
> > >>  21000800.spi
> > >> 70:          0          0          0          0     GICv2 417 Edge
> > >>  ks-pcie-error-irq
> > >> 79:          0          0          0          0   PCI-MSI   0 Edge
> > >>  PCIe PME, aerdrv
> > >> 88:         57          0          0          0     GICv2  80 Level
> > >>  hwqueue-528
> > >> 89:         57          0          0          0     GICv2  81 Level
> > >>  hwqueue-529
> > >> 90:         47          0          0          0     GICv2  82 Level
> > >>  hwqueue-530
> > >> 91:         41          0          0          0     GICv2  83 Level
> > >>  hwqueue-531
> > >> IPI0:          0          0          0          0  CPU wakeup interrupts
> > >> IPI1:          0          0          0          0  Timer broadcast interrupts
> > >> IPI2:        730        988       1058        937  Rescheduling interrupts
> > >> IPI3:          2          3          4          6  Function call interrupts
> > >> IPI4:          0          0          0          0  CPU stop interrupts
> > >> IPI5:          0          0          0          0  IRQ work interrupts
> > >> IPI6:          0          0          0          0  completion interrupts
> > >>
> > >> Xen dom0 (Ethernet stops)
> > >> # cat /proc/interrupts
> > >>           CPU0
> > >> 18:      10380     GIC-0  27 Level     arch_timer
> > >> 19:          0     GIC-0 142 Edge      timer-keystone
> > >> 20:         88     GIC-0  16 Level     events
> > >> 21:          0   xen-dyn     Edge    -event     xenbus
> > >> 22:          0     GIC-0  36 Edge      26202a0.keystone_irq
> > >> 23:          1     GIC-0 312 Edge      ttyS0
> > >> 25:          1     GIC-0 318 Edge
> > >> 27:          1     GIC-0 324 Edge      21000400.spi
> > >> 28:          0     GIC-0 328 Edge      21000600.spi
> > >> 29:          0     GIC-0 332 Edge      21000800.spi
> > >> 65:          0     GIC-0 417 Edge      ks-pcie-error-irq
> > >> 74:          0   PCI-MSI   0 Edge      PCIe PME, aerdrv
> > >> 83:          1     GIC-0  80 Level     hwqueue-528
> > >> 84:          1     GIC-0  81 Level     hwqueue-529
> > >> 85:          1     GIC-0  82 Level     hwqueue-530
> > >> 86:          1     GIC-0  83 Level     hwqueue-531
> > >> 115:         87   xen-dyn     Edge    -virq      hvc_console
> > >> IPI0:          0  CPU wakeup interrupts
> > >> IPI1:          0  Timer broadcast interrupts
> > >> IPI2:          0  Rescheduling interrupts
> > >> IPI3:          0  Function call interrupts
> > >> IPI4:          0  CPU stop interrupts
> > >> IPI5:          0  IRQ work interrupts
> > >> IPI6:          0  completion interrupts
> > >> Err:          0
> > > After getting a chance to look at this a little more, I believe the
> > > TX/RX interrupts for the ethernets map like this:
> > >
> > > eth0 Rx  - hwqueue-528
> > > eth1 Rx - hwqueue-529
> > > eth0 Tx  - hwqueue-530
> > > eth1 Tx - hwqueue-531
> > >>
> > > The interrupt counts in the standlone working kernel seem to roughly
> > > correspond to the counts of Tx/Rx messages in ifconfig.  Going on
> > > that, its clear that only 1 interrupt has been received for Tx and 1
> > > for Rx in the Xen Dom0 equivalent.  Any thoughts on this?
> >
> > This definitely look like an interrupt acknowledgement issue.
> > This could be caused by 2 things I remember of:
> > - front vs level interrupts
> > - a problem with forwarded interrupt acknowledgement.
> > I think there was something related to that where the vcpu ack was not properly
> > handled on a keystone and I had to change the way the interrupt was acked for
> > forwarded hardware interrupts.

Is there maybe some sort of secondary interrupt controller (secondary in
addition to the GIC) or interrupt "concentrator" on KeyStone?

Or is it just a small deviation from normal GIC behavior?

