Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB859213CE
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 08:39:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRWU2-0000BI-CM; Fri, 17 May 2019 06:36:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UlUR=TR=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hRWU1-0000BD-HW
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 06:36:45 +0000
X-Inumbo-ID: 22e6c30d-786e-11e9-8980-bc764e045a96
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 22e6c30d-786e-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 06:36:44 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id a17so4601966iot.8
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 23:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=nmIYeZSjwNquWLpvvBk5GzqcySZysGrVqBz4TnwSgf8=;
 b=SrR0iZBJwfJDvbWL0xuJnIH7M4rmbuICKZ9D+Ey1aap0b8yzjwk9vKhWcuKpBxhBIR
 gidy2bwzNHdjhYUYeeWEr4/ABOLcw5krmPzLYN3LXijczUVAOmROnH3X0+W2Zi4iJprT
 987blVLRDQIbhnPE08AcUy4ryIyt23nLwHqLtctyF+1Wg1ujLDmudD5ZAx+1PRFnbI6j
 EH7G0GE2c3bc1Rv1YwwWih+FEbTNK6U/zXyZAGmavJYod2WIN6bc+9sLDlqo1iYKWGgP
 4r9iGNrhtcRujil0rpxEEbvZ0VTkHjB+pVd6wyP3qD/njXtZ77inIPFJll1bN8P0gd5U
 J4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=nmIYeZSjwNquWLpvvBk5GzqcySZysGrVqBz4TnwSgf8=;
 b=CxNDLIoImeYXWZlQlZLp6lUIwK9FhpHtAQ4puL2O3oku98r10KAWCDMCncZqVqI5px
 uC8YEQVA0M0tDbYygysCcxRAuc/oT6Q+ND+I6ah0uguJc0Rcswuo8M3ZIMONrx3uzmOh
 FXUD2FMALN33NGN1KKoBIi1/T+dfxV2dJVIxal4AYfbRWTbYJpY6w6B1TdkK5/RIwcmj
 +incfbdZhRwlv5Cn261T/IK+eMsjnz9S9+4Bqthtqs4JLDula1FjZwsn38/N4DacRsI9
 dPVlmG4R0X2H9Nx06ooyFBKqmIOh/UKneMNnzfwg3kv/vuuza0eu+KOMm9WdN0FC11ah
 WoWg==
X-Gm-Message-State: APjAAAWJLtKEKfWLniWkG3DfWYhBUBSI3l+RNPGgO6BCAon3zIKtEA/H
 Wm2VsCnzP8VNWcbMtPxB7uwaelAMssE=
X-Google-Smtp-Source: APXvYqwmWAyDXqVoltrPOu70wXlrz21vEP3e5YQw4QQurV8dMIERArJXT1PlsFO722c9gSM40LgyLA==
X-Received: by 2002:a6b:1494:: with SMTP id 142mr15298257iou.199.1558075003372; 
 Thu, 16 May 2019 23:36:43 -0700 (PDT)
Received: from [100.64.72.13] ([205.185.206.113])
 by smtp.gmail.com with ESMTPSA id k7sm2485447ioh.36.2019.05.16.23.36.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 23:36:42 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16F156)
In-Reply-To: <20190513153414.GU2798@zion.uk.xensource.com>
Date: Fri, 17 May 2019 02:36:41 -0400
Message-Id: <26874323-BD77-48C7-AA7F-83B964CDDBEC@gmail.com>
References: <20190513153414.GU2798@zion.uk.xensource.com>
To: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [Xen-devel] Anyone using blktap2?
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Olaf Hering <olaf@aepfle.de>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Alistair Francis <alistair.francis@xilinx.com>
Content-Type: multipart/mixed; boundary="===============1561318555218019052=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1561318555218019052==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-77EA62B2-00E8-477C-BB1D-F51E1C2B8366
Content-Transfer-Encoding: 7bit


--Apple-Mail-77EA62B2-00E8-477C-BB1D-F51E1C2B8366
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

> On May 13, 2019, at 11:34, Wei Liu <wei.liu2@citrix.com> wrote:
>=20
> Hello
>=20
> Seeing that you were the last people who changed blktap2 in a meaningful
> way: do you use it at all?

As discussed F2F in a Xen Summit 2017 design session: OpenXT and Citrix XenS=
erver use blktap. VHD encryption support was recently upstreamed from OpenXT=
 to the Citrix-maintained repo [1] for blktap3 [2], now used by OpenXT.  Pri=
or versions of OpenXT use blktap2.

Citrix changed the license of XAPI blktap from GPL to BSD, to enable non-OSS=
 features in the paid version of XenServer. The XAPI blktap repo is actively=
 maintained, with dozens of commits in 2018 and 2019, the most recent being t=
