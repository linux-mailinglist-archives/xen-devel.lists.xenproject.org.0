Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB3E2A7942
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 09:28:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19660.44908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaadN-0006OW-Et; Thu, 05 Nov 2020 08:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19660.44908; Thu, 05 Nov 2020 08:28:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaadN-0006O7-BF; Thu, 05 Nov 2020 08:28:41 +0000
Received: by outflank-mailman (input) for mailman id 19660;
 Thu, 05 Nov 2020 08:28:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R1bg=EL=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1kaadM-0006O0-Bm
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 08:28:40 +0000
Received: from mail-ot1-f41.google.com (unknown [209.85.210.41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df994039-12e6-4d80-8c3f-3d7fc46636a6;
 Thu, 05 Nov 2020 08:28:39 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id k3so666486otp.12
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 00:28:39 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=R1bg=EL=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
	id 1kaadM-0006O0-Bm
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 08:28:40 +0000
X-Inumbo-ID: df994039-12e6-4d80-8c3f-3d7fc46636a6
Received: from mail-ot1-f41.google.com (unknown [209.85.210.41])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id df994039-12e6-4d80-8c3f-3d7fc46636a6;
	Thu, 05 Nov 2020 08:28:39 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id k3so666486otp.12
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 00:28:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xicmHF4rJAUG4xgwhhtkHu520Lkff9VoRcMLqSQLnKw=;
        b=VLS+WigWq5UjMBX3KzrpVGTp+8IZJfkIG3aKGNUODK9H00tZceNdGYAk8A0nP1pkHP
         R7BEGx2DzTjTKUtJLapzTzA38r4rx4q2Mn5YZUjX1EBt4Qib35u8dYzr0h0MS2dSbnPj
         5m1Oo/p7NTYLq2K89m6Kb8TQfD/I7Dl7eFCsuhSkIjxoVcUMPMrXbIp+WQX1cH3wb2x+
         v3fYnf5wCoOWfvtqLARdrvJedXsEa+dWpebELbh14SId8NursgGQ0FXQIbQ4MU5mCcC2
         CKa6X/LHyj2kK/ItScHGKIwDHWJLygby9+DnXDE2s7ovHd/AtWNsE4+YPXgtmONW7oaJ
         qrkg==
X-Gm-Message-State: AOAM531ZFiLM3H2mimi0Ezk0yUdtnIS3GbN/5zTrxFmK+Pq9MWR6E9pV
	NEpMXM3XNIPI4DLB0+j+8F/vxdZDu1fgd4aZiQc=
X-Google-Smtp-Source: ABdhPJxEnS6iGJDfFZSOe00EmRjaIdeCWilAcRGjzSID/8pP/7VpwLVCFr4tVDvsPF7uAQfyKHOUI4NIAHwsXXz43kQ=
X-Received: by 2002:a05:6830:2085:: with SMTP id y5mr940046otq.37.1604564919101;
 Thu, 05 Nov 2020 00:28:39 -0800 (PST)
MIME-Version: 1.0
References: <20201103164604.2692357-1-philmd@redhat.com> <20201103164604.2692357-3-philmd@redhat.com>
 <20201103165247.GT205187@redhat.com> <7654e063-98d3-84e0-8116-5a1b41d14636@redhat.com>
 <21e90ddb-fe8a-c780-2741-9b7a2f7f1c9a@redhat.com> <alpine.DEB.2.21.2011031722100.3264@sstabellini-ThinkPad-T480s>
 <9ac5e985-a701-f357-29fb-ef7975f5f2c2@redhat.com> <alpine.DEB.2.21.2011041805060.3264@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2011041805060.3264@sstabellini-ThinkPad-T480s>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 5 Nov 2020 09:19:34 +0100
Message-ID: <CAAdtpL6tGqKyRSZiQK7ZaEuJyG6z2tAauzsDVQnet=3EkuqPBQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 2/3] gitlab-ci: Add a job to cover the
 --without-default-devices config
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Cornelia Huck <cohuck@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org, 
	Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, David Hildenbrand <david@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: multipart/alternative; boundary="00000000000005af5d05b357e2c9"

--00000000000005af5d05b357e2c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 5 nov. 2020 05:28, Stefano Stabellini <sstabellini@kernel.org> a
=C3=A9crit :

> On Wed, 4 Nov 2020, Thomas Huth wrote:
> > On 04/11/2020 03.27, Stefano Stabellini wrote:
> > [...]
> > > Actually I care about Xen and 9pfs support, it is one of the few
> > > combinations that I use regularly and it is even enabled in the Xilin=
x
> > > product I look after. But admittedly I don't test QEMU master as much
> as
> > > I should. With the recent changes to the build system it is not very
> > > suprising that there are some issues. It would be great to have a Xen
> > > and 9pfs test in the gitlab CI-loop.
> > >
> > >
> > > FYI I tried to build the latest QEMU on Alpine Linux 3.12 ARM64 and I
> > > get:
> > >
> > >   ninja: unknown tool 'query'
> > >
> > > Even after rebuilding ninja master by hand. Any ideas? I don't know
> much
> > > about ninja.
> > >
> > >
> > > So I gave up on that and I spinned up a Debian Buster x86 container f=
or
> > > this build. That one got past the "ninja: unknown tool 'query'" error=
.
> > > The build completed without problems to the end.
> > >
> > > Either way I can't reproduce the build error above.
> >
> > Did you run "configure" with "--without-default-devices" ?
>
> Yes, and still I can't repro the issue, strange. Anyway, I saw that
> Philippe managed to find and fix the issue with "hw/9pfs: Fix Kconfig
> dependency problem between 9pfs and Xen", so all sorted :)
>

Paolo figured the problem and sent a diff, I just forwarded it as a formal
patch ;)

