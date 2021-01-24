Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B945301D78
	for <lists+xen-devel@lfdr.de>; Sun, 24 Jan 2021 17:24:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73770.132707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3iAl-0002id-Cj; Sun, 24 Jan 2021 16:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73770.132707; Sun, 24 Jan 2021 16:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3iAl-0002iE-9V; Sun, 24 Jan 2021 16:23:31 +0000
Received: by outflank-mailman (input) for mailman id 73770;
 Sun, 24 Jan 2021 16:23:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sOcY=G3=unikie.com=jukka.kaartinen@srs-us1.protection.inumbo.net>)
 id 1l3iAj-0002i9-VX
 for xen-devel@lists.xenproject.org; Sun, 24 Jan 2021 16:23:30 +0000
Received: from mail-lj1-x236.google.com (unknown [2a00:1450:4864:20::236])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1caaa90b-97f2-4149-8b3a-98067e0ea29e;
 Sun, 24 Jan 2021 16:23:28 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id x23so12312832lji.7
 for <xen-devel@lists.xenproject.org>; Sun, 24 Jan 2021 08:23:28 -0800 (PST)
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
X-Inumbo-ID: 1caaa90b-97f2-4149-8b3a-98067e0ea29e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TarkN/ptFE68BdfwoE/1aVB8dXJhagmP0qB5zQ1hupc=;
        b=UJRPKHb7yQ3qYswaWFHIxe/qHJGcg5vv1A/S3bQ3wjTQvZf1y5brU330f2XCXAUFoZ
         Tc2HRluKItqa+PHe6KbIxNTnW4wXH8a2lU2mu7mJBjJdyXrkyVtAADhxrkv4FCzbeD+U
         wVOM0Azmi7/1LMU4vSd1LtPXC07e5SnUfniLSGBGYgppqG724vO8pWM1Sbuuh4Eh9tGo
         I1U/c7Fe0kEk/9AlGT/BapniyXNSA1J5SdNpHwhU4iiwU0pX84dBjaMxN+oGIXpby950
         rdOK17hly84arZDjo7ViLmt+xmTr4nxnlALGU+kZ04Uu9AiLCaNbFTXkUKX4tuC9/WhZ
         kRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TarkN/ptFE68BdfwoE/1aVB8dXJhagmP0qB5zQ1hupc=;
        b=bXrzZT/vdaWkX/sN+rZJLMvnttuucvfPXIiIrxs9M2jDJC9tiY2IPRCAA4AVcTPyD6
         x8bVR99IHmgEREHduZsQ4kEwTzLRDaOPQvIxwhimcw+rtOpFmSeWoHPebksHC6JuimKO
         HXneAm35mZLKb49esc8cjUSb64DjQrHxujzoYDnqg6jt3JSdstQJ3JpudTMPneS+J7tQ
         5Pf2ueNHIbcqZ5Y+MQ1uNha3w33t6D+6IOOIzbguC3twOrZ/XTLQvLLmSQnC4eylAo8+
         9dDq1y0vLDqjyEfoWyF73ZkHFoGf3EUWDclTecwGUE8Fsl0jvfRbZc661wDEwJH+5yby
         sm7g==
X-Gm-Message-State: AOAM533cK/eerizZa1TBMo0HAvNEs1Xi/XXMyID/WdILFg9T1+lAjh3s
	TAwPwGN2ZoR6/+TFGlqtSnpo4DeRLFrptWANaTgvBg==
X-Google-Smtp-Source: ABdhPJzDjEyV5r0UJlZcIOllvJYX/14Dh9Bgu9kcEs8JBIYaIK8eR+YCgMay+Pt8a8rg05UvrpWnUVHNXq8tZXFTR4E=
X-Received: by 2002:a2e:81d1:: with SMTP id s17mr1263605ljg.49.1611505407047;
 Sun, 24 Jan 2021 08:23:27 -0800 (PST)
