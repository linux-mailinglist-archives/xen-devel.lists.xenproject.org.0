Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED4C1E065C
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 07:18:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd5V4-0001jN-ES; Mon, 25 May 2020 05:18:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aFRw=7H=gmail.com=buycomputer40@srs-us1.protection.inumbo.net>)
 id 1jd5V3-0001jI-9V
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 05:18:09 +0000
X-Inumbo-ID: 1e4818f0-9e47-11ea-9887-bc764e2007e4
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e4818f0-9e47-11ea-9887-bc764e2007e4;
 Mon, 25 May 2020 05:18:08 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id e125so9821287lfd.1
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2020 22:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=uVmlM1Szc7BB+byHXsR7/2eU40xH68Kxf4npVbZ9IkM=;
 b=CXrczYQJEF1jd5qLrHoK4Hl/r5GAE6PqgGwVsOg4ebUAKtqmGxAPBO2mLbQ6B6x04v
 dJY7ajVj9F0seQ0zxurjwfxgpTMWKvd7GM1ftwdfTTHOmcYRTL97e1B8KsRcMsS75W+k
 Emr5G+/J/Ltkd+KN7nJFvQo61MhQ9wiN8dBpCE7hRA/Q6G3YBmgLkM8jkhtpj9nsNcyu
 J6QR9iuQMxvNmXQpeb+bVr1IbN2SwQF1LVNUhzNRQISPJ2B1XTHxubwDMwJ1y3nTAi6m
 Bd0DypK8EMiKPUadG/mbFq0ftxiPjx14XhJovoRzL8Gt/d+LUjQo0mFtRUtSOjruPAeE
 0QFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=uVmlM1Szc7BB+byHXsR7/2eU40xH68Kxf4npVbZ9IkM=;
 b=aPbqGYleEUESEy1sD3+5fa/b8t3MmD7l4TyujQYB5UHq9wtHD9niILF3qvs3405PU5
 ZyKFwkD1R+kSMSm5pSKed0cxwOgVATjRTorKX2PPjxiwy1tgZHNPa8Y1wA8FLyT3SEho
 X/quu5slFwx02xhMEfGPrX221zJIksFjbZvh6CATe5R24PQbTvB1CVmIyJjxPw1f7RqI
 0A6RWiV78RajySkQ3otC1VRzSz7z4/HFHoilN4sley/mdXqXOTeYvrqmfXXyc3c3Daix
 NUAJ96LTuL3scHzsr25jMCzyaqTYZz7iv8/6KXg9DumCYFcc28TJ5xkwwn3oPcZ7AYv3
 nH3A==
X-Gm-Message-State: AOAM533XTdWDmZkjfWaQ38j8gGQXXbgZBjU3EdkeDl3ItnT/mFSQAaAn
 8p8IQCY8KtFTjkAQtV+P0wZwp3VQTI1MHsRMhEQ=
X-Google-Smtp-Source: ABdhPJw8qdjdyHu3/5T+MbgwGEeB5/0K7SFBAzpohMFiQVkN7CAyWX6+tG/7Qv+gkObYR02enJDcskFP+kzoWqCLuq0=
X-Received: by 2002:a19:150:: with SMTP id 77mr13425593lfb.71.1590383887202;
 Sun, 24 May 2020 22:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <CANSXg2FGtiDT05sQUpSAshAsdP4wSjPgQbfw_+aKJuAzSwvJuQ@mail.gmail.com>
 <da7e41b5-88a1-13ab-d52b-0652c16608af@suse.com>
 <MWHPR11MB1645DC1C5782DDA28C9BB1CB8CB30@MWHPR11MB1645.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB1645DC1C5782DDA28C9BB1CB8CB30@MWHPR11MB1645.namprd11.prod.outlook.com>
From: buy computer <buycomputer40@gmail.com>
Date: Mon, 25 May 2020 08:17:54 +0300
Message-ID: <CANSXg2EiauZfTMsmqzcB2ShUCr67rB+mHBm4EVtWhMaUL8NL-w@mail.gmail.com>
Subject: Re: iommu=no-igfx
To: "Tian, Kevin" <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000a742b305a6721ab9"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000a742b305a6721ab9
Content-Type: text/plain; charset="UTF-8"

On Mon, May 25, 2020 at 5:16 AM Tian, Kevin <kevin.tian@intel.com> wrote:

> > From: Jan Beulich <jbeulich@suse.com>
> > Sent: Wednesday, May 20, 2020 7:11 PM
> >
> > On 11.05.2020 19:43, buy computer wrote:
> > > I've been working on a Windows 10 HVM on a Debian 10 dom0. When I
> > was first
> > > trying to make the VM, I was getting IOMMU errors. I had a hard time
> > > figuring out what to do about this, and finally discovered that putting
> > > iommu=no-igfx in the grub stopped the errors.
> > >
> > > Unfortunately, without the graphics support the VM is understandably
> > slow,
> > > and can crash. I was also only now pointed to the page
> > > <https://xenbits.xen.org/docs/unstable/misc/xen-command-
> > line.html#iommu>
> > > which says to report any errors that get fixed by using iommu=no-igfx.
>
> what is the platform and linux kernel version in this context?
>
>
I'm not sure what you meant by 'platform', so I'll try to cover all the
bases.
Kernel: 4.19.0-9-amd64 GNU/Linux
Debian 10.4
Lenovo E490 ThinkPad
Intel Integrated Graphics 620


