Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEA7303F75
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 14:59:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75099.135129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4OsD-0004Sr-BA; Tue, 26 Jan 2021 13:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75099.135129; Tue, 26 Jan 2021 13:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4OsD-0004SV-7t; Tue, 26 Jan 2021 13:59:13 +0000
Received: by outflank-mailman (input) for mailman id 75099;
 Tue, 26 Jan 2021 13:59:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vBst=G5=unikie.com=jukka.kaartinen@srs-us1.protection.inumbo.net>)
 id 1l4OsB-0004SQ-Nc
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:59:12 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91dbc0d7-3993-4911-b9c2-b31e86ca4e30;
 Tue, 26 Jan 2021 13:59:09 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id m22so22829974lfg.5
 for <xen-devel@lists.xenproject.org>; Tue, 26 Jan 2021 05:59:09 -0800 (PST)
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
X-Inumbo-ID: 91dbc0d7-3993-4911-b9c2-b31e86ca4e30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r68rIuJKbHhp2knjyQUOmU9agLKLkqieGzaufXvNPWY=;
        b=G5F8pYi2usHOfa2ZZqBEDItXo8N/Jv5koxKPjOsfadFanLS+I45qjqgWMtecWOnwM0
         8nZiZIxuY6Bd+E/k1peoPznyuJwK74Favs0WW1Om1hFxRdPHKQ2Ia3dPHpKuTy4eh4AC
         S6aM08pLwAHEBz8N2Gk+P4g3u+uBbSvKxL3NA7rcUkrXkiniz8nJ6jUuI6XcBBB/pwP6
         nfmNT2FhkvCa3F+G7Qz6LXul5aa4g6Nz0gZdGFsui3u0GT7kwVY0QY9xRgXVdW9UYhOc
         OVcDKjbYz5F7xkTmbP2BIEcj7Hkoi5m5fI+m+ZatNf8gOgMbcX1BorJL2M3bVY9a0uM4
         IHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r68rIuJKbHhp2knjyQUOmU9agLKLkqieGzaufXvNPWY=;
        b=hToGDUo9TkXIeP9C/IM3ScRCPZTH8UCUusI/zXCbaDQA2PvrnCwRqgDU8WiC7BYQwX
         8wX0wQRRBCYAXnz+EAcF0Bzy3gXYZO0/QaWxUTvcvDxkNrUeqFe6ht39qXuaxCGS1XWW
         mA9fa18PnVLyOmm7RfBiO6M0VKt+eMgqlPQUCzh2qlVnzpwSk16cheBRPnEO+bBb+sA4
         QRfJUzQ+Z1rhL82YccIQ8z8w37m7tHWHb5T3c4q609SzOJPGCxyfs9Qps5QfaRH/8hOv
         o0qFdbBKBGSS0i9Q6Q26Zcw4FZfSD+GR2O55k2P4sfhxtJqGBJzVqb8Wgbu9bN6x8Yh+
         HYgQ==
X-Gm-Message-State: AOAM531875698AHYI/Exh58uaI/1lVCfFcvgXEqPIGhuDjRJKEic69YU
	T7le14ot6oFDq2574hzCV7mtd00T2dfc27xKoCoOKQ==
X-Google-Smtp-Source: ABdhPJzh74grNA1AWCLIkpXrSyxy+rB7PUsgvNjHIs++vLBLaqUQdFMkV+vHCNvJfHCboTglOvKaTvuRipMPMzdmBBE=
X-Received: by 2002:ac2:4114:: with SMTP id b20mr2753211lfi.180.1611669548104;
 Tue, 26 Jan 2021 05:59:08 -0800 (PST)
MIME-Version: 1.0
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com>
 <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s>
 <CAFnJQOqoqj6mWwR61ZsZj1JxRrdisFtH_87YXCeW619GM+L21Q@mail.gmail.com>
 <alpine.DEB.2.21.2101251646470.20638@sstabellini-ThinkPad-T480s> <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com>
In-Reply-To: <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com>
From: Jukka Kaartinen <jukka.kaartinen@unikie.com>
Date: Tue, 26 Jan 2021 15:58:57 +0200
Message-ID: <CAFnJQOr+VSgGYvPeC6eDt1_JW8x8A7H+_gk0mFauMPgevi+OMw@mail.gmail.com>
Subject: Re: Question about xen and Rasp 4B
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Roman Shaposhnik <roman@zededa.com>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: multipart/alternative; boundary="000000000000e9184905b9ce0ebf"

