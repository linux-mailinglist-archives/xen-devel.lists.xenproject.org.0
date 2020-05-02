Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1A71C2A1E
	for <lists+xen-devel@lfdr.de>; Sun,  3 May 2020 07:31:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jV7Cx-0006OC-Ia; Sun, 03 May 2020 05:30:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m3Uy=6Q=gmail.com=zachm1996@srs-us1.protection.inumbo.net>)
 id 1jUzRF-0001t5-PA
 for xen-devel@lists.xenproject.org; Sat, 02 May 2020 21:12:45 +0000
X-Inumbo-ID: aa1f20ac-8cb9-11ea-ae69-bc764e2007e4
Received: from mail-yb1-xb41.google.com (unknown [2607:f8b0:4864:20::b41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa1f20ac-8cb9-11ea-ae69-bc764e2007e4;
 Sat, 02 May 2020 21:12:44 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id e16so4729111ybn.7
 for <xen-devel@lists.xenproject.org>; Sat, 02 May 2020 14:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L6ufc7Z3BoosHaEKS6oXGUAberAmw4FdVeDYSG6Bu8E=;
 b=uSTlVhFD2QSKzPEt6S9MmQ9AaaH3ziQU8DFaY9jWB/FejoTiNe8P8SZvHGIlnaYaRw
 edMP9SVGm2qXcRHRMEgiTYQECbUNTE4Sm3j1DK3FS1FACpRIXtb39Pf6ckngrRwOQhWC
 RMBgcFlFCy60rZLffVjCOIVJj1YZN6Z90mycMChzsppqNG3P8aH3bgGBMhp77gTFaaYp
 TcNtyuJiX6jruJQenODG64H35q3rYt5KLzl0eShzNbwhSYQ3qgc1P7u557R7xWQ4PIEh
 PXgT33SLbK1KflajHh8gWHK9alTbk1cxmXST851n+UyFohb97qj9PxbZnSbvcI3XlU+A
 lV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L6ufc7Z3BoosHaEKS6oXGUAberAmw4FdVeDYSG6Bu8E=;
 b=hOPd3mOfGqznBtF8yheKmXDXWmkMog+tJP7RvZX8XJLHAdQOWUNKaoEsuL5UDk2TY8
 1HvLldNcyNG944gReiquJLmrOlWe5pDDuhwtkX/q/p1+WXau34T39sR02wMQkJPBywbW
 h095wKCQU7vNeHIYlsZH7royjGI8FVrZ130Db+Xu6gY/v/iI+vmXSN+59CMQTikl0juP
 1v5CuQp7jbBWx5Sstz0YtEPMn9RRLXi6O5xyyYaDSfvXXm4xf4UY+WUgnyf6bYjAGKgA
 xrTMZCkLW2zte3yB5yf12+QoFacilQBc7XOs+10cTcSNXCKRa5pKlL8MqGtD8sT/zatJ
 Ksqw==
X-Gm-Message-State: AGi0PuaCkaFdqvE0sGVIeMVkJW5O1uVJnk+b/27ERSCjoSiln/pglswc
 q3DPKD8GGGFUq5LgEsUCiriH9hXJdgDQcWDwZWc=
X-Google-Smtp-Source: APiQypJfKLHpKzSfNQZr9v5Bdn04xX532i2C8vbsfkD8bj50Z3l9V3L1XrcZEXSHAT7D0MFjkf1CmbFkKCjnpy5T0kQ=
X-Received: by 2002:a5b:3d1:: with SMTP id t17mr16196140ybp.405.1588453963560; 
 Sat, 02 May 2020 14:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200210121443.GQ7869@mail-itl> <20200209230655.GA32524@mail-itl>
 <a6b9455d-dea1-6c61-ff7f-4fbaaba9a953@suse.com>
 <41b3896b-5414-bfdf-a515-bf2f06ab6463@citrix.com>
 <b1dfd8e66ff2cfdd1a5d77d46238b637@disroot.org>
 <20200211210852.GF2995@mail-itl>
 <088eac9d953d043e337ce100928c2e58@disroot.org>
In-Reply-To: <088eac9d953d043e337ce100928c2e58@disroot.org>
From: Z M <zachm1996@gmail.com>
Date: Sat, 2 May 2020 16:12:31 -0500
Message-ID: <CAOJhNkUKT8gVgTH=18kkydhurJqqCFRA3_Bcxaexc=t=ojBaVg@mail.gmail.com>
Subject: Re: [Xen-devel] Xen fails to resume on AMD Fam15h (and Fam17h?)
 because of CPUID mismatch
To: Claudia <claudia1@disroot.org>
Content-Type: multipart/alternative; boundary="0000000000003d7a1e05a4b0c2a3"
X-Mailman-Approved-At: Sun, 03 May 2020 05:30:30 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--0000000000003d7a1e05a4b0c2a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry to bump this ancient issue.. Claudia, did you try the RPMs out, or
did anyone else? I've had xen* and python*-xen excluded from yum/dnf for a
while on my R4.0 so I'm not getting patches on the Xen 4.8 branch. I guess
we need to wait til R4.1 to use it in production as it's built for Xen 4.13
though. Unless there's some way to put Xen 4.13 on R4.0 safely.



On Tue, Feb 11, 2020 at 10:20 PM Claudia <claudia1@disroot.org> wrote:

> February 11, 2020 9:09 PM, "Marek Marczykowski-G=C3=B3recki" <
> marmarek@invisiblethingslab.com> wrote:
>
> > On Tue, Feb 11, 2020 at 12:59:22PM +0000, Claudia wrote:
> >
> >> February 10, 2020 12:14 PM, "Marek Marczykowski-G=C3=B3recki" <
> marmarek@invisiblethingslab.com> wrote:
> >>
> >> On Mon, Feb 10, 2020 at 11:17:34AM +0000, Andrew Cooper wrote:
> >>
> >> On 10/02/2020 08:55, Jan Beulich wrote:
> >> On 10.02.2020 00:06, Marek Marczykowski-G=C3=B3recki wrote:
> >> Hi,
> >>
> >> Multiple Qubes users have reported issues with resuming from S3 on AMD
> >> systems (Ryzen 2500U, Ryzen Pro 3700U, maybe more). The error message
> >> is:
> >>
> >> (XEN) CPU0: cap[ 1] is 7ed8320b (expected f6d8320b)
> >>
> >> If I read it right, this is:
> >> - OSXSAVE: 0 -> 1
> >> - HYPERVISOR: 1 -> 0
> >>
> >> Commenting out the panic on a failed recheck_cpu_features() in power.c
> >> makes the system work after resume, reportedly stable. But that doesn'=
t
> >> sounds like a good idea generally.
> >>
> >> Is this difference a Xen fault (some missing MSR / other register
> >> restore on resume)? Or BIOS vendor / AMD, that could be worked around =
in
> >> Xen?
> >> The transition of the HYPERVISOR bit is definitely a Xen issue,
> >> with Andrew having sent a patch already (iirc).
> >>
> >>
> https://lore.kernel.org/xen-devel/20200127202121.2961-1-andrew.cooper3@ci=
trix.com
> >>
> >> Code is correct. Commit message needs rework, including in light of
> >> this discovery. (I may eventually split it into two patches.)
> >>
> >> Claudia, do you want to test with this patch?
> >>
> >> I'm getting hunk failed in domctl.c applying to R4.1 default repo
> (fc31, Xen 4.13). I'll see if I
> >> can fix it but bear with me, I'm new at this.
> >>
> >> Marek: Would you by any chance be willing to merge this into a test
> branch on your repo, so the
> >> rest of us can pull it directly into qubes-builder? It'll take you a
> fraction of the time it'll
> >> take me, plus then zachm and awokd and anyone else can pull it also.
> >
> > Here is one for Xen 4.13:
> > https://github.com/QubesOS/qubes-vmm-xen/pull/71
> > builder.conf snippet for qubes-builder:
> >
> > BRANCH_vmm_xen=3Dxen-4.13-amd-suspend
> > GIT_URL_vmm_xen=3Dhttps://github.com/marmarek/qubes-vmm-xen
> >
> > This is already v2 patch from the other thread.
>
> Thanks! For anyone else trying this, I also had to add NO_CHECK=3Dvmm-xen
> vmm-xen-stubdom-legacy, I guess because there are no tags on that branch.
> The RPMs built successfully, and I'll be able to test them as soon as I g=
et
> the latest R4.1 build downloaded and installed (I'm currently running 4.0=
).
>


--=20
- - - - - -
Zachary Muller
http://muller.is/

--0000000000003d7a1e05a4b0c2a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry to bump this ancient issue.. Claudia, did you t=
ry the RPMs out, or did anyone else? I&#39;ve had xen* and python*-xen excl=
uded from yum/dnf for a while on my R4.0 so I&#39;m not getting patches on =
the Xen 4.8 branch. I guess we need to wait til R4.1 to use it in productio=
n as it&#39;s built for Xen 4.13 though. Unless there&#39;s some way to put=
 Xen 4.13 on R4.0 safely.<br></div><div><br></div><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 11, 2020=
 at 10:20 PM Claudia &lt;<a href=3D"mailto:claudia1@disroot.org">claudia1@d=
isroot.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">February 11, 2020 9:09 PM, &quot;Marek Marczykowski-G=C3=B3recki=
&quot; &lt;<a href=3D"mailto:marmarek@invisiblethingslab.com" target=3D"_bl=
ank">marmarek@invisiblethingslab.com</a>&gt; wrote:<br>
<br>
&gt; On Tue, Feb 11, 2020 at 12:59:22PM +0000, Claudia wrote:<br>
&gt; <br>
&gt;&gt; February 10, 2020 12:14 PM, &quot;Marek Marczykowski-G=C3=B3recki&=
quot; &lt;<a href=3D"mailto:marmarek@invisiblethingslab.com" target=3D"_bla=
nk">marmarek@invisiblethingslab.com</a>&gt; wrote:<br>
&gt;&gt; <br>
&gt;&gt; On Mon, Feb 10, 2020 at 11:17:34AM +0000, Andrew Cooper wrote:<br>
&gt;&gt; <br>
&gt;&gt; On 10/02/2020 08:55, Jan Beulich wrote:<br>
&gt;&gt; On 10.02.2020 00:06, Marek Marczykowski-G=C3=B3recki wrote:<br>
&gt;&gt; Hi,<br>
&gt;&gt; <br>
&gt;&gt; Multiple Qubes users have reported issues with resuming from S3 on=
 AMD<br>
&gt;&gt; systems (Ryzen 2500U, Ryzen Pro 3700U, maybe more). The error mess=
age<br>
&gt;&gt; is:<br>
&gt;&gt; <br>
&gt;&gt; (XEN) CPU0: cap[ 1] is 7ed8320b (expected f6d8320b)<br>
&gt;&gt; <br>
&gt;&gt; If I read it right, this is:<br>
&gt;&gt; - OSXSAVE: 0 -&gt; 1<br>
&gt;&gt; - HYPERVISOR: 1 -&gt; 0<br>
&gt;&gt; <br>
&gt;&gt; Commenting out the panic on a failed recheck_cpu_features() in pow=
er.c<br>
&gt;&gt; makes the system work after resume, reportedly stable. But that do=
esn&#39;t<br>
&gt;&gt; sounds like a good idea generally.<br>
&gt;&gt; <br>
&gt;&gt; Is this difference a Xen fault (some missing MSR / other register<=
br>
&gt;&gt; restore on resume)? Or BIOS vendor / AMD, that could be worked aro=
und in<br>
&gt;&gt; Xen?<br>
&gt;&gt; The transition of the HYPERVISOR bit is definitely a Xen issue,<br=
>
&gt;&gt; with Andrew having sent a patch already (iirc).<br>
&gt;&gt; <br>
&gt;&gt; <a href=3D"https://lore.kernel.org/xen-devel/20200127202121.2961-1=
-andrew.cooper3@citrix.com" rel=3D"noreferrer" target=3D"_blank">https://lo=
re.kernel.org/xen-devel/20200127202121.2961-1-andrew.cooper3@citrix.com</a>=
<br>
&gt;&gt; <br>
&gt;&gt; Code is correct. Commit message needs rework, including in light o=
f<br>
&gt;&gt; this discovery. (I may eventually split it into two patches.)<br>
&gt;&gt; <br>
&gt;&gt; Claudia, do you want to test with this patch?<br>
&gt;&gt; <br>
&gt;&gt; I&#39;m getting hunk failed in domctl.c applying to R4.1 default r=
epo (fc31, Xen 4.13). I&#39;ll see if I<br>
&gt;&gt; can fix it but bear with me, I&#39;m new at this.<br>
&gt;&gt; <br>
&gt;&gt; Marek: Would you by any chance be willing to merge this into a tes=
t branch on your repo, so the<br>
&gt;&gt; rest of us can pull it directly into qubes-builder? It&#39;ll take=
 you a fraction of the time it&#39;ll<br>
&gt;&gt; take me, plus then zachm and awokd and anyone else can pull it als=
o.<br>
&gt; <br>
&gt; Here is one for Xen 4.13:<br>
&gt; <a href=3D"https://github.com/QubesOS/qubes-vmm-xen/pull/71" rel=3D"no=
referrer" target=3D"_blank">https://github.com/QubesOS/qubes-vmm-xen/pull/7=
1</a><br>
&gt; builder.conf snippet for qubes-builder:<br>
&gt; <br>
&gt; BRANCH_vmm_xen=3Dxen-4.13-amd-suspend<br>
&gt; GIT_URL_vmm_xen=3D<a href=3D"https://github.com/marmarek/qubes-vmm-xen=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/marmarek/qubes-vm=
m-xen</a><br>
&gt; <br>
&gt; This is already v2 patch from the other thread.<br>
<br>
Thanks! For anyone else trying this, I also had to add NO_CHECK=3Dvmm-xen v=
mm-xen-stubdom-legacy, I guess because there are no tags on that branch. Th=
e RPMs built successfully, and I&#39;ll be able to test them as soon as I g=
et the latest R4.1 build downloaded and installed (I&#39;m currently runnin=
g 4.0).<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>- - - - - -<br></div>Zachary Muller<b=
r><a href=3D"http://muller.is/" target=3D"_blank">http://muller.is/</a><br>=
</div></div>

--0000000000003d7a1e05a4b0c2a3--