>

--00000000000005af5d05b357e2c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Le jeu. 5 nov. 2020 05:28, Stefano Stabellini &lt;<a href=
=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; a =C3=A9c=
rit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 4 Nov 2020, Thom=
as Huth wrote:<br>
&gt; On 04/11/2020 03.27, Stefano Stabellini wrote:<br>
&gt; [...]<br>
&gt; &gt; Actually I care about Xen and 9pfs support, it is one of the few<=
br>
&gt; &gt; combinations that I use regularly and it is even enabled in the X=
ilinx<br>
&gt; &gt; product I look after. But admittedly I don&#39;t test QEMU master=
 as much as<br>
&gt; &gt; I should. With the recent changes to the build system it is not v=
ery<br>
&gt; &gt; suprising that there are some issues. It would be great to have a=
 Xen<br>
&gt; &gt; and 9pfs test in the gitlab CI-loop.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; FYI I tried to build the latest QEMU on Alpine Linux 3.12 ARM64 a=
nd I<br>
&gt; &gt; get:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0ninja: unknown tool &#39;query&#39;<br>
&gt; &gt; <br>
&gt; &gt; Even after rebuilding ninja master by hand. Any ideas? I don&#39;=
t know much<br>
&gt; &gt; about ninja.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; So I gave up on that and I spinned up a Debian Buster x86 contain=
er for<br>
&gt; &gt; this build. That one got past the &quot;ninja: unknown tool &#39;=
query&#39;&quot; error.<br>
&gt; &gt; The build completed without problems to the end.<br>
&gt; &gt; <br>
&gt; &gt; Either way I can&#39;t reproduce the build error above.<br>
&gt; <br>
&gt; Did you run &quot;configure&quot; with &quot;--without-default-devices=
&quot; ?<br>
<br>
Yes, and still I can&#39;t repro the issue, strange. Anyway, I saw that<br>
Philippe managed to find and fix the issue with &quot;hw/9pfs: Fix Kconfig<=
br>
dependency problem between 9pfs and Xen&quot;, so all sorted :)<br></blockq=
uote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo figure=
d the problem and sent a diff, I just forwarded it as a formal patch ;)</di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
</blockquote></div></div></div>

--00000000000005af5d05b357e2c9--

