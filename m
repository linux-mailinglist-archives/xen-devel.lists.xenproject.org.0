Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D63731CB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 16:37:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqILI-0008Sj-SJ; Wed, 24 Jul 2019 14:34:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6YCV=VV=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1hqILH-0008Se-PZ
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 14:34:07 +0000
X-Inumbo-ID: 16683c90-ae20-11e9-b630-ebf82f441a0d
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 16683c90-ae20-11e9-b630-ebf82f441a0d;
 Wed, 24 Jul 2019 14:34:06 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 0/2] Raspberry Pi 4 support
Thread-Index: AdVCKTNrhqec33CFSM29ddylSiacxA==
Date: Wed, 24 Jul 2019 14:34:49 +0000
Message-ID: <b947a9eee2bb43d490ddb4f9378f2ff5@dornerworks.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.12.5]
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] Raspberry Pi 4 support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Andre Przywara <andre.przywara@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/mixed; boundary="===============4045915582630519592=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4045915582630519592==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_b947a9eee2bb43d490ddb4f9378f2ff5dornerworkscom_"

--_000_b947a9eee2bb43d490ddb4f9378f2ff5dornerworkscom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is a series to enable printk and UART console for Raspberry Pi 4.

I have been able to get Xen+dom0+domUs booting. Tested with Xen 4.12 and Li=
nux 4.19.y (Raspberry Pi linux tree + a couple of patches). Please see [1] =
for build instructions and limitations.

Andre - it appears that we each independently came up with a printk configu=
ration [2]. With this series, you'd no longer need to remember the base add=
ress, just do CONFIG_EARLY_PRINTK=3Drpi4.

Thanks,
Stewart Hildebrand
DornerWorks, Ltd

[1] https://github.com/dornerworks/xen-rpi4-builder
[2] https://lists.xenproject.org/archives/html/xen-users/2019-07/msg00027.h=
tml

--_000_b947a9eee2bb43d490ddb4f9378f2ff5dornerworkscom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">This is a series to enable printk and UART console f=
or Raspberry Pi 4.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have been able to get Xen&#43;dom0&#43;domUs booti=
ng. Tested with Xen 4.12 and Linux 4.19.y (Raspberry Pi linux tree &#43; a =
couple of patches). Please see [1] for build instructions and limitations.<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Andre &#8211; it appears that we each independently =
came up with a printk configuration [2]. With this series, you&#8217;d no l=
onger need to remember the base address, just do CONFIG_EARLY_PRINTK=3Drpi4=
.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Stewart Hildebrand<o:p></o:p></p>
<p class=3D"MsoNormal">DornerWorks, Ltd<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">[1] <a href=3D"https://github.com/dornerworks/xen-rp=
i4-builder">
https://github.com/dornerworks/xen-rpi4-builder</a><o:p></o:p></p>
<p class=3D"MsoNormal">[2] <a href=3D"https://lists.xenproject.org/archives=
/html/xen-users/2019-07/msg00027.html">
https://lists.xenproject.org/archives/html/xen-users/2019-07/msg00027.html<=
/a><o:p></o:p></p>
</div>
</body>
</html>

--_000_b947a9eee2bb43d490ddb4f9378f2ff5dornerworkscom_--


--===============4045915582630519592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4045915582630519592==--

