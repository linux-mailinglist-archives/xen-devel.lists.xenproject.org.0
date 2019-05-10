Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F55119649
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 03:46:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOuZV-0005cx-GF; Fri, 10 May 2019 01:43:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wFgn=TK=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hOuZT-0005cs-UU
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 01:43:36 +0000
X-Inumbo-ID: 05a75904-72c5-11e9-8980-bc764e045a96
Received: from mail-yw1-xc2b.google.com (unknown [2607:f8b0:4864:20::c2b])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 05a75904-72c5-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 01:43:34 +0000 (UTC)
Received: by mail-yw1-xc2b.google.com with SMTP id n188so3510461ywe.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2019 18:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=LfT54QI8QF9S4xt/6ro67yLPP8YEbt2v9mVyjE4epYw=;
 b=gwnu0SjXqBKIIivmyadwqcoFqxsCpPhrppqTASqgurbOzg4alaysL3XhNDRtmnUq9j
 rrtnuluyuc5yyykkNW0XeUAhBQIh3WUW9nsvkxroKwg/5yig1LBto9mykWzn6pSh7cLJ
 bOwHs507QqI/Vaw67zkYvmlFA16rtbvgIkiKkBVMV8Sxp5I7+HlLhdhY42Gtofh7T0jn
 vVHdkjr0r66C+dSkkuP5W6vkh9kM1itvmFbdYfHXgR7w8aTXl5ZR5u2+gQCArc0707V8
 NnWGTD8XfHhPbQfXIINPYqzH6LlOdCh7CmmLADQJYK9YfWIjNyXeZL53/A6+8/zLOEv1
 IOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=LfT54QI8QF9S4xt/6ro67yLPP8YEbt2v9mVyjE4epYw=;
 b=WFtiyxIBi5uBPKPWISQqEIJ9wynjffT767BNEWph+QziWrJJWIR9e+2fIpQhSx/5bu
 XiEWo56HgZtIKOKXnFVXlaggeEi4ugdz2yuLJuRPC+7an46YNxTqjNyFd4cHH7Qz1fcR
 trTiikaFIco+itQFU17z8mhZWX+3l1eenNjZXn2YLnOovwUj8qgKh/oymgZ6bD5dRoCO
 E+K/faZsyDwzER5tdMseSxqvu2stTYQjhfB7wYObY2i+F/2ldu4AtiiuJMNcxfHsDE8Y
 bB6oezCUtdgK7lFRCzGdKxZ7ltpMc8uo13Bbfy6XveU9wpbYtVLb7BtxmBguVmroong6
 A6JQ==
X-Gm-Message-State: APjAAAUdvErY//8CAHNZRwQOtLaubse+lPYLu3Ey7ApXt+4SLvnR0iS8
 FMnPer0fbTdVAU7Hm1Hx80M=
X-Google-Smtp-Source: APXvYqx5lQ9pnKdUp/xLTn4B0WaUhULe2Z+JRAeVvcoAJVNyfZJPhIIex4t5Js2/4hZB5CXJ7kYIhg==
X-Received: by 2002:a81:3a49:: with SMTP id h70mr4060556ywa.58.1557452613613; 
 Thu, 09 May 2019 18:43:33 -0700 (PDT)
Received: from [100.64.77.67] ([173.245.206.154])
 by smtp.gmail.com with ESMTPSA id l12sm964962ywb.60.2019.05.09.18.43.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 18:43:32 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16E227)
In-Reply-To: <9FCB2022-A547-4FA2-88E7-91DA3C023438@gmail.com>
Date: Thu, 9 May 2019 21:43:31 -0400
Message-Id: <E687A54C-0781-4674-A7F9-F62064E9B310@gmail.com>
References: <9FCB2022-A547-4FA2-88E7-91DA3C023438@gmail.com>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [Xen-devel] Guest Testing in OSSTEST - What distros and
 versions should we test against
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Committers <committers@xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============8445420346765020179=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8445420346765020179==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-0CDF994F-B649-41EC-8B66-7851827E717E
Content-Transfer-Encoding: 7bit


--Apple-Mail-0CDF994F-B649-41EC-8B66-7851827E717E
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

