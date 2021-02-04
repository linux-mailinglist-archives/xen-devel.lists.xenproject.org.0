Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A0D30FF11
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 22:09:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81433.150535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7lrh-0002Fe-Qn; Thu, 04 Feb 2021 21:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81433.150535; Thu, 04 Feb 2021 21:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7lrh-0002FH-Nl; Thu, 04 Feb 2021 21:08:37 +0000
Received: by outflank-mailman (input) for mailman id 81433;
 Thu, 04 Feb 2021 21:08:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+ZK=HG=kernel.org=robh@srs-us1.protection.inumbo.net>)
 id 1l7lrg-0002FC-8o
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 21:08:36 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58a2dd8f-8f74-4880-8c43-e9d609e1956e;
 Thu, 04 Feb 2021 21:08:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FE0064FA7
 for <xen-devel@lists.xenproject.org>; Thu,  4 Feb 2021 21:08:34 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id s11so6061987edd.5
 for <xen-devel@lists.xenproject.org>; Thu, 04 Feb 2021 13:08:33 -0800 (PST)
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
X-Inumbo-ID: 58a2dd8f-8f74-4880-8c43-e9d609e1956e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612472914;
	bh=Rvdz6s2CQJMjmqrnEEDi4CeczclMMbom+GqfWo2JyxM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GIY2TLwhYOcb6foSyJDPVi87CfWi5pOA79eX1tG1Ak3kQAHdPG8ZFaZCEr+YSCm7n
	 zyUQQYUDxNveBrKBFyFsQ+aJPeAft2jPPAKgrIHqL4sfFdDrRAsv83DulZQPtsO4el
	 oUIR/g/TLQ40Jk2mGQufI8/Jk6h/jUUqeILlVw9GyxUnZHxJeB5QK0b9zRl/5jssln
	 muxRTcMKKUqJyvNZqRGFpHCSqEcHzYlEnTCo4qMWa0c6WJwE7AUBzLRbZlqH5Vz9On
	 6zwyfvV/8QYGKoCgEGKeFTGPqzelT3Tu/251tJR3Nrbs8rrkuCTiv5vGGLjTzs0q4G
	 8U0PyPhdrVZSA==
X-Gm-Message-State: AOAM532DumNdJalwmWlbPhZ0wvcDc+/L7wC4VV+IKOGtum2sorkNVZtH
	FwD/bdRLlAa8/H+AABxVPNm9QSYE39KSXqFT2Q==
X-Google-Smtp-Source: ABdhPJxVh1MljQT9BbkRlXGDfOHsEqEJCt96fK8W4gA8VjnjqA99XuPL10SBvWu8mUkCcBCsfqrH56DYYOgi72WZbEw=
X-Received: by 2002:aa7:c895:: with SMTP id p21mr465192eds.165.1612472912572;
 Thu, 04 Feb 2021 13:08:32 -0800 (PST)
MIME-Version: 1.0
References: <YBmQQ3Tzu++AadKx@mattapan.m5p.com> <a422c04c-f908-6fb6-f2de-fea7b18a6e7d@xen.org>
 <b6d342f8-c833-db88-9808-cdc946999300@xen.org> <alpine.DEB.2.21.2102021412480.29047@sstabellini-ThinkPad-T480s>
 <06d6b9ec-0db9-d6da-e30b-df9f9381157d@xen.org> <alpine.DEB.2.21.2102031315350.29047@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1LsqOMFXV5GLYEkF7=akMx7fT_vpgVtT6xP6MPfmP9vQ@mail.gmail.com>
 <alpine.DEB.2.21.2102031519540.29047@sstabellini-ThinkPad-T480s>
 <9b97789b-5560-0186-642a-0501789830e5@xen.org> <alpine.DEB.2.21.2102040944520.29047@sstabellini-ThinkPad-T480s>
 <CAL_JsqJuvZPheRkacaopHtbATj8uRua=wj_XU5ib41sSpVO-ug@mail.gmail.com> <alpine.DEB.2.21.2102041228560.29047@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2102041228560.29047@sstabellini-ThinkPad-T480s>
