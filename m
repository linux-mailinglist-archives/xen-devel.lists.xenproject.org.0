Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C375301633
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jan 2021 16:17:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73319.132166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3KfA-00039I-16; Sat, 23 Jan 2021 15:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73319.132166; Sat, 23 Jan 2021 15:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3Kf9-00038t-TN; Sat, 23 Jan 2021 15:17:19 +0000
Received: by outflank-mailman (input) for mailman id 73319;
 Sat, 23 Jan 2021 14:29:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KE1E=G2=unikie.com=jukka.kaartinen@srs-us1.protection.inumbo.net>)
 id 1l3Jur-0006se-9z
 for xen-devel@lists.xenproject.org; Sat, 23 Jan 2021 14:29:29 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0419504e-bc3b-4c89-9cf2-934b71eaa425;
 Sat, 23 Jan 2021 14:29:27 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id a12so3444669lfb.1
 for <xen-devel@lists.xenproject.org>; Sat, 23 Jan 2021 06:29:27 -0800 (PST)
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
X-Inumbo-ID: 0419504e-bc3b-4c89-9cf2-934b71eaa425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vGTVbhqDYkiCrLAlbXotpw+CIsbbzjF5RiPtCmwIQLs=;
        b=XclbSLPwX7TJKJ6OHS6nii/RcR4Pngy8Psu2s9Gj2rrflq+wn57jI+52KuEuH3wjLg
         V+mcnXp96jkSxm2l4tRutQ1flkKY7tYJfpUE8WZi+wD6u159HJ6IW7ZZSprGIsmF7kIt
         +SSjD5TsaPeLY8/XAkyigFNwsJUlrIfolnwmixa9nSHApKZxGNyumRhe0I2EgqTc/bQU
         bqeyyXArs+mpCe3Ag8i5lJj6/DbBPG9Ru2857Trp17jAiCdZU2M1DGRSmyIQQHFtTjNF
         9w6N/KgtIBWQ0h9WcI4jpj3AYpNhsmtkMyyZU5ozd7uehGhLnBNhzIQ//578BBELQI8i
         e0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vGTVbhqDYkiCrLAlbXotpw+CIsbbzjF5RiPtCmwIQLs=;
        b=O5WtCaW+4J+q9I5HlY/1wvvYd0r6n+2K2jSk/0iclksBBrndUss79mZXwH0veDU2S0
         uqmDktS5Cvnk7Hl+IMfue9UAuMFkpSky+Nb4EP50b0S3dwKu1xXS8mrDK4f3qj8HFjx5
         H8W10Di4hGM1y3rzbgXyJi/6DHV1Rqu75Hmlu277WIvsk+YhreeEU8u3CA6nIY/+AK9Z
         cruVs3QULbNiaPVwDd63RpwL+SG3zNrrCiBTcLMcOIqQTvhIkvNGJUL9iY4Snig+Q/4r
         JZO5QqeZDvgeyUDiykG7nYkHARFb6JFf3BM7OZpZx1pHuxYF7IEwUePFZoDAsRF4hMsb
         ufBw==
X-Gm-Message-State: AOAM532LIvJxA+Iy2W1u0mTq1zDdMFe0T0Wb+6VqirWgAuz+UdCvPNzr
	OTo7jfNeHAmjkAA02/QMezkILDsb8+HIZX/uwih6NA==
X-Google-Smtp-Source: ABdhPJzETc4hGbvroTJ4YBFqWzxSXfYO6dYb2BB/4FwBJyxLb6bfKzc8M2G3tXWivJIsIn7uuxwbH5IIXp3AisAnXmw=
X-Received: by 2002:ac2:4114:: with SMTP id b20mr200144lfi.180.1611412166144;
 Sat, 23 Jan 2021 06:29:26 -0800 (PST)
MIME-Version: 1.0
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com>
 <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s>