> On May 9, 2019, at 21:28, Lars Kurth <lars.kurth.xen@gmail.com> wrote:
>=20
> Hi all,
>=20
> following a discussion with committers about Guest testing in OSSTEST, it s=
urfaced that we have not updated what distros we test in OSSTEST for a very l=
ong time. All agreed that we should regularly review what we test against: m=
aybe at the beginning of a release cycle
>=20
> In any case, currently we test against
>=20
> x86 HVM guests:
>  debian-9.4.0-{i386,amd64}-CD-1.iso
>  rhel-server-6.1-i386-dvd.iso
>  win10v1703-x86.iso
>  win7-x64.iso
>  ws16-x64.iso
>  FreeBSD-10.1-CUSTOM-{i386,amd64}-20150525.raw.xz
>  Debian HVM {i386,amd64} via debian-installer netinst [1]
>=20
> x86 PV guests:
>  Debian PV {i386,amd64} via debian-installer netinst [1]
>=20
> ARM guests:
>  Debian PV via debian-installer netinst [1]
>=20
> [1] whatever Debian release osstest itself mostly runs
>=20
> So I am opening the floor to suggestions.
>=20
> With regards to Windows testing we have some restrictions. We have tried s=
everal times to buy additional test licenses, but this never went anywhere (=
some of the VM licenses are not available for our environment, unless you bu=
lk buy, which is very expensive). The only approach that would allow us to t=
est against different windows versions would be to require everyone who may t=
ouch OSSTEST which is not doable.

Are the 90-day test/eval versions of Windows incompatible with OSSTEST?

  https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise
  https://www.microsoft.com/en-us/evalcenter/

Rich=

--Apple-Mail-0CDF994F-B649-41EC-8B66-7851827E717E
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><div dir=3D"ltr"></div><div dir=3D"ltr">On May 9, 2019, at 21:28, L=
ars Kurth &lt;<a href=3D"mailto:lars.kurth.xen@gmail.com">lars.kurth.xen@gma=
il.com</a>&gt; wrote:</div><div dir=3D"ltr"><br></div><blockquote type=3D"ci=
te"><div dir=3D"ltr"><span>Hi all,</span><br><span></span><br><span>followin=
g a discussion with committers about Guest testing in OSSTEST, it surfaced t=
hat we have not updated what distros we test in OSSTEST for a very long time=
. All agreed that we should regularly review what we test against: maybe at t=
he beginning of a release cycle</span><br><span></span><br><span>In any case=
, currently we test against</span><br><span></span><br><span>x86 HVM guests:=
</span><br><span> &nbsp;debian-9.4.0-{i386,amd64}-CD-1.iso</span><br><span> &=
nbsp;rhel-server-6.1-i386-dvd.iso</span><br><span> &nbsp;win10v1703-x86.iso<=
/span><br><span> &nbsp;win7-x64.iso</span><br><span> &nbsp;ws16-x64.iso</spa=
n><br><span> &nbsp;FreeBSD-10.1-CUSTOM-{i386,amd64}-20150525.raw.xz</span><b=
r><span> &nbsp;Debian HVM {i386,amd64} via debian-installer netinst [1]</spa=
n><br><span></span><br><span>x86 PV guests:</span><br><span> &nbsp;Debian PV=
 {i386,amd64} via debian-installer netinst [1]</span><br><span></span><br><s=
pan>ARM guests:</span><br><span> &nbsp;Debian PV via debian-installer netins=
t [1]</span><br><span></span><br><span>[1] whatever Debian release osstest i=
tself mostly runs</span><br><span></span><br><span>So I am opening the floor=
 to suggestions.</span><br><span></span><br><span>With regards to Windows te=
sting we have some restrictions. We have tried several times to buy addition=
al test licenses, but this never went anywhere (some of the VM licenses are n=
ot available for our environment, unless you bulk buy, which is very expensi=
ve). The only approach that would allow us to test against different windows=
 versions would be to require everyone who may touch OSSTEST which is not do=
able.</span><br></div></blockquote><br><div>Are the 90-day test/eval version=
s of Windows incompatible with OSSTEST?</div><div><br></div><div>&nbsp;&nbsp=
;<a href=3D"https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-e=
nterprise">https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-en=
terprise</a></div><div>&nbsp;&nbsp;<a href=3D"https://www.microsoft.com/en-u=
s/evalcenter/">https://www.microsoft.com/en-us/evalcenter/</a></div><div><br=
></div><div>Rich</div></div></body></html>=

--Apple-Mail-0CDF994F-B649-41EC-8B66-7851827E717E--


--===============8445420346765020179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8445420346765020179==--