MIME-Version: 1.0
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com>
 <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s> <CAJ=z9a1_CbOSB_WcQGsLJ9JmkJ3AcLm2s-AirVJkFoKRxy-5Ug@mail.gmail.com>
In-Reply-To: <CAJ=z9a1_CbOSB_WcQGsLJ9JmkJ3AcLm2s-AirVJkFoKRxy-5Ug@mail.gmail.com>
From: Jukka Kaartinen <jukka.kaartinen@unikie.com>
Date: Sun, 24 Jan 2021 18:23:16 +0200
Message-ID: <CAFnJQOpVsnhgOMwm6pEWrUpUW7wniw5S_EChhW_U7yZvK3Cqyg@mail.gmail.com>
Subject: Re: Question about xen and Rasp 4B
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	Roman Shaposhnik <roman@zededa.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: multipart/alternative; boundary="000000000000574aa805b9a7d789"

--000000000000574aa805b9a7d789
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 23, 2021 at 6:48 PM Julien Grall <julien.grall.oss@gmail.com>
wrote:

> On Sat, 23 Jan 2021 at 00:27, Stefano Stabellini <sstabellini@kernel.org>
> wrote:
> >
> > + xen-devel, Roman,
> >
> >
> > On Fri, 22 Jan 2021, Jukka Kaartinen wrote:
> > > Hi Stefano,
> > > I'm Jukka Kaartinen a SW developer working on enabling hypervisors on
> mobile platforms. One of our HW that we use on development is
> > > Raspberry Pi 4B. I wonder if you could help me a bit :).
> > >
> > > I'm trying to enable the GPU with Xen + Raspberry Pi for dom0.
> https://www.raspberrypi.org/forums/viewtopic.php?f=3D63&t=3D232323#p17976=
05
> > >
> > > I got so far that GPU drivers are loaded (v3d & vc4) without errors.
> But now Xen returns error when X is starting:
> > > (XEN) traps.c:1986:d0v1 HSR=3D0x93880045 pc=3D0x00007f97b14e70
> gva=3D0x7f7f817000 gpa=3D0x0000401315d000
> > >  I tried to debug what causes this and looks like find_mmio_handler
> cannot find handler.
> > > (See more here:
> https://www.raspberrypi.org/forums/viewtopic.php?f=3D63&t=3D232323&start=
=3D25#p1801691
> )
> > >
> > > Any ideas why the handler is not found?
> >
> >
> > Hi Jukka,
> >
> > I am glad to hear that you are interested in Xen on RaspberryPi :-)  I
> > haven't tried the GPU yet, I have been using the serial only.
> > Roman, did you ever get the GPU working?
> >
> >
> > The error is a data abort error: Linux is trying to access an address
> > which is not mapped to dom0. The address seems to be 0x401315d000. It i=
s
> > a pretty high address; I looked in device tree but couldn't spot it.
> >
> > From the HSR (the syndrom register) it looks like it is a translation
> > fault at EL1 on stage1.
>
> Hmmm.... We don't trap stage 1 faults to Xen, instead they are
> received by the OS directly.
>
> In fact the ESR_El1, indicates that it is a translation fault at level
> 1 when walking the stage-2 page-table. So it means the guest physical
> address is not mapped in the P2M. But...
>
>
> > As if the Linux address mapping was wrong.
>
> ... I think the GPA is bogus. So I agree Linux may have configured the
> stage-1 page-tables incorrectly.
>
> >
> > Anyone has any ideas how this could happen? Maybe a reserved-memory
> > misconfiguration?
>
> It looks like to me both the PC and the GVA points to user memory.
> Normally, Xen will inject a data abort into Linux and will usually
> dump some information (e.g. the task running).
>
I observed that when xen outputs this:
(XEN) traps.c:1983:d0v1 HSR=3D0x93830045 pc=3D0x00007fa9df9684 gva=3D0x7faa=
26b000
gpa=3D0x0000401207f000
vc4_bo_create is called with this size:
[   44.449287]  vc4_bo_create size: 4096



