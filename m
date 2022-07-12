Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CC45720B7
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 18:24:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365846.596190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBIgS-0002EJ-Sr; Tue, 12 Jul 2022 16:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365846.596190; Tue, 12 Jul 2022 16:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBIgS-0002CH-QA; Tue, 12 Jul 2022 16:24:24 +0000
Received: by outflank-mailman (input) for mailman id 365846;
 Tue, 12 Jul 2022 16:24:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xDJC=XR=cachengo.com=brad@srs-se1.protection.inumbo.net>)
 id 1oBIgR-0002CB-Hj
 for xen-devel@lists.xen.org; Tue, 12 Jul 2022 16:24:23 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15f17105-01ff-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 18:24:21 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id os14so15261909ejb.4
 for <xen-devel@lists.xen.org>; Tue, 12 Jul 2022 09:24:21 -0700 (PDT)
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
X-Inumbo-ID: 15f17105-01ff-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cachengo.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AiJHgP4SktI6IFUN/kbFU1k/R7pEHyYR+prIGIb4Npc=;
        b=CJY7dbh7T3nSEVWsM7bNQRU5AtEkI6xMJ4Bg4xdnuOtYlga2AUKdkenCUW9LNHLrVc
         OjXX48wT6FUrKwYgzDfhb+xtB+UL2e3Z7JXO+sNKZ1KO74pylLSvUDJd6b371l7lp3f7
         cjlSN/dJsKPIxnpxbcqShO7FnX8hGZ1IsFUxj3w1jz6to0+qPKsjqnui/+WMbGbcuM1L
         cfPrIfJI2EZgNUbIX81xDaWjrsBpWTQuRW4RfTY6OmjR38RPDfql65i6FGWFLTiNSvH7
         LSotuL0iitNTEXGQ+nUq5SyYVmxPcGSXJ+fnOQYJzrunsklQ22L7iD/QhrUMlfRl//dh
         duow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AiJHgP4SktI6IFUN/kbFU1k/R7pEHyYR+prIGIb4Npc=;
        b=CsA/Y3q2FKDzvvr20l6U0sxSiOQ9285bZOfrl4wh9yCj/vwcWtIRcHtRZ83kjueIcJ
         kBjv7mEVhPh9thNXm5MAx2qeqO1NS/ozb5aSHrM17kDzzdz4ngmYDhYbFA3aUrkm8mZ3
         9k00J5SbE3KTsWPQCjJLwPrIHIInPvaJ3ijyQRMTwxXu+uuUGOdNdIkJfF2dW0Ajzwuw
         j8xPFrBwyLndHpbkpMC8cm73Wr52ekvT9YhP3tAtWb2wQlgPvjiNqn3uq0k/TFO8zeli
         rjYUb2FlwJcublrL0yAh3OOwSaGt+Wb9dXde9OcBaNsAukjTqDb7oH1gLFkCICIt4CjO
         61pA==
X-Gm-Message-State: AJIora9RG88zN4z0fYn+60NlCmyHYpjDOHK1x/E2IG+7/wrxLKd8Ct0o
	OHXuoCuEu33/F1YuCfCOaOrdAW/Kt5/UGsW+sSaKdg==
X-Google-Smtp-Source: AGRyM1t3Xf70OpvmxqYXd2aPfh3ujeha70hYNlzCE63cSwc2Os2yq3Ua++h3pGdHoPzx68zfghZjEGt+BOG/aSnomnw=
X-Received: by 2002:a17:907:2d8a:b0:722:e35b:695 with SMTP id
 gt10-20020a1709072d8a00b00722e35b0695mr25508088ejc.470.1657643061166; Tue, 12
 Jul 2022 09:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdBLPN183W-t5bNJvxGb=t0kL4QHFQNQ7O3LZAd_yXUOrSStA@mail.gmail.com>
 <C84A929A-CCFC-497E-96C8-8D5EC3DE9AFD@arm.com> <CAMdBLPP62J250=ZTAM=vMR-a0rD_AdFxnbP5WVtybDiLisEV9w@mail.gmail.com>
 <ECBAC842-3E20-4956-BACF-CB6D8CE708F8@arm.com>
