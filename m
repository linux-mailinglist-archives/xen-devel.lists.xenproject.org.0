Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A6134E08B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 07:07:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103228.197155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lR6Zi-0003Gk-N3; Tue, 30 Mar 2021 05:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103228.197155; Tue, 30 Mar 2021 05:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lR6Zi-0003GR-I8; Tue, 30 Mar 2021 05:05:58 +0000
Received: by outflank-mailman (input) for mailman id 103228;
 Mon, 29 Mar 2021 18:47:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zVVk=I3=gmail.com=ttr9droid@srs-us1.protection.inumbo.net>)
 id 1lQwur-0007LR-SB
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 18:47:09 +0000
Received: from mail-oo1-xc32.google.com (unknown [2607:f8b0:4864:20::c32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a5256b5-a160-4ef5-bd29-0fd555bcfb87;
 Mon, 29 Mar 2021 18:47:08 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 q127-20020a4a33850000b02901b646aa81b1so3198110ooq.8
 for <xen-devel@lists.xenproject.org>; Mon, 29 Mar 2021 11:47:08 -0700 (PDT)
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
X-Inumbo-ID: 6a5256b5-a160-4ef5-bd29-0fd555bcfb87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3ocqKDylW1ZNXFNbmp0rk66cJmvs5eErDPFuhhnmcwI=;
        b=d0zq4ywnBUnaGqRda3SNcvgHibeebslUVJ0IXRSZtdUhAZtqMEOFdxdh5uHeEYB5QF
         7V7lTgKpwzldEGrw8jwo/l6n97P5vnlM90qmalKVPegrRmMwcujiz5jfTnnSu4es6JE+
         iYkdzk8evVYnfRHGMwcsK6Vv5PGK/Mhswpg6KjrlroXe++Ur92lQxd5Os7rINLUAGKof
         x4LPCoxQPCaBHnLukcraN1B80oYXwGZZ37PvuH3XaB4IKOh2Ncv6I9wQu7Ojhkzf3o5E
         AiR6ayD+0ccc44rekBSE/aMgTEonQ+0TPSZ2Uc1vMdF3S//kWRQZc2m4s+nqSaBZ73E+
         owXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3ocqKDylW1ZNXFNbmp0rk66cJmvs5eErDPFuhhnmcwI=;
        b=lxqZPzj+G12MdO3hJbEEqExVN3FEfFDStMg+Ye5M5GWvQ1rrnIEKRMV2dj1Ux4cgm5
         n5qrUiSI0DGVMgFrTV9dDqsrZPqSsvllwsLw4JI3Y9JS5Daya77HUB5/PVjkmzFQontk
         xNIs26wq4ruXEsWj4gtco5dZ8o4X5AkU09Pzn/idVe5/+FArHPLUgypUVlaYH8d2WFFn
         gdkwcwN+bwKAVliKlBZ0Jd6Ouer8HGvhLBgEmPPr61dGhwfevJek6Ug4Ds1hOoz4uA/W
         sN1b/UsoZ0HWHlPwhNiHc02aH4yKDCEkDJqgKX6GGxVHWjppYgeGDlgP//9vurVPKeRa
         l2rA==
X-Gm-Message-State: AOAM531ECBRk8cgdLJXIwjM9OlPTMwuYfGMhQ011LzlZ9Q+RSYMGXa17
	6H5NHfxW1tHSDOp9FzP1ejkDaLR6CGGTxXL3r78=
X-Google-Smtp-Source: ABdhPJziZOZlCS036I60U840Y6K8xRc/0qc99dnwwLVNHc236c3g3mm8yMLA/v69hZSK7YW+SA+lq4g26hMOlugHpsM=
X-Received: by 2002:a4a:1ac3:: with SMTP id 186mr4176430oof.8.1617043627657;
 Mon, 29 Mar 2021 11:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAKqicRBsCxFY=A=RD6kHaZa7bFag+hmUkwAJc-LSYy8XvsbGPg@mail.gmail.com>
 <889B1827-1FEB-4AC0-9002-278337D19ED5@citrix.com>
In-Reply-To: <889B1827-1FEB-4AC0-9002-278337D19ED5@citrix.com>
From: John Simpson <ttr9droid@gmail.com>
Date: Mon, 29 Mar 2021 21:46:49 +0300
Message-ID: <CAKqicRCiahd5bt1Qo=Mdh4DYRQbGWf410gF=CG51J9AD=4YwmA@mail.gmail.com>
Subject: Re: An error due to installation that require binutils package
To: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Cc: "gcc-help@gcc.gnu.org" <gcc-help@gcc.gnu.org>, 
	Community Manager <community.manager@xenproject.org>, George Dunlap <George.Dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000034cd405beb14f97"

--000000000000034cd405beb14f97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Kindly ask you to have a look at this bug.
Thank you for your replies.

On Mon, Mar 29, 2021 at 7:07 PM George Dunlap <George.Dunlap@citrix.com>
wrote:

> John,
>
> Thanks for your report.  Can you post your bug report
> xen-devel@lists.xenproject.org ?
>
> The bug is in the compilation of QEMU, which is an external project; so
> it=E2=80=99s possible that we=E2=80=99ll end up having to raise this with=
 that community as
> well.
>
> Thanks,
>  -George Dunlap
>
> > On Mar 28, 2021, at 2:26 PM, John Simpson <ttr9droid@gmail.com> wrote:
> >
> > Hello,
> >
> > Just forwarding this message to you. Can you give some thoughs about
> this? Thanks a lot.
> >
> >
> > ---------- Forwarded message ---------
> > From: Alan Modra <amodra@gmail.com>
> > Date: Sun, Mar 28, 2021 at 2:21 PM
> > Subject: Re: An error due to installation that require binutils package=
.
> > To: John Simpson <ttr9droid@gmail.com>
> > Cc: <binutils@sourceware.org>
> >
> >
> > On Sun, Mar 28, 2021 at 12:55:23PM +0300, John Simpson via Binutils
> wrote:
> > >   BUILD   pc-bios/optionrom/kvmvapic.img
> > > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> >
> > -no-pie is a gcc option.  Neither -no-pie nor --no-pie is a valid ld
> > option.  The fault lies with whatever passed -no-pie to ld.
> >
> > --
> > Alan Modra
> > Australia Development Lab, IBM
> >
> >
> >
> > ---------- Forwarded message ---------
> > From: Andreas Schwab <schwab@linux-m68k.org>
> > Date: Sun, Mar 28, 2021 at 2:17 PM
> > Subject: Re: An error due to installation that require binutils package=
.
> > To: John Simpson via Binutils <binutils@sourceware.org>
> > Cc: John Simpson <ttr9droid@gmail.com>
> >
> >
> > Please report that to the xen project.  ld -no-pie doesn't have a usefu=
l
> > meaning.  It used to mean the same as ld -n -o-pie, which sets "-pie" a=
s
> > the output file name.
> >
> > Andreas.
> >
> > --
> > Andreas Schwab, schwab@linux-m68k.org
> > GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA A=
EC1
> > "And now for something completely different."
> >
> >
> >
> > ---------- Forwarded message ---------
> > From: John Simpson <ttr9droid@gmail.com>
> > Date: Sun, Mar 28, 2021 at 12:55 PM
> > Subject: An error due to installation that require binutils package.
> > To: <binutils@sourceware.org>
> >
> >
> > Hello,
> >
> > Recently I got a following error due to installation xen on
> 5.11.6-1-MANJARO kernel:
> >
> >   GEN     target/riscv/trace.c
> >   GEN     target/s390x/trace.c
> >   GEN     target/sparc/trace.c
> >   GEN     util/trace.c
> >   GEN     config-all-devices.mak
> > make[1]: Entering directory
> '/home/username/xen/src/xen-4.14.1/tools/qemu-xen/slirp'
> > make[1]: Nothing to be done for 'all'.
> > make[1]: Leaving directory
> '/home/username/xen/src/xen-4.14.1/tools/qemu-xen/slirp'
> >   BUILD   pc-bios/optionrom/multiboot.img
> >   BUILD   pc-bios/optionrom/linuxboot.img
> >   BUILD   pc-bios/optionrom/linuxboot_dma.img
> >   BUILD   pc-bios/optionrom/kvmvapic.img
> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> > make[1]: *** [Makefile:53: multiboot.img] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> > make[1]: *** [Makefile:53: linuxboot_dma.img] Error 1
> >   BUILD   pc-bios/optionrom/pvh.img
> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> > make[1]: *** [Makefile:53: linuxboot.img] Error 1
> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> > make[1]: *** [Makefile:53: kvmvapic.img] Error 1
> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> > make[1]: *** [Makefile:50: pvh.img] Error 1
> > make: *** [Makefile:581: pc-bios/optionrom/all] Error 2
> > make: Leaving directory
> '/home/username/xen/src/xen-4.14.1/tools/qemu-xen-build'
> > make[3]: *** [Makefile:218: subdir-all-qemu-xen-dir] Error 2
> > make[3]: Leaving directory '/home/username/xen/src/xen-4.14.1/tools'
> > make[2]: ***
> [/home/username/xen/src/xen-4.14.1/tools/../tools/Rules.mk:235:
> subdirs-install] Error 2
> > make[2]: Leaving directory '/home/username/xen/src/xen-4.14.1/tools'
> > make[1]: *** [Makefile:72: install] Error 2
> > make[1]: Leaving directory '/home/username/xen/src/xen-4.14.1/tools'
> > make: *** [Makefile:134: install-tools] Error 2
> > =3D=3D> ERROR: A failure occurred in build().
> >     Aborting...
> >
> > Currently I have fresh binutils 2.36.1-2 and it seems to me that the
> issue is related to this part of code:
> >
> > https://github.com/bminor/binutils-gdb/blob/master/ld/lexsup.c#L451
> >
> > It seems to me that this could impact far more users than just me.
> >
>
>

--000000000000034cd405beb14f97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Kind=
ly ask you to have a look at this bug. <br></div><div>Thank you for your re=
plies.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Mar 29, 2021 at 7:07 PM George Dunlap &lt;<a href=
=3D"mailto:George.Dunlap@citrix.com">George.Dunlap@citrix.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">John,<br>
<br>
Thanks for your report.=C2=A0 Can you post your bug report <a href=3D"mailt=
o:xen-devel@lists.xenproject.org" target=3D"_blank">xen-devel@lists.xenproj=
ect.org</a> ?<br>
<br>
The bug is in the compilation of QEMU, which is an external project; so it=
=E2=80=99s possible that we=E2=80=99ll end up having to raise this with tha=
t community as well.<br>
<br>
Thanks,<br>
=C2=A0-George Dunlap<br>
<br>
&gt; On Mar 28, 2021, at 2:26 PM, John Simpson &lt;<a href=3D"mailto:ttr9dr=
oid@gmail.com" target=3D"_blank">ttr9droid@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; Hello,<br>
&gt; <br>
&gt; Just forwarding this message to you. Can you give some thoughs about t=
his? Thanks a lot.<br>
&gt; <br>
&gt; <br>
&gt; ---------- Forwarded message ---------<br>
&gt; From: Alan Modra &lt;<a href=3D"mailto:amodra@gmail.com" target=3D"_bl=
ank">amodra@gmail.com</a>&gt;<br>
&gt; Date: Sun, Mar 28, 2021 at 2:21 PM<br>
&gt; Subject: Re: An error due to installation that require binutils packag=
e.<br>
&gt; To: John Simpson &lt;<a href=3D"mailto:ttr9droid@gmail.com" target=3D"=
_blank">ttr9droid@gmail.com</a>&gt;<br>
&gt; Cc: &lt;<a href=3D"mailto:binutils@sourceware.org" target=3D"_blank">b=
inutils@sourceware.org</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; On Sun, Mar 28, 2021 at 12:55:23PM +0300, John Simpson via Binutils wr=
ote:<br>
&gt; &gt;=C2=A0 =C2=A0BUILD=C2=A0 =C2=A0pc-bios/optionrom/kvmvapic.img<br>
&gt; &gt; ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie=
 ?)<br>
&gt; <br>
&gt; -no-pie is a gcc option.=C2=A0 Neither -no-pie nor --no-pie is a valid=
 ld<br>
&gt; option.=C2=A0 The fault lies with whatever passed -no-pie to ld.<br>
&gt; <br>
&gt; -- <br>
&gt; Alan Modra<br>
&gt; Australia Development Lab, IBM<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; ---------- Forwarded message ---------<br>
&gt; From: Andreas Schwab &lt;<a href=3D"mailto:schwab@linux-m68k.org" targ=
et=3D"_blank">schwab@linux-m68k.org</a>&gt;<br>
&gt; Date: Sun, Mar 28, 2021 at 2:17 PM<br>
&gt; Subject: Re: An error due to installation that require binutils packag=
e.<br>
&gt; To: John Simpson via Binutils &lt;<a href=3D"mailto:binutils@sourcewar=
e.org" target=3D"_blank">binutils@sourceware.org</a>&gt;<br>
&gt; Cc: John Simpson &lt;<a href=3D"mailto:ttr9droid@gmail.com" target=3D"=
_blank">ttr9droid@gmail.com</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; Please report that to the xen project.=C2=A0 ld -no-pie doesn&#39;t ha=
ve a useful<br>
&gt; meaning.=C2=A0 It used to mean the same as ld -n -o-pie, which sets &q=
uot;-pie&quot; as<br>
&gt; the output file name.<br>
&gt; <br>
&gt; Andreas.<br>
&gt; <br>
&gt; -- <br>
&gt; Andreas Schwab, <a href=3D"mailto:schwab@linux-m68k.org" target=3D"_bl=
ank">schwab@linux-m68k.org</a><br>
&gt; GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510=C2=A0 2552 DF73 E780 =
A9DA AEC1<br>
&gt; &quot;And now for something completely different.&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; ---------- Forwarded message ---------<br>
&gt; From: John Simpson &lt;<a href=3D"mailto:ttr9droid@gmail.com" target=
=3D"_blank">ttr9droid@gmail.com</a>&gt;<br>
&gt; Date: Sun, Mar 28, 2021 at 12:55 PM<br>
&gt; Subject: An error due to installation that require binutils package.<b=
r>
&gt; To: &lt;<a href=3D"mailto:binutils@sourceware.org" target=3D"_blank">b=
inutils@sourceware.org</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; Hello,<br>
&gt; <br>
&gt; Recently I got a following error due to installation xen on 5.11.6-1-M=
ANJARO kernel:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0target/riscv/trace.c<br>
&gt;=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0target/s390x/trace.c<br>
&gt;=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0target/sparc/trace.c<br>
&gt;=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0util/trace.c<br>
&gt;=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0config-all-devices.mak<br>
&gt; make[1]: Entering directory &#39;/home/username/xen/src/xen-4.14.1/too=
ls/qemu-xen/slirp&#39;<br>
&gt; make[1]: Nothing to be done for &#39;all&#39;.<br>
&gt; make[1]: Leaving directory &#39;/home/username/xen/src/xen-4.14.1/tool=
s/qemu-xen/slirp&#39;<br>
&gt;=C2=A0 =C2=A0BUILD=C2=A0 =C2=A0pc-bios/optionrom/multiboot.img<br>
&gt;=C2=A0 =C2=A0BUILD=C2=A0 =C2=A0pc-bios/optionrom/linuxboot.img<br>
&gt;=C2=A0 =C2=A0BUILD=C2=A0 =C2=A0pc-bios/optionrom/linuxboot_dma.img<br>
&gt;=C2=A0 =C2=A0BUILD=C2=A0 =C2=A0pc-bios/optionrom/kvmvapic.img<br>
&gt; ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)<b=
r>
&gt; make[1]: *** [Makefile:53: multiboot.img] Error 1<br>
&gt; make[1]: *** Waiting for unfinished jobs....<br>
&gt; ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)<b=
r>
&gt; make[1]: *** [Makefile:53: linuxboot_dma.img] Error 1<br>
&gt;=C2=A0 =C2=A0BUILD=C2=A0 =C2=A0pc-bios/optionrom/pvh.img<br>
&gt; ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)<b=
r>
&gt; make[1]: *** [Makefile:53: linuxboot.img] Error 1<br>
&gt; ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)<b=
r>
&gt; make[1]: *** [Makefile:53: kvmvapic.img] Error 1<br>
&gt; ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)<b=
r>
&gt; make[1]: *** [Makefile:50: pvh.img] Error 1<br>
&gt; make: *** [Makefile:581: pc-bios/optionrom/all] Error 2<br>
&gt; make: Leaving directory &#39;/home/username/xen/src/xen-4.14.1/tools/q=
emu-xen-build&#39;<br>
&gt; make[3]: *** [Makefile:218: subdir-all-qemu-xen-dir] Error 2<br>
&gt; make[3]: Leaving directory &#39;/home/username/xen/src/xen-4.14.1/tool=
s&#39;<br>
&gt; make[2]: *** [/home/username/xen/src/xen-4.14.1/tools/../tools/Rules.m=
k:235: subdirs-install] Error 2<br>
&gt; make[2]: Leaving directory &#39;/home/username/xen/src/xen-4.14.1/tool=
s&#39;<br>
&gt; make[1]: *** [Makefile:72: install] Error 2<br>
&gt; make[1]: Leaving directory &#39;/home/username/xen/src/xen-4.14.1/tool=
s&#39;<br>
&gt; make: *** [Makefile:134: install-tools] Error 2<br>
&gt; =3D=3D&gt; ERROR: A failure occurred in build().<br>
&gt;=C2=A0 =C2=A0 =C2=A0Aborting...<br>
&gt; <br>
&gt; Currently I have fresh binutils 2.36.1-2 and it seems to me that the i=
ssue is related to this part of code:<br>
&gt; <br>
&gt; <a href=3D"https://github.com/bminor/binutils-gdb/blob/master/ld/lexsu=
p.c#L451" rel=3D"noreferrer" target=3D"_blank">https://github.com/bminor/bi=
nutils-gdb/blob/master/ld/lexsup.c#L451</a><br>
&gt; <br>
&gt; It seems to me that this could impact far more users than just me.<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000034cd405beb14f97--

