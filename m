Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7802B3661D7
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 00:02:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114015.217188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYyQk-0005Xq-Ng; Tue, 20 Apr 2021 22:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114015.217188; Tue, 20 Apr 2021 22:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYyQk-0005XR-KJ; Tue, 20 Apr 2021 22:01:14 +0000
Received: by outflank-mailman (input) for mailman id 114015;
 Tue, 20 Apr 2021 22:01:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hNLD=JR=gmail.com=charles.fg@srs-us1.protection.inumbo.net>)
 id 1lYyQj-0005XM-51
 for xen-devel@lists.xen.org; Tue, 20 Apr 2021 22:01:13 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5bceb01-2d01-49c8-90b0-64a4382ed060;
 Tue, 20 Apr 2021 22:01:11 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j5so38284034wrn.4
 for <xen-devel@lists.xen.org>; Tue, 20 Apr 2021 15:01:11 -0700 (PDT)
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
X-Inumbo-ID: b5bceb01-2d01-49c8-90b0-64a4382ed060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qMWuCRxCPdDbMoTHGS+ZZ9WANgIZAvccI5Oo34wCqps=;
        b=fkyDKVz2mL2qY7/mRKUjIjbpVqOIyVG1YE+nTUR7O0zeFur+6awhfNmxJ5i/SeA/5M
         BPM7RDueOAAri7PFt3M/05YyJgJwJ3qL5BSQQH3zuRf89S99X1ddplVc6Vl1blytTDKm
         i4SSsnnMwjvcL5NFzEQA7xnsTQ/CDbvY+bm0YABeaTnnU+hkC55+RRfkJ2Evc/5K5Yig
         Kf/CD+78IoN+tPaCuO7eOpsYqyltx4EMa3VadFOwhqp2nfZ+r0Y50TEH2CnSFVhooJ3G
         xq9jwK2bnT6u0fKjDUe8J+VgvTbhJQ5dlUzIylgkdeWHZkNaW5IQvMZe/uTucZILmcOh
         id7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qMWuCRxCPdDbMoTHGS+ZZ9WANgIZAvccI5Oo34wCqps=;
        b=np/UZmypw8j8tgbPwe32DFaz4EhCO+Jvm38UZ6elb2DQsfV6e8ZQQUN1noDHXUuZv/
         VAMBm+cq1Z3rYtUVVLK5HcmzaVCBMLoXrPPEtIYTX5AemyPffQp8PqpnZgVx3bS4hzvI
         GYCpbvdiym1CDsNHgf11W96LC1YG8+kHOB9vFknfhIO9bQImO6h3IA0xIHoMAfmYFFdE
         epqf+L2vagvbfXssmsXmVj8nlm9CHfoPNq6/MWpGm8GswQaXQ5kfuMZcuavpZ8UHFZTo
         cStImyMWBzIqV8rZASjml8BlQtoQ7dNoMJt7iWQQMUk1vYPRxiKpgaZ0mgT8SHfsxu1t
         ACnQ==
X-Gm-Message-State: AOAM533WzgXp1TyOdXaVj/c29Jurp/BV59X+h4skMronTm/Fjc1br3lV
	QGQh903li4OfJtvsPViPP16LlOSyh/d+tG05rZo=
X-Google-Smtp-Source: ABdhPJwYQbcSJuYCIqOrj8CRfFk75AIw7i4zf9hzlUUeX8EdivISApSFHj3cosnM60yeWcIJVRes/Rp3dbUow7mlQ8E=
X-Received: by 2002:a5d:6852:: with SMTP id o18mr22581246wrw.426.1618956070837;
 Tue, 20 Apr 2021 15:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQRGoC7P0yg-JoH4dpxTj13=D_6F9e2kjXuG5WWdqAF8k8KxA@mail.gmail.com>
 <78a256a8-b2ad-8a67-9b06-afbe2b11bd04@citrix.com>
In-Reply-To: <78a256a8-b2ad-8a67-9b06-afbe2b11bd04@citrix.com>
From: =?UTF-8?Q?Charles_Gon=C3=A7alves?= <charles.fg@gmail.com>
Date: Tue, 20 Apr 2021 23:00:35 +0100
Message-ID: <CAAQRGoD-VxeKWFcbseAPmXUstQthORJgM6kQ95uWSWU83CjDQw@mail.gmail.com>
Subject: Re: Writing to arbritary cannonical addresses
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="0000000000008260d005c06e95d8"

--0000000000008260d005c06e95d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks again Andrew, ...

My initial idea was to allocate a frame on kernel space and change the
update_va_mapping to "forcibly" write the desired MFN as the l1 page table
and return the va.

You can see what I did here:
https://github.com/charlesfg/xen/blob/5755f0752bd50891942768bf99898bbc8f7ea=
c82/xen/arch/x86/mm.c#L4539

Basically, I assume the fast path and for the UPDATE_ENTRY
https://github.com/charlesfg/xen/blob/5755f0752bd50891942768bf99898bbc8f7ea=
c82/xen/arch/x86/mm.c#L2184


