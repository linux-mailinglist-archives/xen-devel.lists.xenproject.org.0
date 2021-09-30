Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A5541D224
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 06:19:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199364.353372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVnVo-0000YT-S1; Thu, 30 Sep 2021 04:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199364.353372; Thu, 30 Sep 2021 04:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVnVo-0000Uy-Nz; Thu, 30 Sep 2021 04:17:36 +0000
Received: by outflank-mailman (input) for mailman id 199364;
 Thu, 30 Sep 2021 04:17:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9gkK=OU=gmail.com=ysaikiran1997@srs-us1.protection.inumbo.net>)
 id 1mVnVn-0000Us-Pq
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 04:17:35 +0000
Received: from mail-yb1-xb2f.google.com (unknown [2607:f8b0:4864:20::b2f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72d1f738-06bb-40e6-b7ee-dba019ffd8d8;
 Thu, 30 Sep 2021 04:17:34 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id z5so10268765ybj.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Sep 2021 21:17:34 -0700 (PDT)
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
X-Inumbo-ID: 72d1f738-06bb-40e6-b7ee-dba019ffd8d8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o+zO69n1HhJGeraWaQe/BVUQnuHDbkPftPnw1VZX1PM=;
        b=fYxdCLSWVrvhT+KbMsxuT084xUJrK+di03FXzjvlg+xyF57tXiXmCR0OHovFCTNY/e
         9yOri9Q2LU+j0dSxdvsa8uv91n+jbIv0Po4LKlKqP8cRBZ/Z93QlLUb2603NeDhZj75r
         CwcU8gt/HdeTEF4FxHE1Ci7fzB1LbzqNnVSvwYpRUYWZvwPXwLrKZe2MgWkRjr5kEdQb
         xlPpxDVsoZaBFD4nJLD8LsinmirBweH5gLjhr/8uKm4NEkJci9ujpCYVqei7al0UFh9N
         LUzOqh78zrfwWA+hFerCOLsPVvdO5e5dqPQXxoszKkIyw6OIvibIQXkZdQApg3ZiwFFL
         bXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o+zO69n1HhJGeraWaQe/BVUQnuHDbkPftPnw1VZX1PM=;
        b=ZMgmzCQklgwZCcAFiS+aF/14KQ3j/GtYJtSEaBWxbDi6JQapNS3hN/4RiU5Dr85xtw
         mr+UawyAUeQCU7S7MPDXgdGanQaCQBUDeltkxfHVcMx+aCtXKL56MtO3OmB+5bZUGqCH
         ESRka7KgzZQIAy4Fqo8l0g6liLsA8pzyDgdy/SLxXoZ8DR4XZ3O0NEt2EmX5Xc0S64AV
         nKFf9XFcR6gri+GF4F1xD7j04yd5WRYVgrp7flVDuWz8fHfRBb6zP2aNpYVD6JzC/xFJ
         O5xEDieRnEMBo60Sc7PSh3MihQPoos6pnmrzZLMtbx9kVnCmulC4O5f7OdcXO/KnMHlW
         qMHw==
X-Gm-Message-State: AOAM533AmzJPUSwEzs0WlVQMkz2XqYJ7G6PgCFGg6NIOcch/ZZfKsSaD
	eMMXJnDSYJ2TC2QqaMJ+BoiurDVikwPMfPLOb0E=
X-Google-Smtp-Source: ABdhPJwPYswQekdO7vENLu+Xeo7PR6ILqsOzLfhbBqtLKIdjTT4utPzdoBr+/yQ360L1zXTWEJ5kKiKbZIvRdm8SJhc=
X-Received: by 2002:a25:ce51:: with SMTP id x78mr4457151ybe.138.1632975453694;
 Wed, 29 Sep 2021 21:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <33C29853-D896-4E4E-91D3-4D2FA89A9B91@hxcore.ol>
 <eb5fd47b-6bc9-2eec-7f46-9ab9a42c9f1f@xen.org> <CAEsO4uzsCnsTtTmYHAT4NN6=girCY2NHHdAHbH6GG33D7jwe_A@mail.gmail.com>
 <alpine.DEB.2.21.2109131437030.10523@sstabellini-ThinkPad-T480s>
 <CAEsO4uwpiDO2QoqLRTOxpsYM9YSPAsbX0P=gagdEy21pk1VsPQ@mail.gmail.com> <alpine.DEB.2.21.2109141825330.21985@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109141825330.21985@sstabellini-ThinkPad-T480s>
From: Sai Kiran Kumar Reddy Y <ysaikiran1997@gmail.com>
Date: Thu, 30 Sep 2021 09:47:22 +0530
Message-ID: <CAEsO4uyjNs97Cx8n2owDk4kKTVCycji377pm7aXHcPWzeszUTw@mail.gmail.com>
Subject: Re: Xen Booting Problem on ARM Machine
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	xen-devel@lists.xenproject.org, kannan@cimware.in
Content-Type: multipart/alternative; boundary="000000000000d82f9a05cd2eb9cc"

--000000000000d82f9a05cd2eb9cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry about the delay. We have been trying to access the serial of the
machine. Tried with couple of JTAG connectors. There's still no debug
messages on the serial. Is there any other way of figuring this out?

On Wed, Sep 15, 2021, 7:02 AM Stefano Stabellini <sstabellini@kernel.org>
wrote:

> Something is off. When you enabled earlyprintk in Xen, you should see
> something like this at boot time:
> https://marc.info/?l=3Dxen-devel&m=3D158829968025334
>
> All the Xen logs starting with "(XEN)" on the serial. Do you have access
> to the serial of the machine? Without it, it is going to be hard to
> debug.
>
>
> On Tue, 14 Sep 2021, Sai Kiran Kumar Reddy Y wrote:
> > In the folder "/var/log", there's a file called "xen", which is empty.
> As far as the boot logs are concerned, I don't see any debug
> > messages related to xen. I am attaching the log files, "kern.txt" and
> "boot.txt"
> >
> > On Tue, Sep 14, 2021 at 3:08 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >       On Mon, 13 Sep 2021, Sai Kiran Kumar Reddy Y wrote:
> >       > On Fri, Sep 10, 2021 at 7:30 PM Julien Grall <julien@xen.org>
> wrote:
> >       >
> >       >
> >       >       On 08/09/2021 11:43, Sai Kiran wrote:
> >       >       > Hello,
> >       >
> >       >       Hi,
> >       >
> >       >       Thank you for the report. Moving the discussion back to
> xen-devel
> >       >       because this looks like a potential issue in the UEFI stu=
b
> in Xen.
> >       >
> >       >       > I have Xen-4.15.0 on an ARM Machine, with Debian 11
> installed on it.
> >       >
> >       >       Would you be able to give more details on the Arm machine
> you are using?
> >       >       Also, are you using ACPI or DT to boot?
> >       >
> >       >
> >       >    Sai >> DT . ACPI configuration is disabled in Boot settings
>
> >       >
> >       >       >  I
> >       >       > am able to do =E2=80=9Cmake world=E2=80=9D and =E2=80=
=9Cmake install=E2=80=9D, after
> =E2=80=9C./configure=E2=80=9D, as
> >       >       > specified in README file. When I reboot the system, I
> get the following
> >       >       > message:
> >       >       >
> >       >       > Warning: All 128 bootinfo mem banks exhausted.
> >       >       >
> >       >       > Warning: All 128 bootinfo mem banks exhausted.
> >       >
> >       >       Hmmm... This means that you have more than 128 memory
> regions described
> >       >       in the EFI memory map. That's quite a lot.
> >       >
> >       >       Although, this should be harmless as it means Xen will no=
t
> use the extra
> >       >       memory banks.
> >       >
> >       >       >
> >       >       > Cannot exit boot services: ErrCode: 0x8000000000000002
> >       >
> >       >       This means EFI_INVALID_PARAMETER. We have code to retry
> because AFAICT
> >       >       ExitBootServices() may sometime fails (I have CCed Jan ma=
y
> have more
> >       >       idea what's happening).
> >       >
> >       >       Would you be able to provide more details on the UEFI
> firmware you are
> >       >       using? Is it EDK2 or U-boot?
> >       >
> >       > Sai >>  EDK2
> >       >       Also, do you know if Linux is boot on the same system?
> >       >
> >       > Sai >> Yes
> >       >       However, AFAICT, the error message would not prevent Xen
> to continue
> >       >       booting. So you may get stuck later in the boot process.
> >       >
> >       >       My suggestion would be to enable earlyprintk for your
> platform. You can
> >       >       setup it up from the menuconfig in "Debugging Options".
> >       >
> >       > Sai >> Yes, I have enabled earlyprintk.
> >       > I tried changing NR_MEM_BANKS(in xen/include/asm-arm/setup.h)
> value to 256, from 128. The error message is no longer seen,
> >       but the device
> >       > is stuck in the boot process.
> >
> >       Could you please post the boot logs now that you enabled
> earlyprintk?
> >       Ideally not a camera picture but a textual copy/paste from the
> target
> >       serial?
> >
> >       Earlyprintk is pretty verbose, we should be able to figure out
> where it
> >       gets stuck.
> >
> >
> >

--000000000000d82f9a05cd2eb9cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">Sorry ab=
out the delay. We have been trying to access the serial of the machine. Tri=
ed with couple of JTAG connectors. There&#39;s still no debug messages on t=
he serial. Is there any other way of figuring this out?</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 15=
, 2021, 7:02 AM Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel=
.org">sstabellini@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">Something is off. When you enabled earlyprintk in Xen, you should =
see<br>
something like this at boot time:<br>
<a href=3D"https://marc.info/?l=3Dxen-devel&amp;m=3D158829968025334" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://marc.info/?l=3Dxen-devel&=
amp;m=3D158829968025334</a><br>
<br>
All the Xen logs starting with &quot;(XEN)&quot; on the serial. Do you have=
 access<br>
to the serial of the machine? Without it, it is going to be hard to<br>
debug.<br>
<br>
<br>
On Tue, 14 Sep 2021, Sai Kiran Kumar Reddy Y wrote:<br>
&gt; In the folder &quot;/var/log&quot;, there&#39;s a file called &quot;xe=
n&quot;, which is empty. As far as the boot logs are=C2=A0concerned, I don&=
#39;t see any debug<br>
&gt; messages related to xen. I am attaching the log files, &quot;kern.txt&=
quot; and &quot;boot.txt&quot;<br>
&gt; <br>
&gt; On Tue, Sep 14, 2021 at 3:08 AM Stefano Stabellini &lt;<a href=3D"mail=
to:sstabellini@kernel.org" target=3D"_blank" rel=3D"noreferrer">sstabellini=
@kernel.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, 13 Sep 2021, Sai Kiran Kumar Reddy Y=
 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Fri, Sep 10, 2021 at 7:30 PM Julien =
Grall &lt;<a href=3D"mailto:julien@xen.org" target=3D"_blank" rel=3D"norefe=
rrer">julien@xen.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On 08/09/2021=
 11:43, Sai Kiran wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hello,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Thank you for=
 the report. Moving the discussion back to xen-devel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0because this =
looks like a potential issue in the UEFI stub in Xen.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I have X=
en-4.15.0 on an ARM Machine, with Debian 11 installed on it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Would you be =
able to give more details on the Arm machine you are using?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Also, are you=
 using ACPI or DT to boot?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0Sai &gt;&gt; DT . ACPI con=
figuration is disabled in Boot settings=C2=A0 =C2=A0=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 I<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; am able =
to do =E2=80=9Cmake world=E2=80=9D and =E2=80=9Cmake install=E2=80=9D, afte=
r =E2=80=9C./configure=E2=80=9D, as<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; specifie=
d in README file. When I reboot the system, I get the following<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; message:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Warning:=
 All 128 bootinfo mem banks exhausted.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Warning:=
 All 128 bootinfo mem banks exhausted.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hmmm... This =
means that you have more than 128 memory regions described<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0in the EFI me=
mory map. That&#39;s quite a lot.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Although, thi=
s should be harmless as it means Xen will not use the extra<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memory banks.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Cannot e=
xit boot services: ErrCode: 0x8000000000000002<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This means EF=
I_INVALID_PARAMETER. We have code to retry because AFAICT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ExitBootServi=
ces() may sometime fails (I have CCed Jan may have more<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0idea what&#39=
;s happening).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Would you be =
able to provide more details on the UEFI firmware you are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0using? Is it =
EDK2 or U-boot?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Sai &gt;&gt;=C2=A0 EDK2=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Also, do you =
know if Linux is boot on the same system?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Sai &gt;&gt; Yes=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0However, AFAI=
CT, the error message would not prevent Xen to continue<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0booting. So y=
ou may get stuck later in the boot process.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0My suggestion=
 would be to enable earlyprintk for your platform. You can<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0setup it up f=
rom the menuconfig in &quot;Debugging Options&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Sai &gt;&gt; Yes, I have enabled earlyp=
rintk.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I tried changing NR_MEM_BANKS(in xen/in=
clude/asm-arm/setup.h) value to 256, from 128. The error message is no long=
er seen,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0but the device<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; is stuck in the boot process.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Could you please post the boot logs now that=
 you enabled earlyprintk?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Ideally not a camera picture but a textual c=
opy/paste from the target<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0serial?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Earlyprintk is pretty verbose, we should be =
able to figure out where it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gets stuck.<br>
&gt; <br>
&gt; <br>
&gt; </blockquote></div>

--000000000000d82f9a05cd2eb9cc--

