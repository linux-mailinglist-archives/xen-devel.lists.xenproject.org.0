Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EC934FC65
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 11:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103810.197948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRWwa-0005I1-N1; Wed, 31 Mar 2021 09:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103810.197948; Wed, 31 Mar 2021 09:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRWwa-0005Hc-JW; Wed, 31 Mar 2021 09:15:20 +0000
Received: by outflank-mailman (input) for mailman id 103810;
 Wed, 31 Mar 2021 09:15:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bLE+=I5=gmail.com=ttr9droid@srs-us1.protection.inumbo.net>)
 id 1lRWwY-0005HX-Th
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 09:15:19 +0000
Received: from mail-ot1-x330.google.com (unknown [2607:f8b0:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3fe011b-ac8a-4212-abf3-cbd89e61a5f5;
 Wed, 31 Mar 2021 09:15:17 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so18307066oto.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Mar 2021 02:15:17 -0700 (PDT)
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
X-Inumbo-ID: c3fe011b-ac8a-4212-abf3-cbd89e61a5f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/D26C0u1s6hM6ll6DeVeqaC5slFPgJC29V0eguhwf6Q=;
        b=X8AJko9TQdt+yqB27GkzbogdMQS7aWcw4tzT4YNPnsGBRraiNx7YcgyfwXrsbjSsS2
         aq89P9GVoC3QdBr03AUV7LjZ4fL2YOj4Ufss6nmB6QuAKNJ07rXqP4pw67ukRTksBql6
         yLN7hN9SNoacb20Igbu4gh3jOaY/9oZXLd9fbCJ4ezq6oym/AT7dNgjH2xji2cY/AV/3
         XcvclhDDklYmRK6O1VfZTn4eLgPxKhHBQQpSVB6dZJ53aR3h6j2GMJoscnhWQIwCHayy
         8NmGbQBvL+lJTaxsk+qNOOhs9Ao1x+QxcVS9DTp9yOmDLIAzKCyqNhMUWP50+bNT8bDl
         dJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/D26C0u1s6hM6ll6DeVeqaC5slFPgJC29V0eguhwf6Q=;
        b=hdCKlmLstv0DGPOuPdQbFZaS74aghlF/urHCpv6t6tsxz9TGNwCqkvg7KukFWy2YNG
         g7DqoGwGRLNbG3nnHGuHN0gsm7dyVVqps4CA8kaGh5hoFAw6aD5ST1Dh+9TbEj9yhT4H
         gPc0XO0GzUZDW/vFipVKbMmhjpZgDLsHeZq5sp2zh4tr/Vwlg4MlRzg8C9Ei3SYUfE2t
         p7pLhlMBOzwspa8eFjVlBIKC1K3p/zJT0fDMKQCTd6JUTXa7KccwqwyKM1SXbc517scZ
         rrSRDHXmbldo3Mr4wNu3gZalHNB7m2ha56mF7lq3GFuygAugEhKlvXaG1v6csioJFQ8Q
         r1SQ==
X-Gm-Message-State: AOAM533SCbh8/hoQMuoAwF6CC0nwV/4bPTg32w5UF/xfNu5piNN5SCfl
	iA6Fj3KXWRXRZuU0Jyer8XMzK/sfpSyE+BiuocSvVHW72u3ApA==
X-Google-Smtp-Source: ABdhPJwRzC/Tv3wYBv+SgCUp3ZVp++Hjsy0S14Y82RvYoWHXxkgV9D2EhcLrSt9gfwz1dORvngmOg3d/iI1oX43utr4=
X-Received: by 2002:a9d:748a:: with SMTP id t10mr2006571otk.198.1617182116908;
 Wed, 31 Mar 2021 02:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAKqicRBsCxFY=A=RD6kHaZa7bFag+hmUkwAJc-LSYy8XvsbGPg@mail.gmail.com>
 <889B1827-1FEB-4AC0-9002-278337D19ED5@citrix.com> <CAKqicRCiahd5bt1Qo=Mdh4DYRQbGWf410gF=CG51J9AD=4YwmA@mail.gmail.com>
 <20210330124646.jl4re5srmbzhkipm@steredhat>
In-Reply-To: <20210330124646.jl4re5srmbzhkipm@steredhat>
From: John Simpson <ttr9droid@gmail.com>
Date: Wed, 31 Mar 2021 05:15:05 -0400
Message-ID: <CAKqicRDRScHvpBQ7Em6t5aQorstKvH_dFBTKZiKD-78QAYA67Q@mail.gmail.com>
Subject: Re: An error due to installation that require binutils package
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
	"gcc-help@gcc.gnu.org" <gcc-help@gcc.gnu.org>, Community Manager <community.manager@xenproject.org>, 
	George Dunlap <George.Dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000009d8fc205bed18d13"

--0000000000009d8fc205bed18d13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Got you Stefano,

Appreciate for your reply.

On Tue, Mar 30, 2021 at 8:46 AM Stefano Garzarella <sgarzare@redhat.com>
wrote:

> Hi John,
>
> On Mon, Mar 29, 2021 at 09:46:49PM +0300, John Simpson wrote:
> >Hello,
> >
> >Kindly ask you to have a look at this bug.
> >Thank you for your replies.
>
> It's already fixed in QEMU upstream and the fix will be released with
> the 6.0 version next month (the rc0 is already available):
>
> https://gitlab.com/qemu-project/qemu/-/commit/bbd2d5a8120771ec59b86a80a1f=
51884e0a26e53
>
> I guess xen-4.14.1 is using an older version, so if you want you can
> backport that patch in your version, the change should be simple.
>
> Thanks,
> Stefano
>
> >
> >On Mon, Mar 29, 2021 at 7:07 PM George Dunlap <George.Dunlap@citrix.com>
> >wrote:
> >
> >> John,
> >>
> >> Thanks for your report.  Can you post your bug report
> >> xen-devel@lists.xenproject.org ?
> >>
> >> The bug is in the compilation of QEMU, which is an external project; s=
o
> >> it=E2=80=99s possible that we=E2=80=99ll end up having to raise this w=
ith that
> community as
> >> well.
> >>
> >> Thanks,
> >>  -George Dunlap
> >>
> >> > On Mar 28, 2021, at 2:26 PM, John Simpson <ttr9droid@gmail.com>
> wrote:
> >> >
> >> > Hello,
> >> >
> >> > Just forwarding this message to you. Can you give some thoughs about
> >> this? Thanks a lot.
> >> >
> >> >
> >> > ---------- Forwarded message ---------
> >> > From: Alan Modra <amodra@gmail.com>
> >> > Date: Sun, Mar 28, 2021 at 2:21 PM
> >> > Subject: Re: An error due to installation that require binutils
> package.
> >> > To: John Simpson <ttr9droid@gmail.com>
> >> > Cc: <binutils@sourceware.org>
> >> >
> >> >
> >> > On Sun, Mar 28, 2021 at 12:55:23PM +0300, John Simpson via Binutils
> >> wrote:
> >> > >   BUILD   pc-bios/optionrom/kvmvapic.img
> >> > > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie =
?)
> >> >
> >> > -no-pie is a gcc option.  Neither -no-pie nor --no-pie is a valid ld
> >> > option.  The fault lies with whatever passed -no-pie to ld.
> >> >
> >> > --
> >> > Alan Modra
> >> > Australia Development Lab, IBM
> >> >
> >> >
> >> >
> >> > ---------- Forwarded message ---------
> >> > From: Andreas Schwab <schwab@linux-m68k.org>
> >> > Date: Sun, Mar 28, 2021 at 2:17 PM
> >> > Subject: Re: An error due to installation that require binutils
> >> > package.
> >> > To: John Simpson via Binutils <binutils@sourceware.org>
> >> > Cc: John Simpson <ttr9droid@gmail.com>
> >> >
> >> >
> >> > Please report that to the xen project.  ld -no-pie doesn't have a
> useful
> >> > meaning.  It used to mean the same as ld -n -o-pie, which sets "-pie=
"
> as
> >> > the output file name.
> >> >
> >> > Andreas.
> >> >
> >> > --
> >> > Andreas Schwab, schwab@linux-m68k.org
> >> > GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9D=
A
> AEC1
> >> > "And now for something completely different."
> >> >
> >> >
> >> >
> >> > ---------- Forwarded message ---------
> >> > From: John Simpson <ttr9droid@gmail.com>
> >> > Date: Sun, Mar 28, 2021 at 12:55 PM
> >> > Subject: An error due to installation that require binutils package.
> >> > To: <binutils@sourceware.org>
> >> >
> >> >
> >> > Hello,
> >> >
> >> > Recently I got a following error due to installation xen on
> >> 5.11.6-1-MANJARO kernel:
> >> >
> >> >   GEN     target/riscv/trace.c
> >> >   GEN     target/s390x/trace.c
> >> >   GEN     target/sparc/trace.c
> >> >   GEN     util/trace.c
> >> >   GEN     config-all-devices.mak
> >> > make[1]: Entering directory
> >> '/home/username/xen/src/xen-4.14.1/tools/qemu-xen/slirp'
> >> > make[1]: Nothing to be done for 'all'.
> >> > make[1]: Leaving directory
> >> '/home/username/xen/src/xen-4.14.1/tools/qemu-xen/slirp'
> >> >   BUILD   pc-bios/optionrom/multiboot.img
> >> >   BUILD   pc-bios/optionrom/linuxboot.img
> >> >   BUILD   pc-bios/optionrom/linuxboot_dma.img
> >> >   BUILD   pc-bios/optionrom/kvmvapic.img
> >> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> >> > make[1]: *** [Makefile:53: multiboot.img] Error 1
> >> > make[1]: *** Waiting for unfinished jobs....
> >> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> >> > make[1]: *** [Makefile:53: linuxboot_dma.img] Error 1
> >> >   BUILD   pc-bios/optionrom/pvh.img
> >> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> >> > make[1]: *** [Makefile:53: linuxboot.img] Error 1
> >> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> >> > make[1]: *** [Makefile:53: kvmvapic.img] Error 1
> >> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> >> > make[1]: *** [Makefile:50: pvh.img] Error 1
> >> > make: *** [Makefile:581: pc-bios/optionrom/all] Error 2
> >> > make: Leaving directory
> >> '/home/username/xen/src/xen-4.14.1/tools/qemu-xen-build'
> >> > make[3]: *** [Makefile:218: subdir-all-qemu-xen-dir] Error 2
> >> > make[3]: Leaving directory '/home/username/xen/src/xen-4.14.1/tools'
> >> > make[2]: ***
> >> [/home/username/xen/src/xen-4.14.1/tools/../tools/Rules.mk:235:
> >> subdirs-install] Error 2
> >> > make[2]: Leaving directory '/home/username/xen/src/xen-4.14.1/tools'
> >> > make[1]: *** [Makefile:72: install] Error 2
> >> > make[1]: Leaving directory '/home/username/xen/src/xen-4.14.1/tools'
> >> > make: *** [Makefile:134: install-tools] Error 2
> >> > =3D=3D> ERROR: A failure occurred in build().
> >> >     Aborting...
> >> >
> >> > Currently I have fresh binutils 2.36.1-2 and it seems to me that the
> >> issue is related to this part of code:
> >> >
> >> > https://github.com/bminor/binutils-gdb/blob/master/ld/lexsup.c#L451
> >> >
> >> > It seems to me that this could impact far more users than just me.
> >> >
> >>
> >>
>
>

--0000000000009d8fc205bed18d13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Got you Stefano,</div><div><br></div><div>Appreciate =
for your reply.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Mar 30, 2021 at 8:46 AM Stefano Garzarella &lt=
;<a href=3D"mailto:sgarzare@redhat.com">sgarzare@redhat.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi John,<br>
<br>
On Mon, Mar 29, 2021 at 09:46:49PM +0300, John Simpson wrote:<br>
&gt;Hello,<br>
&gt;<br>
&gt;Kindly ask you to have a look at this bug.<br>
&gt;Thank you for your replies.<br>
<br>
It&#39;s already fixed in QEMU upstream and the fix will be released with <=
br>
the 6.0 version next month (the rc0 is already available):<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/commit/bbd2d5a8120771ec59=
b86a80a1f51884e0a26e53" rel=3D"noreferrer" target=3D"_blank">https://gitlab=
.com/qemu-project/qemu/-/commit/bbd2d5a8120771ec59b86a80a1f51884e0a26e53</a=
><br>
<br>
I guess xen-4.14.1 is using an older version, so if you want you can <br>
backport that patch in your version, the change should be simple.<br>
<br>
Thanks,<br>
Stefano<br>
<br>
&gt;<br>
&gt;On Mon, Mar 29, 2021 at 7:07 PM George Dunlap &lt;<a href=3D"mailto:Geo=
rge.Dunlap@citrix.com" target=3D"_blank">George.Dunlap@citrix.com</a>&gt;<b=
r>
&gt;wrote:<br>
&gt;<br>
&gt;&gt; John,<br>
&gt;&gt;<br>
&gt;&gt; Thanks for your report.=C2=A0 Can you post your bug report<br>
&gt;&gt; <a href=3D"mailto:xen-devel@lists.xenproject.org" target=3D"_blank=
">xen-devel@lists.xenproject.org</a> ?<br>
&gt;&gt;<br>
&gt;&gt; The bug is in the compilation of QEMU, which is an external projec=
t; so<br>
&gt;&gt; it=E2=80=99s possible that we=E2=80=99ll end up having to raise th=
is with that community as<br>
&gt;&gt; well.<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt;=C2=A0 -George Dunlap<br>
&gt;&gt;<br>
&gt;&gt; &gt; On Mar 28, 2021, at 2:26 PM, John Simpson &lt;<a href=3D"mail=
to:ttr9droid@gmail.com" target=3D"_blank">ttr9droid@gmail.com</a>&gt; wrote=
:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hello,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Just forwarding this message to you. Can you give some though=
s about<br>
&gt;&gt; this? Thanks a lot.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ---------- Forwarded message ---------<br>
&gt;&gt; &gt; From: Alan Modra &lt;<a href=3D"mailto:amodra@gmail.com" targ=
et=3D"_blank">amodra@gmail.com</a>&gt;<br>
&gt;&gt; &gt; Date: Sun, Mar 28, 2021 at 2:21 PM<br>
&gt;&gt; &gt; Subject: Re: An error due to installation that require binuti=
ls package.<br>
&gt;&gt; &gt; To: John Simpson &lt;<a href=3D"mailto:ttr9droid@gmail.com" t=
arget=3D"_blank">ttr9droid@gmail.com</a>&gt;<br>
&gt;&gt; &gt; Cc: &lt;<a href=3D"mailto:binutils@sourceware.org" target=3D"=
_blank">binutils@sourceware.org</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Sun, Mar 28, 2021 at 12:55:23PM +0300, John Simpson via Bi=
nutils<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt; &gt;=C2=A0 =C2=A0BUILD=C2=A0 =C2=A0pc-bios/optionrom/kvmvapic=
.img<br>
&gt;&gt; &gt; &gt; ld: Error: unable to disambiguate: -no-pie (did you mean=
 --no-pie ?)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -no-pie is a gcc option.=C2=A0 Neither -no-pie nor --no-pie i=
s a valid ld<br>
&gt;&gt; &gt; option.=C2=A0 The fault lies with whatever passed -no-pie to =
ld.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; Alan Modra<br>
&gt;&gt; &gt; Australia Development Lab, IBM<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ---------- Forwarded message ---------<br>
&gt;&gt; &gt; From: Andreas Schwab &lt;<a href=3D"mailto:schwab@linux-m68k.=
org" target=3D"_blank">schwab@linux-m68k.org</a>&gt;<br>
&gt;&gt; &gt; Date: Sun, Mar 28, 2021 at 2:17 PM<br>
&gt;&gt; &gt; Subject: Re: An error due to installation that require binuti=
ls <br>
&gt;&gt; &gt; package.<br>
&gt;&gt; &gt; To: John Simpson via Binutils &lt;<a href=3D"mailto:binutils@=
sourceware.org" target=3D"_blank">binutils@sourceware.org</a>&gt;<br>
&gt;&gt; &gt; Cc: John Simpson &lt;<a href=3D"mailto:ttr9droid@gmail.com" t=
arget=3D"_blank">ttr9droid@gmail.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Please report that to the xen project.=C2=A0 ld -no-pie doesn=
&#39;t have a useful<br>
&gt;&gt; &gt; meaning.=C2=A0 It used to mean the same as ld -n -o-pie, whic=
h sets &quot;-pie&quot; as<br>
&gt;&gt; &gt; the output file name.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Andreas.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; Andreas Schwab, <a href=3D"mailto:schwab@linux-m68k.org" targ=
et=3D"_blank">schwab@linux-m68k.org</a><br>
&gt;&gt; &gt; GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510=C2=A0 2552 D=
F73 E780 A9DA AEC1<br>
&gt;&gt; &gt; &quot;And now for something completely different.&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ---------- Forwarded message ---------<br>
&gt;&gt; &gt; From: John Simpson &lt;<a href=3D"mailto:ttr9droid@gmail.com"=
 target=3D"_blank">ttr9droid@gmail.com</a>&gt;<br>
&gt;&gt; &gt; Date: Sun, Mar 28, 2021 at 12:55 PM<br>
&gt;&gt; &gt; Subject: An error due to installation that require binutils p=
ackage.<br>
&gt;&gt; &gt; To: &lt;<a href=3D"mailto:binutils@sourceware.org" target=3D"=
_blank">binutils@sourceware.org</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hello,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Recently I got a following error due to installation xen on<b=
r>
&gt;&gt; 5.11.6-1-MANJARO kernel:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0target/riscv/trace.c<br>
&gt;&gt; &gt;=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0target/s390x/trace.c<br>
&gt;&gt; &gt;=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0target/sparc/trace.c<br>
&gt;&gt; &gt;=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0util/trace.c<br>
&gt;&gt; &gt;=C2=A0 =C2=A0GEN=C2=A0 =C2=A0 =C2=A0config-all-devices.mak<br>
&gt;&gt; &gt; make[1]: Entering directory<br>
&gt;&gt; &#39;/home/username/xen/src/xen-4.14.1/tools/qemu-xen/slirp&#39;<b=
r>
&gt;&gt; &gt; make[1]: Nothing to be done for &#39;all&#39;.<br>
&gt;&gt; &gt; make[1]: Leaving directory<br>
&gt;&gt; &#39;/home/username/xen/src/xen-4.14.1/tools/qemu-xen/slirp&#39;<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0BUILD=C2=A0 =C2=A0pc-bios/optionrom/multiboot.img=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0BUILD=C2=A0 =C2=A0pc-bios/optionrom/linuxboot.img=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0BUILD=C2=A0 =C2=A0pc-bios/optionrom/linuxboot_dma=
.img<br>
&gt;&gt; &gt;=C2=A0 =C2=A0BUILD=C2=A0 =C2=A0pc-bios/optionrom/kvmvapic.img<=
br>
&gt;&gt; &gt; ld: Error: unable to disambiguate: -no-pie (did you mean --no=
-pie ?)<br>
&gt;&gt; &gt; make[1]: *** [Makefile:53: multiboot.img] Error 1<br>
&gt;&gt; &gt; make[1]: *** Waiting for unfinished jobs....<br>
&gt;&gt; &gt; ld: Error: unable to disambiguate: -no-pie (did you mean --no=
-pie ?)<br>
&gt;&gt; &gt; make[1]: *** [Makefile:53: linuxboot_dma.img] Error 1<br>
&gt;&gt; &gt;=C2=A0 =C2=A0BUILD=C2=A0 =C2=A0pc-bios/optionrom/pvh.img<br>
&gt;&gt; &gt; ld: Error: unable to disambiguate: -no-pie (did you mean --no=
-pie ?)<br>
&gt;&gt; &gt; make[1]: *** [Makefile:53: linuxboot.img] Error 1<br>
&gt;&gt; &gt; ld: Error: unable to disambiguate: -no-pie (did you mean --no=
-pie ?)<br>
&gt;&gt; &gt; make[1]: *** [Makefile:53: kvmvapic.img] Error 1<br>
&gt;&gt; &gt; ld: Error: unable to disambiguate: -no-pie (did you mean --no=
-pie ?)<br>
&gt;&gt; &gt; make[1]: *** [Makefile:50: pvh.img] Error 1<br>
&gt;&gt; &gt; make: *** [Makefile:581: pc-bios/optionrom/all] Error 2<br>
&gt;&gt; &gt; make: Leaving directory<br>
&gt;&gt; &#39;/home/username/xen/src/xen-4.14.1/tools/qemu-xen-build&#39;<b=
r>
&gt;&gt; &gt; make[3]: *** [Makefile:218: subdir-all-qemu-xen-dir] Error 2<=
br>
&gt;&gt; &gt; make[3]: Leaving directory &#39;/home/username/xen/src/xen-4.=
14.1/tools&#39;<br>
&gt;&gt; &gt; make[2]: ***<br>
&gt;&gt; [/home/username/xen/src/xen-4.14.1/tools/../tools/Rules.mk:235:<br=
>
&gt;&gt; subdirs-install] Error 2<br>
&gt;&gt; &gt; make[2]: Leaving directory &#39;/home/username/xen/src/xen-4.=
14.1/tools&#39;<br>
&gt;&gt; &gt; make[1]: *** [Makefile:72: install] Error 2<br>
&gt;&gt; &gt; make[1]: Leaving directory &#39;/home/username/xen/src/xen-4.=
14.1/tools&#39;<br>
&gt;&gt; &gt; make: *** [Makefile:134: install-tools] Error 2<br>
&gt;&gt; &gt; =3D=3D&gt; ERROR: A failure occurred in build().<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0Aborting...<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Currently I have fresh binutils 2.36.1-2 and it seems to me t=
hat the<br>
&gt;&gt; issue is related to this part of code:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"https://github.com/bminor/binutils-gdb/blob/master=
/ld/lexsup.c#L451" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
bminor/binutils-gdb/blob/master/ld/lexsup.c#L451</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; It seems to me that this could impact far more users than jus=
t me.<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
<br>
</blockquote></div>

--0000000000009d8fc205bed18d13--