In-Reply-To: <ECBAC842-3E20-4956-BACF-CB6D8CE708F8@arm.com>
From: Brad Churchwell <brad@cachengo.com>
Date: Tue, 12 Jul 2022 11:24:10 -0500
Message-ID: <CAMdBLPOXnHuXyC9pqN=w4i8nD9aLXtBBhXL1JuUe-igsPkBwYQ@mail.gmail.com>
Subject: Re: Xen on rk3399
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: multipart/alternative; boundary="000000000000d362ef05e39e1951"

--000000000000d362ef05e39e1951
Content-Type: text/plain; charset="UTF-8"

Hi Bertrand,

I believe I understand, but just to clarify, should I leave the
ppi-partitions block in rk3399.dtsi as is and disable the little cores, or
should I also modify that block?

Brad

On Tue, Jul 12, 2022 at 11:11 AM Bertrand Marquis <Bertrand.Marquis@arm.com>
wrote:

> Hi Brad,
>
> > On 12 Jul 2022, at 16:59, Brad Churchwell <brad@cachengo.com> wrote:
> >
> > Hi Bertrand,
> >
> > Thanks so much for the quick response!
> >
> > I should have mentioned previously that this device tree and kernel
> Image (5.15.16) does boot properly with the rootfs without XEN. The
> interrupt errors are only present when booting with XEN.
> >
> > These are custom boards and they do have usb c, however we are unable to
> boot from usb as it doesn't receive power.  We currently only use the usb
> to flash u-boot to spi which requires us to use a separate power adapter.
> These boards get power and networking through a custom backplane and
> interface with the backplane via a sata style justice (I'm not sure what
> the proper terminology would be here).
> >
> > Since I cannot boot to rootfs with XEN, I'm unable to show the device
> tree there. The only bit that I added to accommodate XEN is this bit here:
> >
> > chosen {
> >     stdout-path = "serial2:1500000n8";
> >     bootargs = "hmp-unsafe=true";
> >     xen,dom0-bootargs = "console=hvc0 earlyprintk=xen clk_ignore_unused
> root=/dev/nvme0n1p2 rw init=/sbin/init rootwait rootfstype=ext4
> ignore_loglevel";
> >     modules {
> >         #address-cells = <2>;
> >         #size-cells = <2>;
> >
> >         module@1 {
> >             compatible = "xen,linux-zimage", "xen,multiboot-module";
> >             reg = <0x0 0x03F80000 0x0 0x01aa8008>;
> >         };
> >         module@2 {
> >             compatible = "xen,linux-initrd", "xen,multiboot-module";
> >             reg = <0x0 0x06000000 0x0 0x02000000>;
> >         };
> >     };
> >
> > };
> >
> > The gic declaration is in the vanilla rk3399.dtsi file and hasn't been
> modified:
> >
> >         gic: interrupt-controller@fee00000 {
> >                 compatible = "arm,gic-v3";
> >                 #interrupt-cells = <4>;
> >                 #address-cells = <2>;
> >                 #size-cells = <2>;
> >                 ranges;
> >                 interrupt-controller;
> >
> >                 reg = <0x0 0xfee00000 0 0x10000>, /* GICD */
> >                       <0x0 0xfef00000 0 0xc0000>, /* GICR */
> >                       <0x0 0xfff00000 0 0x10000>, /* GICC */
> >                       <0x0 0xfff10000 0 0x10000>, /* GICH */
> >                       <0x0 0xfff20000 0 0x10000>; /* GICV */
> >                 interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> >                 its: interrupt-controller@fee20000 {
> >                         compatible = "arm,gic-v3-its";
> >                         msi-controller;
> >                         #msi-cells = <1>;
> >                         reg = <0x0 0xfee20000 0x0 0x20000>;
> >                 };
> >
> >                 ppi-partitions {
> >                         ppi_cluster0: interrupt-partition-0 {
> >                                 affinity = <&cpu_l0 &cpu_l1 &cpu_l2
> &cpu_l3>;
> >                         };
> >
> >                         ppi_cluster1: interrupt-partition-1 {
> >                                 affinity = <&cpu_b0 &cpu_b1>;
> >                         };
> >                 };
>
> Xen is not supporting PPI partitions.
> I also saw that your booting using SMP unsafe so all core are enabled by
> Xen.
>
> Right now big/little is not supported by Xen and here you might have some
> interrupts in your system which can only occur on some specific cores.
> I would suggest to try the following:
> - only boot enable in your dtb the cores with the same type than the boot
> core
> - check in your device tree which devices are assign to the ppi_cluster
> not available and disable them
>
> This kind of configuration will be tricky to handle so it will depend on
> which devices have interrupts that can only be fired on one cluster type.
>
> Sorry but I cannot right now check in the device tree and do those checks
> myself but if you do get the idea send back a mail :-)
>
> Cheers
> Bertrand
>
> >         };
> >
> > I've attached the device tree and include files just in case you'd like
> to take a look at those.
> >
> > Thanks so much for your help! I've been at this for weeks with very
> little progress.
> >
> > Cheers,
> > Brad
> >
> >
> > On Tue, Jul 12, 2022 at 10:05 AM Bertrand Marquis <
> Bertrand.Marquis@arm.com> wrote:
> > Hi Brad,
> >
> > > On 11 Jul 2022, at 19:38, Brad Churchwell <brad@cachengo.com> wrote:
> > >
> > > Hello,
> > >
> > > I've been trying to get Xen to boot dom0 with my kernel for weeks on
> an rk3399 based board and thought I'd reach out for help. It looks like
> either Xen is not properly recreating the device tree or the interrupt
> controller is just failing. The hypervisor boots but falls to initramfs
> because it cannot find the root device (nvme on pcie). Any help would be
> greatly appreciated. Here is the complete boot log
> >
> > From the logs you have an issue with the interrupt controller and the
> fact that your NVME is behind PCIE and as such depends on ITS is probably
> not helping.
> >
> > I would suggest to try to boot on usb as root fs for a try.
> >
> > Also it could be useful to compare the device tree on xen and without
> xen to understand what is going on (using /proc/device-tree).
> >
> > Xen seems to be ok but Linux is not happy with interrupts and is showing
> several issues around this area on your logs.
> > Could you show us an extract of your device tree around the gic
> declaration ?
> >
> > Cheers
> > Bertrand
> >
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
> > <rk3399-zaku.dts><rk3399-zaku.dtsi><rk3399.dtsi>
>
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
>