> @Jukka, would it be possible to provide the console out for both Xen and
> Linux?
>
Here are the logs:
https://drive.google.com/drive/folders/1fhcwpsf6SfPYrk0QR6zexGia0v1XysUr?us=
p=3Dsharing

I hope you can access them.

Would you also be able to confirm if the same setup is working when
> Linux is running directly on the HW? This would give us an idea
> whether the issue is specific to Xen.
>
Yes, the same setup works when running directly on the HW. I even boot the
linux using u-boot and the same device tree.

There is one change that bothers me and that is the swiotlb size. I had to
increase its size:
 20  * Maximum allowable number of contiguous slabs to map,
 21  * must be a power of 2.  What is the appropriate value ?
 22  * The complexity of {map,unmap}_single is linearly dependent on this
value.
 23  */
 24 //#define IO_TLB_SEGSIZE=E2=96=B8=E2=96=B8=E2=96=B8=E2=96=B8=E2=96=B8=
=E2=96=B8=E2=96=B8=E2=96=B8128
 25 #define IO_TLB_SEGSIZE=E2=96=B8=E2=96=B84096
without this change I get this error:
[   79.444987] v3d fec00000.v3d: swiotlb buffer is full (sz: 8294400
bytes), total 32768 (slots), used 1 (slots)


--=20
Br,
Jukka Kaartinen

--000000000000574aa805b9a7d789
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 23, 2021 at 6:48 PM Julie=
n Grall &lt;<a href=3D"mailto:julien.grall.oss@gmail.com">julien.grall.oss@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Sat, 23 Jan 2021 at 00:27, Stefano Stabellini &lt;<a href=3D"=
mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>=
&gt; wrote:<br>
&gt;<br>
&gt; + xen-devel, Roman,<br>
&gt;<br>
&gt;<br>
&gt; On Fri, 22 Jan 2021, Jukka Kaartinen wrote:<br>
&gt; &gt; Hi Stefano,<br>
&gt; &gt; I&#39;m Jukka Kaartinen a SW developer working on enabling hyperv=
isors on mobile platforms. One of our HW that we use on development is<br>
&gt; &gt; Raspberry Pi 4B. I wonder if you could help me a bit :).<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m trying to enable the GPU with Xen + Raspberry Pi for dom0=
. <a href=3D"https://www.raspberrypi.org/forums/viewtopic.php?f=3D63&amp;t=
=3D232323#p1797605" rel=3D"noreferrer" target=3D"_blank">https://www.raspbe=
rrypi.org/forums/viewtopic.php?f=3D63&amp;t=3D232323#p1797605</a><br>
&gt; &gt;<br>
&gt; &gt; I got so far that GPU drivers are loaded (v3d &amp; vc4) without =
errors. But now Xen returns error when X is starting:<br>
&gt; &gt; (XEN) traps.c:1986:d0v1 HSR=3D0x93880045 pc=3D0x00007f97b14e70 gv=
a=3D0x7f7f817000 gpa=3D0x0000401315d000<br>
&gt; &gt;=C2=A0 I tried to debug what causes this and looks like find_mmio_=
handler cannot find handler.<br>
&gt; &gt; (See more here: <a href=3D"https://www.raspberrypi.org/forums/vie=
wtopic.php?f=3D63&amp;t=3D232323&amp;start=3D25#p1801691" rel=3D"noreferrer=
" target=3D"_blank">https://www.raspberrypi.org/forums/viewtopic.php?f=3D63=
&amp;t=3D232323&amp;start=3D25#p1801691</a> )<br>
&gt; &gt;<br>
&gt; &gt; Any ideas why the handler is not found?<br>
&gt;<br>
&gt;<br>
&gt; Hi Jukka,<br>
&gt;<br>
&gt; I am glad to hear that you are interested in Xen on RaspberryPi :-)=C2=
=A0 I<br>
&gt; haven&#39;t tried the GPU yet, I have been using the serial only.<br>
&gt; Roman, did you ever get the GPU working?<br>
&gt;<br>
&gt;<br>
&gt; The error is a data abort error: Linux is trying to access an address<=
br>
&gt; which is not mapped to dom0. The address seems to be 0x401315d000. It =
is<br>
&gt; a pretty high address; I looked in device tree but couldn&#39;t spot i=
t.<br>
&gt;<br>
&gt; From the HSR (the syndrom register) it looks like it is a translation<=
br>
&gt; fault at EL1 on stage1.<br>
<br>
Hmmm.... We don&#39;t trap stage 1 faults to Xen, instead they are<br>
received by the OS directly.<br>
<br>
In fact the ESR_El1, indicates that it is a translation fault at level<br>
1 when walking the stage-2 page-table. So it means the guest physical<br>
address is not mapped in the P2M. But...<br>
<br>
<br>
&gt; As if the Linux address mapping was wrong.<br>
<br>
... I think the GPA is bogus. So I agree Linux may have configured the<br>
stage-1 page-tables incorrectly.<br>
<br>
&gt;<br>
&gt; Anyone has any ideas how this could happen? Maybe a reserved-memory<br=
>
&gt; misconfiguration?<br>
<br>
It looks like to me both the PC and the GVA points to user memory.<br>
Normally, Xen will inject a data abort into Linux and will usually<br>
dump some information (e.g. the task running).<br></blockquote><div>I obser=
ved that when xen outputs this:</div><div>(XEN) traps.c:1983:d0v1 HSR=3D0x9=
3830045 pc=3D0x00007fa9df9684 gva=3D0x7faa26b000 gpa=3D0x0000401207f000<br>=
</div><div>vc4_bo_create is called with this size:<br></div><div>[ =C2=A0 4=
4.449287]=C2=A0 vc4_bo_create size: 4096<br></div><div>=C2=A0</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
@Jukka, would it be possible to provide the console out for both Xen and Li=
nux?<br></blockquote><div class=3D"gmail_quote"><div>Here are the logs:</di=
v></div><div><a href=3D"https://drive.google.com/drive/folders/1fhcwpsf6SfP=
Yrk0QR6zexGia0v1XysUr?usp=3Dsharing">https://drive.google.com/drive/folders=
/1fhcwpsf6SfPYrk0QR6zexGia0v1XysUr?usp=3Dsharing</a>=C2=A0</div><div>I hope=
 you can access them.=C2=A0</div><div><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
