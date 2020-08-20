Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 635E924BDB9
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 15:11:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8kL7-0002Ph-GJ; Thu, 20 Aug 2020 13:10:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l9zO=B6=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1k8kL6-0002Pc-MS
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 13:10:44 +0000
X-Inumbo-ID: 79fdcfe8-2bf9-428f-b431-6f160ea7008e
Received: from mail-qt1-x82f.google.com (unknown [2607:f8b0:4864:20::82f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79fdcfe8-2bf9-428f-b431-6f160ea7008e;
 Thu, 20 Aug 2020 13:10:43 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id o22so1080859qtt.13
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2020 06:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:message-id:date
 :cc:to; bh=fy6qGnrszhTfn29nawr4XBuCHxMCmKJ01S9I3rIbL3o=;
 b=C1iXgtFjmJC5q2Kl62D1BLxUh1Gg8g7MtFXsKPPsQFJIV6r+H8rLkf4KwvB9uYH9gJ
 3GCp5pfDRe6/bPbYY+6mecqBhlMmnD42z2C5TMvkuUd2j6edra4KLNdvP8eug/SNspCL
 7/RFfWFCrduSYMsVcV5qxZa9byvxchBBk4T307WckPOm9QtIRIXIlkWlLOlHyg3xSJAA
 JxbZfyy3VTqpLnP0adsqVeJJLKsnDyDDSg8hX1RdWX7E0rhc5tplCyKgTP7q4hIDjYgb
 wmvQs/gDvPrLH0etTCjlLcgTo5mXwT0xEmA7q8PgY8i7+Y5pDaS4SOmPTHHVda+mTtaC
 i7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:message-id:date:cc:to;
 bh=fy6qGnrszhTfn29nawr4XBuCHxMCmKJ01S9I3rIbL3o=;
 b=muaJGAgk7QBo7d2lTBJ46uZ43PRLBFX/ySW3KxHViZuLW77hCA+uJ4m4YmuiAhCH0c
 bBHVZD3y4a4WUDQykQfnUJtmFWkz6mlaLl52OcPUeNelIcRlKGxUXch5KQT2C9jQRTGY
 mwbI3ryh1M4FMCsTNY/yJTWMJ36GwSOyvckOTbRG4z1N4zOAY04r8hIjd1z3mr5GgVLf
 9+KLigRQIglzxd1WTXIpOPEobFw4R5OOKa5RU7WqHNnoOGFYoGB3HeQuQO3U1/7aVE0A
 4I+SnX+IVe41qpkqNwpNEzW9WzukinqgYmhDZdbgffklGeTnvcVPUAhR/CuAvyhtS678
 3Kcw==
X-Gm-Message-State: AOAM531k75JRnQyVbxnRazBWW0rX10NIF62RvxNxxLe+A/gAQpz0mJRF
 xRGa3NaPApaBrW8gMFG+1/w=
X-Google-Smtp-Source: ABdhPJyT5lR0/7v4VNTtVi4eG7mEBNphx8BLW8RXPbYUCfb1fzCQM/En9yeXEV41zjOrW9J3KUGjcA==
X-Received: by 2002:ac8:7a66:: with SMTP id w6mr2623801qtt.242.1597929042797; 
 Thu, 20 Aug 2020 06:10:42 -0700 (PDT)
Received: from [100.64.72.4] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id c142sm2187546qkg.71.2020.08.20.06.10.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 06:10:41 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-03E7313D-6BB6-42CA-B2D3-8941D2B8ABE0
Content-Transfer-Encoding: 7bit
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re:  Xen 4.14.0 fails on Dell IoT Gateway without efi=no-rs
Message-Id: <E5E6537A-3F6C-40C6-87AB-09546225F93D@gmail.com>
Date: Thu, 20 Aug 2020 09:10:40 -0400
Cc: Jan Beulich <JBeulich@suse.com>, Roman Shaposhnik <roman@zededa.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 =?utf-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: George Dunlap <dunlapg@umich.edu>
X-Mailer: iPhone Mail (17G68)
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


--Apple-Mail-03E7313D-6BB6-42CA-B2D3-8941D2B8ABE0
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Aug 20, 2020, at 07:24, George Dunlap <dunlapg@umich.edu> wrote:
> =EF=BB=BF
>> On Thu, Aug 20, 2020 at 9:35 AM Jan Beulich <jbeulich@suse.com> wrote:
>=20
>>=20
>> As far as making cases like this work by default, I'm afraid it'll
>> need to be proposed to replace me as the maintainer of EFI code in
>> Xen. I will remain on the position that it is not acceptable to
>> apply workarounds for firmware issues by default unless they're
>> entirely benign to spec-conforming systems. DMI data based enabling
>> of workarounds, for example, is acceptable in the common case, as
>> long as the matching pattern isn't unreasonably wide.
>=20
>=20
> It sort of sounds like it would be useful to have a wider discussion on th=
is then, to hash out what exactly it is we want to do as a project.
>=20
>  -George

Sometimes a middle ground is possible, e.g. see this Nov 2019 thread about a=
 possible Xen Kconfig option for EFI_NONSPEC_COMPATIBILITY, targeting Edge/I=
oT/laptop hardware:

https://lists.archive.carbon60.com/xen/devel/571670#571670

In the years to come, edge devices will only grow in numbers.  Some will be s=
upported in production for more than a decade, which will require new long-t=
erm commercial support mechanisms for device BIOS, rather than firmware engi=
neers shifting focus after a device is launched.=20

In parallel to (opt-in) Xen workarounds for a constrained and documented set=
 of firmware issues, we need more industry efforts to support open firmware,=
 like coreboot and OCP Open System Firmware with minimum binary blobs.  At l=
east one major x86 OEM is expected to ship open firmware in one of their pop=
ular devices, which may encourage competing OEM devices to follow.

PC Engines APU2 (dual-core AMD, 4GB RAM, 6W TDP, triple NIC + LTE) is one av=
ailable edge device which supports Xen and has open (coreboot) firmware.  It=
 would be nice to include APU2 in LF Edge support, if only to provide compet=
ition to OEM devices with buggy firmware. Upcoming Intel Tiger Lake (Core) a=
nd Elkhart Lake (Atom Tremont) are expected to expand edge-relevant security=
 features, which would make such devices attractive to Xen deployments. =20

We also need edge software vendors to encourage device OEMs to enable open f=
irmware via coreboot, OCP OSF, Intel MinPlatform and similar programs. See h=
ttps://software.intel.com/content/www/us/en/develop/articles/minimum-platfor=
m-architecture-open-source-uefi-firmware-for-intel-based-platforms.html and o=
ther talks from the open firmware conference, https://osfc.io/archive

Rich


--Apple-Mail-03E7313D-6BB6-42CA-B2D3-8941D2B8ABE0
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">On Aug 20, 2020, at 07:24,=
 George Dunlap &lt;dunlapg@umich.edu&gt; wrote:<div dir=3D"ltr"><blockquote t=
ype=3D"cite"><br></blockquote></div><blockquote type=3D"cite"><div dir=3D"lt=
r">=EF=BB=BF<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Aug 20, 2020 at 9:35 A=
M Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>=
&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><br>
As far as making cases like this work by default, I'm afraid it'll<br>
need to be proposed to replace me as the maintainer of EFI code in<br>
Xen. I will remain on the position that it is not acceptable to<br>
apply workarounds for firmware issues by default unless they're<br>
entirely benign to spec-conforming systems. DMI data based enabling<br>
of workarounds, for example, is acceptable in the common case, as<br>
long as the matching pattern isn't unreasonably wide.<br></blockquote></div>=
<div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">It sort of s=
ounds like it would be useful to have a wider discussion on this then, to ha=
sh out what exactly it is we want to do as a project.</div><div class=3D"gma=
il_quote"><br></div><div class=3D"gmail_quote">&nbsp;-George<br></div></div>=

</div></blockquote><div><br></div>Sometimes a middle ground is possible, e.g=
. see this Nov 2019 thread about a possible Xen Kconfig option for EFI_NONSP=
EC_COMPATIBILITY, targeting Edge/IoT/laptop hardware:<div><br></div><div><a h=
ref=3D"https://lists.archive.carbon60.com/xen/devel/571670#571670">https://l=
ists.archive.carbon60.com/xen/devel/571670#571670</a><br><div><br></div><div=
>In the years to come, edge devices will only grow in numbers. &nbsp;Some wi=
ll be supported in production for more than a decade, which will require new=
 long-term commercial support mechanisms for device BIOS, rather than firmwa=
re engineers shifting focus after a device is launched.&nbsp;</div><div><br>=
</div><div>In parallel to (opt-in) Xen workarounds for a constrained and doc=
umented set of firmware issues, we need more industry efforts to support ope=
n firmware, like coreboot and OCP Open System Firmware with minimum binary b=
lobs. &nbsp;At least one major x86 OEM is expected to ship open firmware in o=
ne of their popular devices, which may encourage competing OEM devices to fo=
llow.</div><div><br></div><div>PC Engines APU2 (dual-core AMD, 4GB RAM, 6W T=
DP, triple NIC + LTE) is one available edge device which supports Xen and ha=
s open (coreboot) firmware. &nbsp;It would be nice to include APU2 in LF Edg=
e support, if only to provide competition to OEM devices with buggy firmware=
. Upcoming Intel Tiger Lake (Core) and Elkhart Lake (Atom Tremont) are expec=
ted to expand edge-relevant security features, which would make such devices=
 attractive to Xen deployments. &nbsp;</div><div><br></div><div>We also need=
 edge software vendors to encourage device OEMs to enable open firmware via c=
oreboot, OCP OSF, Intel MinPlatform and similar programs. See&nbsp;<a href=3D=
"https://software.intel.com/content/www/us/en/develop/articles/minimum-platf=
orm-architecture-open-source-uefi-firmware-for-intel-based-platforms.html">h=
ttps://software.intel.com/content/www/us/en/develop/articles/minimum-platfor=
m-architecture-open-source-uefi-firmware-for-intel-based-platforms.html</a>&=
nbsp;and&nbsp;<span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);=
">other talks from the open firmware conference,&nbsp;</span><a href=3D"http=
s://osfc.io/archive">https://osfc.io/archive</a></div><div><br><div>Rich<div=
><br></div></div></div></div></div></body></html>=

--Apple-Mail-03E7313D-6BB6-42CA-B2D3-8941D2B8ABE0--

