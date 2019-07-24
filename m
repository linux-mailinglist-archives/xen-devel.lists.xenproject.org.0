Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC96731C3
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 16:36:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqILM-0008TQ-6N; Wed, 24 Jul 2019 14:34:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6YCV=VV=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1hqILK-0008TA-BE
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 14:34:10 +0000
X-Inumbo-ID: 17f89ac8-ae20-11e9-a16f-f7ba656d03fe
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 17f89ac8-ae20-11e9-a16f-f7ba656d03fe;
 Wed, 24 Jul 2019 14:34:08 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/2] xen/arm: Early printk configuration for Raspberry Pi
 4
Thread-Index: AdVCHz+4Oay0rJuLRqKQ+/c1ot3tiw==
Date: Wed, 24 Jul 2019 14:34:51 +0000
Message-ID: <070c33cd72a6413194ff524af9ad6c4a@dornerworks.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.12.5]
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] xen/arm: Early printk configuration for
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/mixed; boundary="===============5843107505500920966=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5843107505500920966==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_070c33cd72a6413194ff524af9ad6c4adornerworkscom_"

--_000_070c33cd72a6413194ff524af9ad6c4adornerworkscom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
---
docs/misc/arm/early-printk.txt | 1 +
xen/arch/arm/Rules.mk          | 1 +
2 files changed, 2 insertions(+)

diff --git a/docs/misc/arm/early-printk.txt b/docs/misc/arm/early-printk.tx=
t
index 89e081e51e..8af5a90695 100644
--- a/docs/misc/arm/early-printk.txt
+++ b/docs/misc/arm/early-printk.txt
@@ -49,6 +49,7 @@ the name of the machine:
   - mvebu: printk with the MVEBU for Marvell Armada 3700 SoCs
   - omap5432: printk with UART3 on TI OMAP5432 processors
   - rcar3: printk with SCIF2 on Renesas R-Car Gen3 processors
+  - rpi4: printk with 8250 for Raspberry Pi 4
   - seattle: printk with pl011 for AMD Seattle processor
   - sun6i: printk with 8250 on Allwinner A31 processors
   - sun7i: printk with 8250 on Allwinner A20 processors
diff --git a/xen/arch/arm/Rules.mk b/xen/arch/arm/Rules.mk
index 3d9a0ed357..2cad1f5224 100644
--- a/xen/arch/arm/Rules.mk
+++ b/xen/arch/arm/Rules.mk
@@ -39,6 +39,7 @@ EARLY_PRINTK_midway         :=3D pl011,0xfff36000
EARLY_PRINTK_mvebu          :=3D mvebu,0xd0012000
EARLY_PRINTK_omap5432       :=3D 8250,0x48020000,2
EARLY_PRINTK_rcar3          :=3D scif,0xe6e88000
+EARLY_PRINTK_rpi4           :=3D 8250,0xfe215040,2
EARLY_PRINTK_seattle        :=3D pl011,0xe1010000
EARLY_PRINTK_sun6i          :=3D 8250,0x01c28000,2
EARLY_PRINTK_sun7i          :=3D 8250,0x01c28000,2
--
2.22.0

--_000_070c33cd72a6413194ff524af9ad6c4adornerworkscom_
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
<p class=3D"MsoNormal">docs/misc/arm/early-printk.txt | 1 &#43;<o:p></o:p><=
/p>
<p class=3D"MsoNormal">xen/arch/arm/Rules.mk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | 1 &#43;<o:p></o:p></p>
<p class=3D"MsoNormal">2 files changed, 2 insertions(&#43;)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/docs/misc/arm/early-printk.txt b/docs/m=
isc/arm/early-printk.txt<o:p></o:p></p>
<p class=3D"MsoNormal">index 89e081e51e..8af5a90695 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/docs/misc/arm/early-printk.txt<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/docs/misc/arm/early-printk.txt<o:p=
></o:p></p>
<p class=3D"MsoNormal">@@ -49,6 &#43;49,7 @@ the name of the machine:<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; - mvebu: printk with the MVEBU for Marv=
ell Armada 3700 SoCs<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; - omap5432: printk with UART3 on TI OMA=
P5432 processors<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; - rcar3: printk with SCIF2 on Renesas R=
-Car Gen3 processors<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&nbsp; - rpi4: printk with 8250 for Raspberry P=
i 4<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; - seattle: printk with pl011 for AMD Se=
attle processor<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; - sun6i: printk with 8250 on Allwinner =
A31 processors<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; - sun7i: printk with 8250 on Allwinner =
A20 processors<o:p></o:p></p>
<p class=3D"MsoNormal">diff --git a/xen/arch/arm/Rules.mk b/xen/arch/arm/Ru=
les.mk<o:p></o:p></p>
<p class=3D"MsoNormal">index 3d9a0ed357..2cad1f5224 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/xen/arch/arm/Rules.mk<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/xen/arch/arm/Rules.mk<o:p></o:p></=
p>
<p class=3D"MsoNormal">@@ -39,6 &#43;39,7 @@ EARLY_PRINTK_midway&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :=3D pl011,0xfff36000<o:p></o:p></p>
<p class=3D"MsoNormal">EARLY_PRINTK_mvebu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; :=3D mvebu,0xd0012000<o:p></o:p></p>
<p class=3D"MsoNormal">EARLY_PRINTK_omap5432&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; :=3D 8250,0x48020000,2<o:p></o:p></p>
<p class=3D"MsoNormal">EARLY_PRINTK_rcar3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; :=3D scif,0xe6e88000<o:p></o:p></p>
<p class=3D"MsoNormal">&#43;EARLY_PRINTK_rpi4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :=3D 8250,0xfe215040,2<o:p></o:p></p>
<p class=3D"MsoNormal">EARLY_PRINTK_seattle&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; :=3D pl011,0xe1010000<o:p></o:p></p>
<p class=3D"MsoNormal">EARLY_PRINTK_sun6i&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; :=3D 8250,0x01c28000,2<o:p></o:p></p>
<p class=3D"MsoNormal">EARLY_PRINTK_sun7i&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; :=3D 8250,0x01c28000,2<o:p></o:p></p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">2.22.0<o:p></o:p></p>
</div>
</body>
</html>

--_000_070c33cd72a6413194ff524af9ad6c4adornerworkscom_--


--===============5843107505500920966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5843107505500920966==--