From: Jukka Kaartinen <jukka.kaartinen@unikie.com>
Date: Sat, 23 Jan 2021 16:29:15 +0200
Message-ID: <CAFnJQOqoqj6mWwR61ZsZj1JxRrdisFtH_87YXCeW619GM+L21Q@mail.gmail.com>
Subject: Re: Question about xen and Rasp 4B
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, roman@zededa.com, julien@xen.org, 
	Bertrand.Marquis@arm.com
Content-Type: multipart/alternative; boundary="000000000000c009f305b9922114"

--000000000000c009f305b9922114
Content-Type: text/plain; charset="UTF-8"

Thanks for the response!

On Sat, Jan 23, 2021 at 2:27 AM Stefano Stabellini <sstabellini@kernel.org>
wrote:

> + xen-devel, Roman,
>
>
> On Fri, 22 Jan 2021, Jukka Kaartinen wrote:
> > Hi Stefano,
> > I'm Jukka Kaartinen a SW developer working on enabling hypervisors on
> mobile platforms. One of our HW that we use on development is
> > Raspberry Pi 4B. I wonder if you could help me a bit :).
> >
> > I'm trying to enable the GPU with Xen + Raspberry Pi for dom0.
> https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605
> >
> > I got so far that GPU drivers are loaded (v3d & vc4) without errors. But
> now Xen returns error when X is starting:
> > (XEN) traps.c:1986:d0v1 HSR=0x93880045 pc=0x00007f97b14e70
> gva=0x7f7f817000 gpa=0x0000401315d000
> >  I tried to debug what causes this and looks
> like find_mmio_handler cannot find handler.
> > (See more here:
> https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691
> )
> >
> > Any ideas why the handler is not found?
>
>
> Hi Jukka,
>
> I am glad to hear that you are interested in Xen on RaspberryPi :-)  I
> haven't tried the GPU yet, I have been using the serial only.
> Roman, did you ever get the GPU working?
>
>
> The error is a data abort error: Linux is trying to access an address
> which is not mapped to dom0. The address seems to be 0x401315d000. It is
> a pretty high address; I looked in device tree but couldn't spot it.
>
> From the HSR (the syndrom register) it looks like it is a translation
> fault at EL1 on stage1. As if the Linux address mapping was wrong.
> Anyone has any ideas how this could happen? Maybe a reserved-memory
> misconfiguration?
>
I had issues with loading the driver in the first place. Apparently swiotlb
is used, maybe it can cause this. I also tried to enable CMA.
config.txt:
dtoverlay=vc4-fkms-v3d,cma=320M@0x0-0x40000000
gpu_mem=128

That memory is very high. Success full address is for example
this: 0xff841f00
(XEN) GICv2 initialization:
(XEN)         gic_dist_addr=00000000ff841000
(XEN)         gic_cpu_addr=00000000ff842000
(XEN)         gic_hyp_addr=00000000ff844000
(XEN)         gic_vcpu_addr=00000000ff846000
(XEN)         gic_maintenance_irq=25


> > p.s.
> > While testing I found issue with Xen master branch and your
> patch: xen/rpi4: implement watchdog-based reset
> >
> > Looks like black listing the bcm2835-pm
> > @@ -37,12 +41,69 @@ static const struct dt_device_match
> rpi4_blacklist_dev[] __initconst =
> >       * The aux peripheral also shares a page with the aux UART.
> >       */
> >      DT_MATCH_COMPATIBLE("brcm,bcm2835-aux"),
> > +    /* Special device used for rebooting */
> > +    DT_MATCH_COMPATIBLE("brcm,bcm2835-pm"),
> >
> > will prevent v3d driver to locate phandle. I think it will use the same
> resource:
> >   pm: watchdog@7e100000 {
> >       compatible = "brcm,bcm2835-pm", "brcm,bcm2835-pm-wdt";
> > #power-domain-cells = <1>;
> > #reset-cells = <1>;
> > reg = <0x7e100000 0x114>,
> >      <0x7e00a000 0x24>,
> >      <0x7ec11000 0x20>;
> > clocks = <&clocks BCM2835_CLOCK_V3D>,
> > <&clocks BCM2835_CLOCK_PERI_IMAGE>,
> > <&clocks BCM2835_CLOCK_H264>,
> > <&clocks BCM2835_CLOCK_ISP>;
> > clock-names = "v3d", "peri_image", "h264", "isp";
> > system-power-controller;
> >
> > };
>
> Yeah, I imagine it could be possible. Can you post the error message you
> are seeing from the v3d driver?

