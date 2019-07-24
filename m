Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA48F731CA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 16:37:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqILO-0008UL-Gz; Wed, 24 Jul 2019 14:34:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6YCV=VV=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1hqILM-0008Tp-Hr
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 14:34:12 +0000
X-Inumbo-ID: 19ebcdbe-ae20-11e9-8335-cfc0cc57503f
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 19ebcdbe-ae20-11e9-8335-cfc0cc57503f;
 Wed, 24 Jul 2019 14:34:11 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 2/2] ns16550: Add compatible string for Raspberry Pi 4
Thread-Index: AdVCH0zvm4IVJ9cXSpCV8aDAdR4thg==
Date: Wed, 24 Jul 2019 14:34:55 +0000
Message-ID: <f2ec25b534e948389926eb21488cb7a0@dornerworks.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.12.5]
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] ns16550: Add compatible string for
 Raspberry Pi 4
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: multipart/mixed; boundary="===============6664293885133393541=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6664293885133393541==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_f2ec25b534e948389926eb21488cb7a0dornerworkscom_"

--_000_f2ec25b534e948389926eb21488cb7a0dornerworkscom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
---
xen/drivers/char/ns16550.c | 1 +
1 file changed, 1 insertion(+)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index e518f2d790..c8d7c9b710 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1611,6 +1611,7 @@ static const struct dt_device_match ns16550_dt_match[=
] __initconst =3D
     DT_MATCH_COMPATIBLE("ns16550"),
     DT_MATCH_COMPATIBLE("ns16550a"),
     DT_MATCH_COMPATIBLE("snps,dw-apb-uart"),
+    DT_MATCH_COMPATIBLE("brcm,bcm2835-aux-uart"),
     { /* sentinel */ },
};
--
2.22.0

--_000_f2ec25b534e948389926eb21488cb7a0dornerworkscom_
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
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<p class=3D"MsoNormal">Signed-off-by: Stewart Hildebrand &lt;stewart.hildeb=
rand@dornerworks.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">xen/drivers/char/ns16550.c | 1 &#43;<o:p></o:p></p>
<p class=3D"MsoNormal">1 file changed, 1 insertion(&#43;)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/xen/drivers/char/ns16550.c b/xen/driver=
s/char/ns16550.c<o:p></o:p></p>
<p class=3D"MsoNormal">index e518f2d790..c8d7c9b710 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/xen/drivers/char/ns16550.c<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/xen/drivers/char/ns16550.c<o:p></o=
:p></p>
<p class=3D"MsoNormal">@@ -1611,6 &#43;1611,7 @@ static const struct dt_dev=
ice_match ns16550_dt_match[] __initconst =3D<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; DT_MATCH_COMPATIBLE(&quot;n=
s16550&quot;),<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; DT_MATCH_COMPATIBLE(&quot;n=
s16550a&quot;),<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; DT_MATCH_COMPATIBLE(&quot;s=
nps,dw-apb-uart&quot;),<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp; DT_MATCH_COMPATIBLE(&quot;br=
cm,bcm2835-aux-uart&quot;),<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; { /* sentinel */ },<o:p></o=
:p></p>
<p class=3D"MsoNormal">};<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.22.0<o:p></o:p></p>
</div>
</body>
</html>

--_000_f2ec25b534e948389926eb21488cb7a0dornerworkscom_--


--===============6664293885133393541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6664293885133393541==--