From: Rob Herring <robh@kernel.org>
Date: Thu, 4 Feb 2021 15:08:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKTz8J3txk9W5ekqmfON_g_TdLYsLi0YXYU3rmiyubL2A@mail.gmail.com>
Message-ID: <CAL_JsqKTz8J3txk9W5ekqmfON_g_TdLYsLi0YXYU3rmiyubL2A@mail.gmail.com>
Subject: Re: Question on PCIe Device Tree bindings, Was: [PATCH] xen/arm:
 domain_build: Ignore device nodes with invalid addresses
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien.grall.oss@gmail.com>, Elliott Mitchell <ehem+xen@m5p.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, julien@xen.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 4, 2021 at 2:36 PM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Thu, 4 Feb 2021, Rob Herring wrote:
> > On Thu, Feb 4, 2021 at 11:56 AM Stefano Stabellini
> > <sstabellini@kernel.org> wrote:
> > >
> > > Hi Rob,
> > >
> > > We have a question on the PCIe device tree bindings. In summary, we have
> > > come across the Raspberry Pi 4 PCIe description below:
> > >
> > >
> > > pcie0: pcie@7d500000 {
> > >    compatible = "brcm,bcm2711-pcie";
> > >    reg = <0x0 0x7d500000  0x0 0x9310>;
> > >    device_type = "pci";
> > >    #address-cells = <3>;
> > >    #interrupt-cells = <1>;
> > >    #size-cells = <2>;
> > >    interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> > >                 <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> > >    interrupt-names = "pcie", "msi";
> > >    interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> > >    interrupt-map = <0 0 0 1 &gicv2 GIC_SPI 143
> > >                                                      IRQ_TYPE_LEVEL_HIGH>;
> > >    msi-controller;
> > >    msi-parent = <&pcie0>;
> > >
> > >    ranges = <0x02000000 0x0 0xc0000000 0x6 0x00000000
> > >              0x0 0x40000000>;
> > >    /*
> > >     * The wrapper around the PCIe block has a bug
> > >     * preventing it from accessing beyond the first 3GB of
> > >     * memory.
> > >     */
> > >    dma-ranges = <0x02000000 0x0 0x00000000 0x0 0x00000000
> > >                  0x0 0xc0000000>;
> > >    brcm,enable-ssc;
> > >
> > >    pci@1,0 {
> > >            #address-cells = <3>;
> > >            #size-cells = <2>;
> > >            ranges;
> > >
> > >            reg = <0 0 0 0 0>;
> > >
> > >            usb@1,0 {
> > >                    reg = <0x10000 0 0 0 0>;
> > >                    resets = <&reset RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
> > >            };
> > >    };
> > > };
> > >
> > >
> > > Xen fails to parse it with an error because it tries to remap reg =
> > > <0x10000 0 0 0 0> as if it was a CPU address and of course it fails.
> > >
> > > Reading the device tree description in details, I cannot tell if Xen has
> > > a bug: the ranges property under pci@1,0 means that pci@1,0 is treated
> > > like a default bus (not a PCI bus), hence, the children regs are
> > > translated using the ranges property of the parent (pcie@7d500000).
> > >
> > > Is it possible that the device tree is missing device_type =
> > > "pci" under pci@1,0? Or is it just implied because pci@1,0 is a child of
> > > pcie@7d500000?
> >
> > Indeed, it should have device_type. Linux (only recently due to
> > another missing device_type case) will also look at node name, but
> > only 'pcie'.
> >
> > We should be able to create (or extend pci-bus.yaml) a schema to catch
> > this case.
>
> Ah, that is what I needed to know, thank you!  Is Linux considering a
> node named "pcie" as if it has device_type = "pci"?

Yes, it was added for Rockchip RK3399 to avoid a DT update and regression.

> In Xen, also to cover the RPi4 case, maybe I could add a check for the
> node name to be "pci" or "pcie" and if so Xen could assume device_type =
> "pci".

I assume this never worked for RPi4 (and Linux will have the same
issue), so can't we just update the DT in this case?

Rob

