Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F471EA6C6
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 17:21:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfmFp-0003BL-9x; Mon, 01 Jun 2020 15:21:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSYU=7O=gmail.com=codewiz2280@srs-us1.protection.inumbo.net>)
 id 1jfmFn-0003BG-H5
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 15:21:31 +0000
X-Inumbo-ID: 919f3c1e-a41b-11ea-9947-bc764e2007e4
Received: from mail-wm1-x32c.google.com (unknown [2a00:1450:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 919f3c1e-a41b-11ea-9947-bc764e2007e4;
 Mon, 01 Jun 2020 15:21:30 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id f185so11778501wmf.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 08:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eEI0Z2ltjlEuzeKpCquZANxjoiXQ28qny9Vq/1zpwek=;
 b=luxm+kMHLNzW4UMsm7xZZ8Za1hmjW7ITKHzoFQTBrVVfuu7cCT+J4XzW7JrTMX6bZf
 aPsV52VI21L30Fyw7iOgdA8AXuoJqcbxGXspbXuSL1DozbDPFh5abGWERH0TLWfbYUlI
 mgFjcjXohXEyMOhPqTGh06w/KOhCFpF2OeHlgdjby8lExOC6uMZ0hK2dV/PRCSx1hylO
 n3XFFOke/ie1PJ3AfFD6596EjeNGn0T+SM8950lRIfHL6KjCCrvNC7Nhn7T8Odd12Kvy
 VwnpiE04D34QpNIPg8KzGN2cCEzBUbm7XlXaCj0tzohnuy8BBRHxASqo3KGLv26UfJZV
 vLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eEI0Z2ltjlEuzeKpCquZANxjoiXQ28qny9Vq/1zpwek=;
 b=ZGZsCfIvdoq1geUdL67KC+XiDJuD5Bj7BqhwST1aAmN6t9GWrl+GShIjcZklULTxZf
 jrfdpyV0FGHR24N68DYTOiL2EEkl7mNHyDy3pnn8QVoXvh8k76BeXJDfTWD5/4hnkf8s
 sU2EQRgyb1OGCOxyzrwkiWzb07keuOSuaHcHXTW97DG46Q6/dgIreRyK9D9daVMIXO5O
 0/bcUu66q9Y6ASJtP8GWOyv029SzPbGnLvLqz5fQwgpLt1Wh8K2S9sZf9AVz6dUuAPRq
 Wz4H8pp1quRFapaX5wsVxXEAz/+mdR2azGtb+PsDiLICPz6td1cZjYGvEaMpxR4IsXxd
 8tlw==
X-Gm-Message-State: AOAM532WhRqfVFYYo28xGhRHoWVZ9Kf1IZd8lTc7wZOO+Yg+THWNp4Xc
 OWPgMsqUzKnAm4xJxN+d2+dBXw1AyFfg6f5xxe40258ZNOM=
X-Google-Smtp-Source: ABdhPJwqzcjBqvzUWw7ejJF1jpZfyVz9jSGQ0FArAOImK0f4qo90k/K6HVpxrG/Vp+UYxwy6Ntdy7ikDiWY6omHky3Q=
X-Received: by 2002:a1c:e903:: with SMTP id q3mr21054474wmc.76.1591024889923; 
 Mon, 01 Jun 2020 08:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <fce2434d-9a0c-50ef-46b6-5858ede00bc4@xen.org>
In-Reply-To: <fce2434d-9a0c-50ef-46b6-5858ede00bc4@xen.org>
From: CodeWiz2280 <codewiz2280@gmail.com>
Date: Mon, 1 Jun 2020 11:21:17 -0400
Message-ID: <CALYbLDgwjjF5C+CrVn5bYiGVEmocAhmTDKmdj8aAxzsfjcVs0g@mail.gmail.com>
Subject: Re: Keystone Issue
To: Julien Grall <julien@xen.org>
Content-Type: multipart/alternative; boundary="000000000000648c2a05a707595a"
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000648c2a05a707595a
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

Thank you for your response.  I will try and post a log for you.  I have
been switching back and forth between configurations and need to take a new
one.

The board has 4GB of memory. Uboot places the kernel/initramfs/dtb in the
0x8000_0000 region but then the kernel switches its code/data over to a
0x8_0000_0000 range via the pv-fixup-asm.S assembly code called from
early_paging_init in arch/arm/mm/mmu.c.  That code is exclusive to the
keystone in the 4.19 kernel when "CONFIG_ARM_PV_FIXUP" and "ARM_LPAE" are
enabled in the kernel .  The upper 2GB of memory is above 0xFFFF_FFFF so
LPAE is required.

/proc/iomem looks like this without running xen after the switch and the
kernel boots:

80000000 - 9fffffff : System RAM (boot alias)
c8000000 - ffffffff : System RAM (boot alias)
800000000 - 1fffffff : System RAM
    800008000-800dfffff : Kernel Code
    801000000-80108ab3f : Kernel data
848000000-8ffffffff : System RAM

I was able to duplicate this issue with a build of your latest "master"
repository from this morning.

On Mon, Jun 1, 2020 at 9:29 AM Julien Grall <julien@xen.org> wrote:

> Hello,
>
> I have a few questions in order to understand a bit more your problem.
>
> On 01/06/2020 13:38, CodeWiz2280 wrote:
> > Hello, I am using a Texas Instruments K2E Keystone Eval board with Linux
> > 4.19.59.  It has a 32-bit ARM Cortex A15 processor. There is keystone
> > specific code in the kernel in arch/arm/mm/pv-fixup-asm.s that executes
> > during early_paging_init for LPAE support.  This causes the kernel to
> > switch its running 32-bit address space to a 36-bit address space and
> > the hypervisor traps repeatedly and stops it from booting.
>
> Without any log it is going to be difficult to help. Could you post the
> hypervisor log when debug is enabled?
>
> >  I suspect
> > this is because Xen only allowed for the original 32-bit memory range
> > specified by the dom0 device tree.
>
> How much RAM did you give to your Dom0?
>
> > The 36-bit LPAE address is a fixed
> > offset from the 32-bit address and is not physically different memory.
>
> I am not sure to understand this. Are you suggesting that the kernel is
> trying to relocate itself in a different part of the physical memory?
>
> Can you provide more details on the fixed offset?
>
> >
> > Can you suggest any way to get through this problem? I am using the
> > master branch of xen from earlier this year.
>
> Can you provide the exact baseline your are using? Did make any changes
> on top?
>
> > Any help is greatly
> > appreciated.
> Best regards,
>
> --
> Julien Grall
>

--000000000000648c2a05a707595a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Julien,</div><div><br></div><div>Thank you for you=
r response.=C2=A0 I will try and post a log for you.=C2=A0 I have been swit=
ching back and forth between configurations and need to take a new one.</di=
v><div><br></div><div>The board has 4GB of memory. Uboot places the kernel/=
initramfs/dtb in the 0x8000_0000 region but then the kernel switches its co=
de/data over to a 0x8_0000_0000 range via the pv-fixup-asm.S assembly code =
called from early_paging_init in arch/arm/mm/mmu.c.=C2=A0 That code is excl=
usive to the keystone in the 4.19 kernel when &quot;CONFIG_ARM_PV_FIXUP&quo=
t; and &quot;ARM_LPAE&quot; are enabled in the kernel .=C2=A0 The upper 2GB=
 of memory is above 0xFFFF_FFFF so LPAE is required.=C2=A0</div><div><br></=
div><div>/proc/iomem looks like this without running xen after the switch a=
nd the kernel boots:</div><div><br></div><div>80000000 - 9fffffff : System =
RAM (boot alias)</div><div>c8000000 - ffffffff : System RAM (boot alias)</d=
iv><div>800000000 - 1fffffff : System RAM</div><div>=C2=A0 =C2=A0 800008000=
-800dfffff : Kernel Code</div><div>=C2=A0 =C2=A0 801000000-80108ab3f : Kern=
el data</div><div>848000000-8ffffffff : System RAM</div><div><br></div><div=
>I was able to duplicate this issue with a build of your latest &quot;maste=
r&quot; repository from this morning.</div></div><br><div class=3D"gmail_qu=
ote"><div class=3D"gmail_attr" dir=3D"ltr">On Mon, Jun 1, 2020 at 9:29 AM J=
ulien Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-left-widt=
h:1px;border-left-style:solid">Hello,<br>
<br>
I have a few questions in order to understand a bit more your problem.<br>
<br>
On 01/06/2020 13:38, CodeWiz2280 wrote:<br>
&gt; Hello, I am using a Texas Instruments K2E Keystone Eval board with Lin=
ux <br>
&gt; 4.19.59.=C2=A0 It has a 32-bit ARM Cortex A15 processor. There is keys=
tone <br>
&gt; specific code in the kernel in arch/arm/mm/pv-fixup-asm.s that execute=
s <br>
&gt; during early_paging_init for LPAE support.=C2=A0 This causes the kerne=
l to <br>
&gt; switch its running 32-bit address space to a 36-bit address space and =
<br>
&gt; the hypervisor traps repeatedly and stops it from booting.<br>
<br>
Without any log it is going to be difficult to help. Could you post the <br=
>
hypervisor log when debug is enabled?<br>
<br>
&gt;=C2=A0 I suspect <br>
&gt; this is because Xen only allowed for the original 32-bit memory range =
<br>
&gt; specified by the dom0 device tree.<br>
<br>
How much RAM did you give to your Dom0?<br>
<br>
&gt; The 36-bit LPAE address is a fixed <br>
&gt; offset from the 32-bit address and is not physically different memory.=
<br>
<br>
I am not sure to understand this. Are you suggesting that the kernel is <br=
>
trying to relocate itself in a different part of the physical memory?<br>
<br>
Can you provide more details on the fixed offset?<br>
<br>
&gt;=C2=A0 <br>
&gt; Can you suggest any way to get through this problem? I am using the <b=
r>
&gt; master branch of xen from earlier this year.=C2=A0 <br>
<br>
Can you provide the exact baseline your are using? Did make any changes <br=
>
on top?<br>
<br>
&gt; Any help is greatly <br>
&gt; appreciated.<br>
Best regards,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div>

--000000000000648c2a05a707595a--