his week.

If the XAPI [3] blktap repos are part of Xen Project, should LibXL support a=
 Xen Project feature that is actively maintained and shipping in production s=
ystems? Does the blktap3 repo [1] need to be separated from XAPI?  Perhaps a=
 topic for discussion at the upcoming Xen Summit.

> I'm thinking about dropping it (again).

What would be the proposed mechanism for Xen VM block storage backed by thin=
-provisioned VHD files with per-VM encryption keys? This capability was suff=
iciently valuable to be upstreamed by Citrix, from OpenXT to Xen Project XAP=
I in 2018. =20

With the imminent arrival of Windows Hyper-V and WSL2 Linux 4.19 on develope=
r desktops, VHD support (i.e. Microsoft storage interoperability) in Xen may=
 be a feature to improve rather than remove.

Rich

[1] https://github.com/xapi-project/blktap

[2] https://wiki.xenproject.org/wiki/Blktap3

[3] https://xenproject.org/developers/teams/xen-api/


--Apple-Mail-77EA62B2-00E8-477C-BB1D-F51E1C2B8366
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><div dir=3D"ltr"><span></span></div><div dir=3D"ltr"><meta http-eq=
uiv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr"=
></div><div dir=3D"ltr">On May 13, 2019, at 11:34, Wei Liu &lt;<a href=3D"ma=
ilto:wei.liu2@citrix.com">wei.liu2@citrix.com</a>&gt; wrote:</div><div dir=3D=
"ltr"><br></div><blockquote type=3D"cite"><div dir=3D"ltr"><span>Hello</span=
><br><span></span><br><span>Seeing that you were the last people who changed=
 blktap2 in a meaningful</span><br><span>way: do you use it at all?</span><b=
r></div></blockquote><div><br></div><span style=3D"background-color: rgba(25=
5, 255, 255, 0);">As discussed F2F in a Xen Summit 2017 design session: Open=
XT and Citrix XenServer use blktap. VHD encryption support was recently upst=
reamed from OpenXT to the Citrix-maintained repo [1] for blktap3 [2], now us=
ed by OpenXT. &nbsp;Prior versions of OpenXT use blktap2.</span></div><div d=
ir=3D"ltr"><div><span style=3D"background-color: rgba(255, 255, 255, 0);"><b=
r></span></div><div><span style=3D"background-color: rgba(255, 255, 255, 0);=
">Citrix changed the license of XAPI blktap from GPL to BSD, to enable non-O=
SS features in the paid version of XenServer. The XAPI blktap repo is active=
ly maintained, with dozens of commits in 2018 and 2019, the most recent bein=
g this week.</span></div><div><br></div><div>If the XAPI [3] blktap repos ar=
e part of Xen Project, should LibXL support a Xen Project feature that is ac=
tively maintained and shipping in production systems? Does the blktap3 repo [=
1] need to be separated from XAPI? &nbsp;Perhaps a topic for discussion at t=
he upcoming Xen Summit.<br><div><br><blockquote type=3D"cite"><div dir=3D"lt=
r"><span></span><span>I'm thinking about dropping it (again).</span><br></di=
v></blockquote><div><br></div><div>What would be the proposed mechanism for X=
en VM block storage backed by thin-provisioned VHD files with per-VM encrypt=
ion keys? This capability was sufficiently valuable to be upstreamed by Citr=
ix, from OpenXT to Xen Project XAPI in 2018. &nbsp;</div><div><br></div><div=
>With the imminent arrival of Windows Hyper-V and WSL2 Linux 4.19 on develop=
er desktops, VHD support (i.e. Microsoft storage interoperability) in Xen ma=
y be a feature to improve rather than remove.</div><div><br></div>Rich</div>=
<div><br></div><div>[1]&nbsp;<a href=3D"https://github.com/xapi-project/blkt=
ap">https://github.com/xapi-project/blktap</a></div><div><br></div><div><div=
><span style=3D"background-color: rgba(255, 255, 255, 0);">[2]&nbsp;<a href=3D=
"https://wiki.xenproject.org/wiki/Blktap3">https://wiki.xenproject.org/wiki/=
Blktap3</a></span></div></div><div><br></div></div><div>[3]&nbsp;<a href=3D"=
https://xenproject.org/developers/teams/xen-api/">https://xenproject.org/dev=
elopers/teams/xen-api/</a></div><div><br></div></div></div></body></html>=

--Apple-Mail-77EA62B2-00E8-477C-BB1D-F51E1C2B8366--


--===============1561318555218019052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1561318555218019052==--