This is the error:
[    0.069682] OF: /v3dbus/v3d@7ec04000: could not find phandle
[    0.074828] OF: /v3dbus/v3d@7ec04000: could not find phandle
v3d driver is not loaded.

-- 
Br,
Jukka Kaartinen

--000000000000c009f305b9922114
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Thanks for the response!<br></div></=
div><div class=3D"gmail_quote"><div class=3D"gmail_attr"><br></div><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Jan 23, 2021 at 2:27 AM Stefano Stabe=
llini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+=
 xen-devel, Roman,<br>
<br>
<br>
On Fri, 22 Jan 2021, Jukka Kaartinen wrote:<br>
&gt; Hi Stefano,<br>
&gt; I&#39;m Jukka=C2=A0Kaartinen a SW developer working on enabling hyperv=
isors on mobile platforms. One of our HW that we use on development is<br>
&gt; Raspberry Pi 4B. I wonder if you could help me a bit :).<br>
&gt; <br>
&gt; I&#39;m trying to enable the GPU with Xen=C2=A0+ Raspberry Pi for dom0=
.=C2=A0<a href=3D"https://www.raspberrypi.org/forums/viewtopic.php?f=3D63&a=
mp;t=3D232323#p1797605" rel=3D"noreferrer" target=3D"_blank">https://www.ra=
spberrypi.org/forums/viewtopic.php?f=3D63&amp;t=3D232323#p1797605</a><br>
&gt; <br>
&gt; I got so far that GPU drivers are loaded (v3d &amp; vc4) without error=
s. But now Xen returns error=C2=A0when X is starting:<br>
&gt; (XEN) traps.c:1986:d0v1 HSR=3D0x93880045 pc=3D0x00007f97b14e70 gva=3D0=
x7f7f817000 gpa=3D0x0000401315d000<br>
&gt; =C2=A0I tried to debug what causes this and looks like=C2=A0find_mmio_=
handler=C2=A0cannot find handler.<br>
&gt; (See more here: <a href=3D"https://www.raspberrypi.org/forums/viewtopi=
c.php?f=3D63&amp;t=3D232323&amp;start=3D25#p1801691" rel=3D"noreferrer" tar=
get=3D"_blank">https://www.raspberrypi.org/forums/viewtopic.php?f=3D63&amp;=
t=3D232323&amp;start=3D25#p1801691</a> )<br>
&gt; <br>
&gt; Any ideas why the handler is not found?<br>
<br>
<br>
Hi Jukka,<br>
<br>
I am glad to hear that you are interested in Xen on RaspberryPi :-)=C2=A0 I=
<br>
haven&#39;t tried the GPU yet, I have been using the serial only.<br>
Roman, did you ever get the GPU working?<br>
<br>
<br>
The error is a data abort error: Linux is trying to access an address<br>
which is not mapped to dom0. The address seems to be 0x401315d000. It is<br=
>
a pretty high address; I looked in device tree but couldn&#39;t spot it.<br=
>
<br>
From the HSR (the syndrom register) it looks like it is a translation<br>
fault at EL1 on stage1. As if the Linux address mapping was wrong.<br>
Anyone has any ideas how this could happen? Maybe a reserved-memory<br>
misconfiguration?<br></blockquote><div>I had issues=C2=A0with loading the d=
river in the first place. Apparently swiotlb is used, maybe it=C2=A0can cau=
se this. I also tried to enable CMA.</div><div>config.txt:</div><div>dtover=
lay=3Dvc4-fkms-v3d,cma=3D320M@0x0-0x40000000<br>gpu_mem=3D128<br></div><div=
><br></div><div>That memory=C2=A0is very high. Success full address is for =
example this:=C2=A00xff841f00</div><div>(XEN) GICv2 initialization:<br>(XEN=
) =C2=A0 =C2=A0 =C2=A0 =C2=A0 gic_dist_addr=3D00000000ff841000<br>(XEN) =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gic_cpu_addr=3D00000000ff842000<br>(XEN) =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 gic_hyp_addr=3D00000000ff844000<br>(XEN) =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 gic_vcpu_addr=3D00000000ff846000<br>(XEN) =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 gic_maintenance_irq=3D25<br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
&gt; p.s.<br>
&gt; While testing I found issue with Xen master branch and your patch:=C2=
=A0xen/rpi4: implement watchdog-based reset<br>
&gt; <br>
&gt; Looks like black listing the=C2=A0bcm2835-pm<br>
&gt; @@ -37,12 +41,69 @@ static const struct dt_device_match rpi4_blacklist=
_dev[] __initconst =3D<br>
&gt; =C2=A0 =C2=A0 =C2=A0 * The aux peripheral also shares a page with the =
aux UART.<br>
&gt; =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; =C2=A0 =C2=A0 =C2=A0DT_MATCH_COMPATIBLE(&quot;brcm,bcm2835-aux&quot;),=
<br>
&gt; + =C2=A0 =C2=A0/* Special device used for rebooting */<br>
&gt; + =C2=A0 =C2=A0DT_MATCH_COMPATIBLE(&quot;brcm,bcm2835-pm&quot;),<br>
&gt; <br>
&gt; will prevent v3d driver to locate phandle. I think it will use the sam=
e resource:<br>
&gt; =C2=A0 pm: watchdog@7e100000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;brcm,bcm2835-pm&quot;, =
&quot;brcm,bcm2835-pm-wdt&quot;;<br>
&gt; #power-domain-cells =3D &lt;1&gt;;<br>
&gt; #reset-cells =3D &lt;1&gt;;<br>
&gt; reg =3D &lt;0x7e100000 0x114&gt;,<br>
&gt; =C2=A0 =C2=A0 =C2=A0&lt;0x7e00a000 0x24&gt;,<br>
&gt; =C2=A0 =C2=A0 =C2=A0&lt;0x7ec11000 0x20&gt;;<br>
&gt; clocks =3D &lt;&amp;clocks BCM2835_CLOCK_V3D&gt;,<br>
&gt; &lt;&amp;clocks BCM2835_CLOCK_PERI_IMAGE&gt;,<br>
&gt; &lt;&amp;clocks BCM2835_CLOCK_H264&gt;,<br>
&gt; &lt;&amp;clocks BCM2835_CLOCK_ISP&gt;;<br>
&gt; clock-names =3D &quot;v3d&quot;, &quot;peri_image&quot;, &quot;h264&qu=
ot;, &quot;isp&quot;;<br>
&gt; system-power-controller;<br>
&gt; <br>
&gt; };<br>
<br>
Yeah, I imagine it could be possible. Can you post the error message you<br=
>
are seeing from the v3d driver?</blockquote></div><div>This is the error:</=
div>[ =C2=A0 =C2=A00.069682] OF: /v3dbus/v3d@7ec04000: could not find phand=
le<br>[ =C2=A0 =C2=A00.074828] OF: /v3dbus/v3d@7ec04000: could not find pha=
ndle<br clear=3D"all"><div>v3d driver is not loaded.</div><div><br></div>--=
 <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Br,</=
div><div>Jukka Kaartinen</div></div></div></div>

--000000000000c009f305b9922114--