> >
> > Thanks for the report. For context I'll quote the commit message of
> > the commit introducing the option as well as the request to report
> > issues fixed with it:
> >
> > "As we still cannot find a proper fix for this problem, this patch adds
> >  iommu=igfx option to control whether Intel graphics IOMMU is enabled.
> >  Running Xen with iommu=no-igfx is similar to running Linux with
> >  intel_iommu=igfx_off, which disables IOMMU for Intel GPU. This can be
> >  used by users to manually workaround the problem before a fix is
> >  available for i915 driver."
> >
> > This was in 2015, referencing Linux >= 3.19. I have no idea whether
> > the underlying driver issue(s) has/have been fixed. The addresses
> > referenced are variable enough and all within RAM, so I'd conclude
> > this is not a "missing RMRR" issue.
>
> Variable enough but not within RAM. From E820:
>
> (XEN)  0000000100000000 - 0000000871800000 (usable)
>
> But the referenced addresses are way higher:
>
> (XEN) [VT-D]DMAR:[DMA Read] Request device [0000:00:02.0] fault
> addr 76c615d000, iommu reg = ffff82c000a0c000
> (XEN) [VT-D]DMAR: reason 06 - PTE Read access is not set
>
> >
> > Cc-ing the VT-d maintainer for possible insights or thoughts.
> >
> > Jan
>
> I don't have other thoughts except the weird addresses. It might be
> good to add some trace in dom0's i915 driver to see whether those
> addresses are intended or not.
>
>
Thanks for the insight! I'd love to help with the trace, but I don't know
how to do that. If you could point me in the right direction, I'd try to
give it a shot.

Thanks
> Kevin
>

Thanks for the insight!

--000000000000a742b305a6721ab9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 25, 2020 at 5:16 AM Tian,=
 Kevin &lt;<a href=3D"mailto:kevin.tian@intel.com" target=3D"_blank">kevin.=
tian@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">&gt; From: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.co=
m" target=3D"_blank">jbeulich@suse.com</a>&gt;<br>
&gt; Sent: Wednesday, May 20, 2020 7:11 PM<br>
&gt; <br>
&gt; On 11.05.2020 19:43, buy computer wrote:<br>
&gt; &gt; I&#39;ve been working on a Windows 10 HVM on a Debian 10 dom0. Wh=
en I<br>
&gt; was first<br>
&gt; &gt; trying to make the VM, I was getting IOMMU errors. I had a hard t=
ime<br>
&gt; &gt; figuring out what to do about this, and finally discovered that p=
utting<br>
&gt; &gt; iommu=3Dno-igfx in the grub stopped the errors.<br>
&gt; &gt;<br>
&gt; &gt; Unfortunately, without the graphics support the VM is understanda=
bly<br>
&gt; slow,<br>
&gt; &gt; and can crash. I was also only now pointed to the page<br>
&gt; &gt; &lt;<a href=3D"https://xenbits.xen.org/docs/unstable/misc/xen-com=
mand-" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/docs/un=
stable/misc/xen-command-</a><br>
&gt; line.html#iommu&gt;<br>
&gt; &gt; which says to report any errors that get fixed by using iommu=3Dn=
o-igfx.<br>
<br>
what is the platform and linux kernel version in this context?<br>
<br></blockquote><div><br></div><div>I&#39;m not sure what you meant by &#3=
9;platform&#39;, so I&#39;ll try to cover all the bases.<br></div><div>Kern=
el: 4.19.0-9-amd64 GNU/Linux<br></div><div>Debian 10.4</div><div>Lenovo E49=
0 ThinkPad</div><div>Intel Integrated Graphics 620<br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Thanks for the report. For context I&#39;ll quote the commit message o=
f<br>
&gt; the commit introducing the option as well as the request to report<br>
&gt; issues fixed with it:<br>
&gt; <br>
&gt; &quot;As we still cannot find a proper fix for this problem, this patc=
h adds<br>
&gt;=C2=A0 iommu=3Digfx option to control whether Intel graphics IOMMU is e=
nabled.<br>
&gt;=C2=A0 Running Xen with iommu=3Dno-igfx is similar to running Linux wit=
h<br>
&gt;=C2=A0 intel_iommu=3Digfx_off, which disables IOMMU for Intel GPU. This=
 can be<br>
&gt;=C2=A0 used by users to manually workaround the problem before a fix is=
<br>
&gt;=C2=A0 available for i915 driver.&quot;<br>
&gt; <br>
&gt; This was in 2015, referencing Linux &gt;=3D 3.19. I have no idea wheth=
er<br>
&gt; the underlying driver issue(s) has/have been fixed. The addresses<br>
&gt; referenced are variable enough and all within RAM, so I&#39;d conclude=
<br>
&gt; this is not a &quot;missing RMRR&quot; issue.<br>
<br>
Variable enough but not within RAM. From E820:<br>
<br>
(XEN)=C2=A0 0000000100000000 - 0000000871800000 (usable)<br>
<br>
But the referenced addresses are way higher:<br>
<br>
(XEN) [VT-D]DMAR:[DMA Read] Request device [0000:00:02.0] fault <br>
addr 76c615d000, iommu reg =3D ffff82c000a0c000<br>
(XEN) [VT-D]DMAR: reason 06 - PTE Read access is not set<br>
<br>
&gt; <br>
&gt; Cc-ing the VT-d maintainer for possible insights or thoughts.<br>
&gt; <br>
&gt; Jan<br>
<br>
I don&#39;t have other thoughts except the weird addresses. It might be<br>
good to add some trace in dom0&#39;s i915 driver to see whether those<br>
addresses are intended or not.<br>
<br></blockquote><div><br></div><div>Thanks for the insight! I&#39;d love t=
o help with the trace, but I don&#39;t know how to do that. If you could po=
int me in the right direction, I&#39;d try to give it a shot. <br></div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks<br>
Kevin<br></blockquote><div><br></div><div>Thanks for the insight! <br></div=
></div></div>

--000000000000a742b305a6721ab9--