--000000000000e9184905b9ce0ebf
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 26, 2021 at 12:59 PM Jukka Kaartinen <jukka.kaartinen@unikie.com>
wrote:

>
>
> On Tue, Jan 26, 2021 at 2:54 AM Stefano Stabellini <sstabellini@kernel.org>
> wrote:
>
>> On Sat, 23 Jan 2021, Jukka Kaartinen wrote:
>> > Thanks for the response!
>> >
>> > On Sat, Jan 23, 2021 at 2:27 AM Stefano Stabellini <
>> sstabellini@kernel.org> wrote:
>> >       + xen-devel, Roman,
>> >
>> >
>> >       On Fri, 22 Jan 2021, Jukka Kaartinen wrote:
>> >       > Hi Stefano,
>> >       > I'm Jukka Kaartinen a SW developer working on enabling
>> hypervisors on mobile platforms. One of our HW that we use on
>> >       development is
>> >       > Raspberry Pi 4B. I wonder if you could help me a bit :).
>> >       >
>> >       > I'm trying to enable the GPU with Xen + Raspberry Pi for
>> >       dom0.
>> https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605
>> >       >
>> >       > I got so far that GPU drivers are loaded (v3d & vc4) without
>> errors. But now Xen returns error when X is starting:
>> >       > (XEN) traps.c:1986:d0v1 HSR=0x93880045 pc=0x00007f97b14e70
>> gva=0x7f7f817000 gpa=0x0000401315d000
>> >       >  I tried to debug what causes this and looks
>> like find_mmio_handler cannot find handler.
>> >       > (See more here:
>> https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691
>> )
>> >       >
>> >       > Any ideas why the handler is not found?
>> >
>> >
>> >       Hi Jukka,
>> >
>> >       I am glad to hear that you are interested in Xen on RaspberryPi
>> :-)  I
>> >       haven't tried the GPU yet, I have been using the serial only.
>> >       Roman, did you ever get the GPU working?
>> >
>> >
>> >       The error is a data abort error: Linux is trying to access an
>> address
>> >       which is not mapped to dom0. The address seems to be
>> 0x401315d000. It is
>> >       a pretty high address; I looked in device tree but couldn't spot
>> it.
>> >
>> >       >From the HSR (the syndrom register) it looks like it is a
>> translation
>> >       fault at EL1 on stage1. As if the Linux address mapping was wrong.
>> >       Anyone has any ideas how this could happen? Maybe a
>> reserved-memory
>> >       misconfiguration?
>> >
>> > I had issues with loading the driver in the first place. Apparently
>> swiotlb is used, maybe it can cause this. I also tried to enable CMA.
>> > config.txt:
>> > dtoverlay=vc4-fkms-v3d,cma=320M@0x0-0x40000000
>> > gpu_mem=128
>>
>> Also looking at your other reply and the implementation of
>> vc4_bo_create, it looks like this is a CMA problem.
>>
>> It would be good to run a test with the swiotlb-xen disabled:
>>
>> diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
>> index 467fa225c3d0..2bdd12785d14 100644
>> --- a/arch/arm/xen/mm.c
>> +++ b/arch/arm/xen/mm.c
>> @@ -138,8 +138,7 @@ void xen_destroy_contiguous_region(phys_addr_t
>> pstart, unsigned int order)
>>  static int __init xen_mm_init(void)
>>  {
>>         struct gnttab_cache_flush cflush;
>> -       if (!xen_initial_domain())
>> -               return 0;
>> +       return 0;
>>         xen_swiotlb_init(1, false);
>>
>>         cflush.op = 0;
>>
> With this change the kernel is not booting up. (btw. I'm using USB SSD for
> my OS.)
> [    0.071081] bcm2835-dma fe007000.dma: Unable to set DMA mask
> [    0.076277] bcm2835-dma fe007b00.dma: Unable to set DMA mask
> (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=25: not implemented
> (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
> [    0.592695] pci 0000:00:00.0: Failed to add - passthrough or MSI/MSI-X
> might fail!
> (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
> [    0.606819] pci 0000:01:00.0: Failed to add - passthrough or MSI/MSI-X
> might fail!
> [    1.212820] usb 1-1: device descriptor read/64, error 18
> [    1.452815] usb 1-1: device descriptor read/64, error 18
> [    1.820813] usb 1-1: device descriptor read/64, error 18
> [    2.060815] usb 1-1: device descriptor read/64, error 18
> [    2.845548] usb 1-1: device descriptor read/8, error -61
> [    2.977603] usb 1-1: device descriptor read/8, error -61
> [    3.237530] usb 1-1: device descriptor read/8, error -61
> [    3.369585] usb 1-1: device descriptor read/8, error -61
> [    3.480765] usb usb1-port1: unable to enumerate USB device
>
> Traces stop here. I could try with a memory card. Maybe it makes a
> difference.
>
>
>>
>> It is going to be fine just to boot Dom0 and DomUs without PV drivers.
>> Also, can you post the device tree that you are using here? Just in case
>> there is an issue with Xen parsing any possible /reserved-memory nodes
>> with CMA info that need to be passed on to Dom0.
>
> Here is the device dumped from command line:
> dtc -I fs /proc/device-tree
>
> https://drive.google.com/file/d/17u18dJHxRfbGZMtRXIwtLVZZfMj9KwN-/view?usp=sharing
>
>
Here is log from XEN when it goes through the device tree:
https://drive.google.com/file/d/1jvT3ZNJeXHfxPOffiaRSRg8FPwQHS1mb/view?usp=sharing



>
>>
>> >       > p.s.
>> >       > While testing I found issue with Xen master branch and your
>> patch: xen/rpi4: implement watchdog-based reset
>> >       >
>> >       > Looks like black listing the bcm2835-pm
>> >       > @@ -37,12 +41,69 @@ static const struct dt_device_match
>> rpi4_blacklist_dev[] __initconst =
>> >       >       * The aux peripheral also shares a page with the aux UART.
>> >       >       */
>> >       >      DT_MATCH_COMPATIBLE("brcm,bcm2835-aux"),
>> >       > +    /* Special device used for rebooting */
>> >       > +    DT_MATCH_COMPATIBLE("brcm,bcm2835-pm"),
>> >       >
>> >       > will prevent v3d driver to locate phandle. I think it will use
>> the same resource:
>> >       >   pm: watchdog@7e100000 {
>> >       >       compatible = "brcm,bcm2835-pm", "brcm,bcm2835-pm-wdt";
>> >       > #power-domain-cells = <1>;
>> >       > #reset-cells = <1>;
>> >       > reg = <0x7e100000 0x114>,
>> >       >      <0x7e00a000 0x24>,
>> >       >      <0x7ec11000 0x20>;
>> >       > clocks = <&clocks BCM2835_CLOCK_V3D>,
>> >       > <&clocks BCM2835_CLOCK_PERI_IMAGE>,
>> >       > <&clocks BCM2835_CLOCK_H264>,
>> >       > <&clocks BCM2835_CLOCK_ISP>;
>> >       > clock-names = "v3d", "peri_image", "h264", "isp";
>> >       > system-power-controller;
>> >       >
>> >       > };
>> >
>> >       Yeah, I imagine it could be possible. Can you post the error
>> message you
>> >       are seeing from the v3d driver?
>> >
>> > This is the error:
>> > [    0.069682] OF: /v3dbus/v3d@7ec04000: could not find phandle
>> > [    0.074828] OF: /v3dbus/v3d@7ec04000: could not find phandle
>> > v3d driver is not loaded.
>> >
>> > --
>> > Br,
>> > Jukka Kaartinen
>> >
>> >
>
>
>
> --
> Br,
> Jukka Kaartinen
>


-- 
Br,
Jukka Kaartinen

--000000000000e9184905b9ce0ebf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 26, 2021 at 12:59 PM Jukk=
a Kaartinen &lt;<a href=3D"mailto:jukka.kaartinen@unikie.com">jukka.kaartin=
en@unikie.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 26, 2021 at =
2:54 AM Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" ta=
rget=3D"_blank">sstabellini@kernel.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Sat, 23 Jan 2021, Jukka Kaartinen =
wrote:<br>
&gt; Thanks for the response!<br>
&gt; <br>
&gt; On Sat, Jan 23, 2021 at 2:27 AM Stefano Stabellini &lt;<a href=3D"mail=
to:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;=
 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+ xen-devel, Roman,<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Fri, 22 Jan 2021, Jukka Kaartinen wrote:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi Stefano,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I&#39;m Jukka=C2=A0Kaartinen a SW devel=
oper working on enabling hypervisors on mobile platforms. One of our HW tha=
t we use on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0development is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Raspberry Pi 4B. I wonder if you could =
help me a bit :).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I&#39;m trying to enable the GPU with X=
en=C2=A0+ Raspberry Pi for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dom0.=C2=A0<a href=3D"https://www.raspberryp=
i.org/forums/viewtopic.php?f=3D63&amp;t=3D232323#p1797605" rel=3D"noreferre=
r" target=3D"_blank">https://www.raspberrypi.org/forums/viewtopic.php?f=3D6=
3&amp;t=3D232323#p1797605</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I got so far that GPU drivers are loade=
d (v3d &amp; vc4) without errors. But now Xen returns error=C2=A0when X is =
starting:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (XEN) traps.c:1986:d0v1 HSR=3D0x9388004=
5 pc=3D0x00007f97b14e70 gva=3D0x7f7f817000 gpa=3D0x0000401315d000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0I tried to debug what causes this=
 and looks like=C2=A0find_mmio_handler=C2=A0cannot find handler.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (See more here: <a href=3D"https://www.=
raspberrypi.org/forums/viewtopic.php?f=3D63&amp;t=3D232323&amp;start=3D25#p=
1801691" rel=3D"noreferrer" target=3D"_blank">https://www.raspberrypi.org/f=
orums/viewtopic.php?f=3D63&amp;t=3D232323&amp;start=3D25#p1801691</a> )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Any ideas why the handler is not found?=
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Jukka,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I am glad to hear that you are interested in=
 Xen on RaspberryPi :-)=C2=A0 I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0haven&#39;t tried the GPU yet, I have been u=
sing the serial only.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Roman, did you ever get the GPU working?<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0The error is a data abort error: Linux is tr=
ying to access an address<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0which is not mapped to dom0. The address see=
ms to be 0x401315d000. It is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0a pretty high address; I looked in device tr=
ee but couldn&#39;t spot it.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;From the HSR (the syndrom register) it l=
ooks like it is a translation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fault at EL1 on stage1. As if the Linux addr=
ess mapping was wrong.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Anyone has any ideas how this could happen? =
Maybe a reserved-memory<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0misconfiguration?<br>
&gt; <br>
&gt; I had issues=C2=A0with loading the driver in the first place. Apparent=
ly swiotlb is used, maybe it=C2=A0can cause this. I also tried to enable CM=
A.<br>
&gt; config.txt:<br>
&gt; dtoverlay=3Dvc4-fkms-v3d,cma=3D320M@0x0-0x40000000<br>
&gt; gpu_mem=3D128<br>
<br>
Also looking at your other reply and the implementation of<br>
vc4_bo_create, it looks like this is a CMA problem.<br>
<br>
It would be good to run a test with the swiotlb-xen disabled:<br>
<br>
diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c<br>
index 467fa225c3d0..2bdd12785d14 100644<br>
--- a/arch/arm/xen/mm.c<br>
+++ b/arch/arm/xen/mm.c<br>
@@ -138,8 +138,7 @@ void xen_destroy_contiguous_region(phys_addr_t pstart, =
unsigned int order)<br>
=C2=A0static int __init xen_mm_init(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gnttab_cache_flush cflush;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!xen_initial_domain())<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 xen_swiotlb_init(1, false);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cflush.op =3D 0;<br></blockquote><div>With this=
 change the kernel is not booting up. (btw. I&#39;m using USB SSD for my OS=
.)</div><div>[ =C2=A0 =C2=A00.071081] bcm2835-dma fe007000.dma: Unable to s=
et DMA mask<br>[ =C2=A0 =C2=A00.076277] bcm2835-dma fe007b00.dma: Unable to=
 set DMA mask<br>(XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=3D25: not implemente=
d<br>(XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=3D15: not implemented<br>[ =C2=
=A0 =C2=A00.592695] pci 0000:00:00.0: Failed to add - passthrough or MSI/MS=
I-X might fail!<br>(XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=3D15: not implemen=
ted<br>[ =C2=A0 =C2=A00.606819] pci 0000:01:00.0: Failed to add - passthrou=
gh or MSI/MSI-X might fail!<br>[ =C2=A0 =C2=A01.212820] usb 1-1: device des=
criptor read/64, error 18<br>[ =C2=A0 =C2=A01.452815] usb 1-1: device descr=
iptor read/64, error 18<br>[ =C2=A0 =C2=A01.820813] usb 1-1: device descrip=
tor read/64, error 18<br>[ =C2=A0 =C2=A02.060815] usb 1-1: device descripto=
r read/64, error 18<br>[ =C2=A0 =C2=A02.845548] usb 1-1: device descriptor =
read/8, error -61<br>[ =C2=A0 =C2=A02.977603] usb 1-1: device descriptor re=
ad/8, error -61<br>[ =C2=A0 =C2=A03.237530] usb 1-1: device descriptor read=
/8, error -61<br>[ =C2=A0 =C2=A03.369585] usb 1-1: device descriptor read/8=
, error -61<br>[ =C2=A0 =C2=A03.480765] usb usb1-port1: unable to enumerate=
 USB device<br></div><div><br></div><div>Traces stop here. I could try with=
 a memory card. Maybe it makes a difference.</div><div>=C2=A0<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
It is going to be fine just to boot Dom0 and DomUs without PV drivers.<br>
Also, can you post the device tree that you are using here? Just in case<br=
>
there is an issue with Xen parsing any possible /reserved-memory nodes<br>
with CMA info that need to be passed on to Dom0.</blockquote><div>Here is t=
he device dumped from command line:</div><div>dtc -I fs /proc/device-tree</=
div><div><a href=3D"https://drive.google.com/file/d/17u18dJHxRfbGZMtRXIwtLV=
ZZfMj9KwN-/view?usp=3Dsharing" target=3D"_blank">https://drive.google.com/f=
ile/d/17u18dJHxRfbGZMtRXIwtLVZZfMj9KwN-/view?usp=3Dsharing</a><br></div><di=
v>=C2=A0</div></div></div></blockquote><div>Here is log from XEN when it go=
es through the device tree:</div><div><a href=3D"https://drive.google.com/f=
ile/d/1jvT3ZNJeXHfxPOffiaRSRg8FPwQHS1mb/view?usp=3Dsharing">https://drive.g=
oogle.com/file/d/1jvT3ZNJeXHfxPOffiaRSRg8FPwQHS1mb/view?usp=3Dsharing</a><b=
r></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; p.s.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; While testing I found issue with Xen ma=
ster branch and your patch:=C2=A0xen/rpi4: implement watchdog-based reset<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Looks like black listing the=C2=A0bcm28=
35-pm<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; @@ -37,12 +41,69 @@ static const struct=
 dt_device_match rpi4_blacklist_dev[] __initconst =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 * The aux peripher=
al also shares a page with the aux UART.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0DT_MATCH_COMPATIBLE=
(&quot;brcm,bcm2835-aux&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; + =C2=A0 =C2=A0/* Special device used f=
or rebooting */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; + =C2=A0 =C2=A0DT_MATCH_COMPATIBLE(&quo=
t;brcm,bcm2835-pm&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; will prevent v3d driver to locate phand=
le. I think it will use the same resource:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 pm: watchdog@7e100000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =
=3D &quot;brcm,bcm2835-pm&quot;, &quot;brcm,bcm2835-pm-wdt&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; #power-domain-cells =3D &lt;1&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; #reset-cells =3D &lt;1&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; reg =3D &lt;0x7e100000 0x114&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0&lt;0x7e00a000 0x24=
&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0&lt;0x7ec11000 0x20=
&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; clocks =3D &lt;&amp;clocks BCM2835_CLOC=
K_V3D&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;&amp;clocks BCM2835_CLOCK_PERI_IMAG=
E&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;&amp;clocks BCM2835_CLOCK_H264&gt;,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;&amp;clocks BCM2835_CLOCK_ISP&gt;;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; clock-names =3D &quot;v3d&quot;, &quot;=
peri_image&quot;, &quot;h264&quot;, &quot;isp&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; system-power-controller;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; };<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Yeah, I imagine it could be possible. Can yo=
u post the error message you<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0are seeing from the v3d driver?<br>
&gt; <br>
&gt; This is the error:<br>
&gt; [ =C2=A0 =C2=A00.069682] OF: /v3dbus/v3d@7ec04000: could not find phan=
dle<br>
&gt; [ =C2=A0 =C2=A00.074828] OF: /v3dbus/v3d@7ec04000: could not find phan=
dle<br>
&gt; v3d driver is not loaded.<br>
&gt; <br>
&gt; --<br>
&gt; Br,<br>
&gt; Jukka Kaartinen<br>
&gt; <br>
&gt; </blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D=
"ltr"><div dir=3D"ltr"><div>Br,</div><div>Jukka Kaartinen</div></div></div>=
</div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Br,</div><div>Jukka Kaarti=
nen</div></div></div></div>

--000000000000e9184905b9ce0ebf--