Any help on this would be greatly appreciated  :)


Atenciosamente,
*Charles Ferreira Gon=C3=A7alves *




On Tue, Apr 20, 2021 at 7:05 PM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 20/04/2021 17:13, Charles Gon=C3=A7alves wrote:
> > Hello Guys,
> >
> > I'm trying to reproduce old exploit behaviors in a simplistic way:
> > create an hypercall to write a buffer to a specific MFN.
> >
> > At first, I thought that updating an l1 page in a valid VA in guest
> > kernel space would do the trick.
> > But for addresses outside the  Guest-defined use (0x0000000000000000 -
> > 0x00007fffffffffff ) is a no go!
> > I get a page fault with  'reserved bit in page table' warning message.
> >
> > Now I'm trying to write to the address inside the hypervisor code, but
> > not sure how to do it.
> >
> > Any comments or tips on this?
>
> So you're looking to add a hypercall to make arbitrary unaudited changes
> to arbitrary memory, to simulate past security issues?
>
> If you're seeing "Reserved bit in page table" then you've managed to
> corrupt a pagetable entry somehow.  Xen doesn't write any reserved bits
> (which it doesn't know how to interpret).
>
> I'm afraid that if you want any further help with this specific failure,
> you're going to have to post your changes to Xen somewhere.  pastebin,
> or a pointer to a git branch, or whatever, but my divination skills
> aren't great...
>
> ~Andrew
>
>

--0000000000008260d005c06e95d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks again Andrew, ...<div><br></div><div>My initial ide=
a was to allocate a frame on kernel space and change the update_va_mapping =
to &quot;forcibly&quot; write the desired MFN as the l1 page table and retu=
rn the va.=C2=A0</div><div><br></div><div>You can see what I did here:</div=
><div><a href=3D"https://github.com/charlesfg/xen/blob/5755f0752bd508919427=
68bf99898bbc8f7eac82/xen/arch/x86/mm.c#L4539">https://github.com/charlesfg/=
xen/blob/5755f0752bd50891942768bf99898bbc8f7eac82/xen/arch/x86/mm.c#L4539</=
a></div><div><br></div><div>Basically, I assume the fast path and for the U=
PDATE_ENTRY</div><div><a href=3D"https://github.com/charlesfg/xen/blob/5755=
f0752bd50891942768bf99898bbc8f7eac82/xen/arch/x86/mm.c#L2184">https://githu=
b.com/charlesfg/xen/blob/5755f0752bd50891942768bf99898bbc8f7eac82/xen/arch/=
x86/mm.c#L2184</a>=C2=A0</div><div><br></div><div>Any help on this would be=
 greatly appreciated=C2=A0 :)</div><div><br></div><div>=C2=A0 =C2=A0<br><di=
v><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signat=
ure"><div dir=3D"ltr"><div>Atenciosamente,</div><b>Charles Ferreira Gon=C3=
=A7alves </b><br><font color=3D"#666666"><br></font><font color=3D"#666666"=
 size=3D"1"><br></font></div></div></div><br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 20, 2021 at =
7:05 PM Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andr=
ew.cooper3@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On 20/04/2021 17:13, Charles Gon=C3=A7alves wrote:<br>
&gt; Hello Guys,<br>
&gt;<br>
&gt; I&#39;m trying to reproduce old exploit behaviors in a simplistic way:=
=C2=A0<br>
&gt; create an hypercall to write a buffer to a specific MFN.=C2=A0<br>
&gt;<br>
&gt; At first, I thought that updating an l1 page in a valid VA in guest<br=
>
&gt; kernel space would do=C2=A0the trick.=C2=A0<br>
&gt; But for addresses outside the=C2=A0 Guest-defined use (0x0000000000000=
000 -<br>
&gt; 0x00007fffffffffff ) is a no=C2=A0go!=C2=A0<br>
&gt; I get a page fault with=C2=A0 &#39;reserved bit in page table&#39; war=
ning message.<br>
&gt;<br>
&gt; Now I&#39;m trying to write to the address inside the hypervisor code,=
 but<br>
&gt; not sure how to do it.=C2=A0=C2=A0<br>
&gt;<br>
&gt; Any comments or tips on this?<br>
<br>
So you&#39;re looking to add a hypercall to make arbitrary unaudited change=
s<br>
to arbitrary memory, to simulate past security issues?<br>
<br>
If you&#39;re seeing &quot;Reserved bit in page table&quot; then you&#39;ve=
 managed to<br>
corrupt a pagetable entry somehow.=C2=A0 Xen doesn&#39;t write any reserved=
 bits<br>
(which it doesn&#39;t know how to interpret).<br>
<br>
I&#39;m afraid that if you want any further help with this specific failure=
,<br>
you&#39;re going to have to post your changes to Xen somewhere.=C2=A0 paste=
bin,<br>
or a pointer to a git branch, or whatever, but my divination skills<br>
aren&#39;t great...<br>
<br>
~Andrew<br>
<br>
</blockquote></div>

--0000000000008260d005c06e95d8--