Would you also be able to confirm if the same setup is working when<br>
Linux is running directly on the HW? This would give us an idea<br>
whether the issue is specific to Xen.<br></blockquote><div>Yes, the same se=
tup works when running directly on the HW. I even boot the linux using u-bo=
ot and the same device tree.</div><div><br></div><div>There is one change t=
hat bothers me and that is the swiotlb size. I had to increase its size:</d=
iv><div>=C2=A020 =C2=A0* Maximum allowable number of contiguous slabs to ma=
p,<br>=C2=A021 =C2=A0* must be a power of 2.=C2=A0 What is the appropriate =
value ?<br>=C2=A022 =C2=A0* The complexity of {map,unmap}_single is linearl=
y dependent on this value.<br>=C2=A023 =C2=A0*/<br>=C2=A024 //#define IO_TL=
B_SEGSIZE=E2=96=B8=E2=96=B8=E2=96=B8=E2=96=B8=E2=96=B8=E2=96=B8=E2=96=B8=E2=
=96=B8128<br>=C2=A025 #define IO_TLB_SEGSIZE=E2=96=B8=E2=96=B84096<br></div=
><div>without this change I get this error:</div><div>[ =C2=A0 79.444987] v=
3d fec00000.v3d: swiotlb buffer is full (sz: 8294400 bytes), total 32768 (s=
lots), used 1 (slots)<br></div><div></div></div><br clear=3D"all"><div><br>=
</div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><d=
iv>Br,</div><div>Jukka Kaartinen</div></div></div></div>

--000000000000574aa805b9a7d789--