--000000000000d362ef05e39e1951
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bertrand,<div><br></div><div>I believe I understand, bu=
t just to clarify, should I leave the ppi-partitions block in rk3399.dtsi a=
s is and disable the little cores, or should I also modify that block?</div=
><div><br></div><div>Brad</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, Jul 12, 2022 at 11:11 AM Bertrand Ma=
rquis &lt;<a href=3D"mailto:Bertrand.Marquis@arm.com">Bertrand.Marquis@arm.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hi Brad,<br>
<br>
&gt; On 12 Jul 2022, at 16:59, Brad Churchwell &lt;<a href=3D"mailto:brad@c=
achengo.com" target=3D"_blank">brad@cachengo.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Bertrand,<br>
&gt;<br>
&gt; Thanks so much for the quick response!<br>
&gt;<br>
&gt; I should have mentioned previously that this device tree and kernel Im=
age (5.15.16) does boot properly with the rootfs without XEN. The interrupt=
 errors are only present when booting with XEN.<br>
&gt;<br>
&gt; These are custom boards and they do have usb c, however we are unable =
to boot from usb as it doesn&#39;t receive power.=C2=A0 We currently only u=
se the usb to flash u-boot to spi which requires us to use a separate power=
 adapter. These boards get power and networking through a custom backplane =
and interface with the backplane via a sata style justice (I&#39;m not sure=
 what the proper terminology would be here).<br>
&gt;<br>
&gt; Since I cannot boot to rootfs with XEN, I&#39;m unable to show the dev=
ice tree there. The only bit that I added to accommodate XEN is this bit he=
re:<br>
&gt;<br>
&gt; chosen {<br>
&gt;=C2=A0 =C2=A0 =C2=A0stdout-path =3D &quot;serial2:1500000n8&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0bootargs =3D &quot;hmp-unsafe=3Dtrue&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0xen,dom0-bootargs =3D &quot;console=3Dhvc0 earlypri=
ntk=3Dxen clk_ignore_unused root=3D/dev/nvme0n1p2 rw init=3D/sbin/init root=
wait rootfstype=3Dext4 ignore_loglevel&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0modules {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;2&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;2&gt;;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0module@1 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;xe=
n,linux-zimage&quot;, &quot;xen,multiboot-module&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0x03F80=
000 0x0 0x01aa8008&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0module@2 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;xe=
n,linux-initrd&quot;, &quot;xen,multiboot-module&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0x06000=
000 0x0 0x02000000&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt; };<br>
&gt;<br>
&gt; The gic declaration is in the vanilla rk3399.dtsi file and hasn&#39;t =
been modified:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic: interrupt-controller@fee00000 {<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatibl=
e =3D &quot;arm,gic-v3&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#interrup=
t-cells =3D &lt;4&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-=
cells =3D &lt;2&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cel=
ls =3D &lt;2&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ranges;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt=
-controller;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &=
lt;0x0 0xfee00000 0 0x10000&gt;, /* GICD */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;0x0 0xfef00000 0 0xc0000&gt;, /* GICR */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;0x0 0xfff00000 0 0x10000&gt;, /* GICC */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;0x0 0xfff10000 0 0x10000&gt;, /* GICH */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;0x0 0xfff20000 0 0x10000&gt;; /* GICV */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupt=
s =3D &lt;GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0its: inte=
rrupt-controller@fee20000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;arm,gic-v3-its&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0msi-controller;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0#msi-cells =3D &lt;1&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0xfee20000 0x0 0x20000&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ppi-parti=
tions {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ppi_cluster0: interrupt-partition-0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0affinity =3D &lt;&amp;cpu_l=
0 &amp;cpu_l1 &amp;cpu_l2 &amp;cpu_l3&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ppi_cluster1: interrupt-partition-1 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0affinity =3D &lt;&amp;cpu_b=
0 &amp;cpu_b1&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
<br>
Xen is not supporting PPI partitions.<br>
I also saw that your booting using SMP unsafe so all core are enabled by Xe=
n.<br>
<br>
Right now big/little is not supported by Xen and here you might have some i=
nterrupts in your system which can only occur on some specific cores.<br>
I would suggest to try the following:<br>
- only boot enable in your dtb the cores with the same type than the boot c=
ore<br>
- check in your device tree which devices are assign to the ppi_cluster not=
 available and disable them<br>
<br>
This kind of configuration will be tricky to handle so it will depend on wh=
ich devices have interrupts that can only be fired on one cluster type.<br>
<br>
Sorry but I cannot right now check in the device tree and do those checks m=
yself but if you do get the idea send back a mail :-)<br>
<br>
Cheers<br>
Bertrand<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt; I&#39;ve attached the device tree and include files just in case you&#=
39;d like to take a look at those.<br>
&gt;<br>
&gt; Thanks so much for your help! I&#39;ve been at this for weeks with ver=
y little progress.<br>
&gt;<br>
&gt; Cheers,<br>
&gt; Brad<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Jul 12, 2022 at 10:05 AM Bertrand Marquis &lt;<a href=3D"mailt=
o:Bertrand.Marquis@arm.com" target=3D"_blank">Bertrand.Marquis@arm.com</a>&=
gt; wrote:<br>
&gt; Hi Brad,<br>
&gt;<br>
&gt; &gt; On 11 Jul 2022, at 19:38, Brad Churchwell &lt;<a href=3D"mailto:b=
rad@cachengo.com" target=3D"_blank">brad@cachengo.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ve been trying to get Xen to boot dom0 with my kernel for w=
eeks on an rk3399 based board and thought I&#39;d reach out for help. It lo=
oks like either Xen is not properly recreating the device tree or the inter=
rupt controller is just failing. The hypervisor boots but falls to initramf=
s because it cannot find the root device (nvme on pcie). Any help would be =
greatly appreciated. Here is the complete boot log<br>
&gt;<br>
&gt; From the logs you have an issue with the interrupt controller and the =
fact that your NVME is behind PCIE and as such depends on ITS is probably n=
ot helping.<br>
&gt;<br>
&gt; I would suggest to try to boot on usb as root fs for a try.<br>
&gt;<br>
&gt; Also it could be useful to compare the device tree on xen and without =
xen to understand what is going on (using /proc/device-tree).<br>
&gt;<br>
&gt; Xen seems to be ok but Linux is not happy with interrupts and is showi=
ng several issues around this area on your logs.<br>
&gt; Could you show us an extract of your device tree around the gic declar=
ation ?<br>
&gt;<br>
&gt; Cheers<br>
&gt; Bertrand<br>
&gt;<br>
&gt;<br>
&gt; IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any purpose, or store or copy the informatio=
n in any medium. Thank you.<br>
&gt; &lt;rk3399-zaku.dts&gt;&lt;rk3399-zaku.dtsi&gt;&lt;rk3399.dtsi&gt;<br>
<br>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.<br>
</blockquote></div>

--000000000000d362ef05e39e1951--

