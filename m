Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F24AE13D3C8
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 06:33:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irxhj-0002Yq-Dk; Thu, 16 Jan 2020 05:28:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9JMe=3E=infopulse.com=ivan.sheihets@srs-us1.protection.inumbo.net>)
 id 1irm7H-0000gE-6E
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 17:06:03 +0000
X-Inumbo-ID: 44fdf946-37b9-11ea-a985-bc764e2007e4
Received: from mail1-vm-srv.infopulse.com (unknown [195.250.62.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44fdf946-37b9-11ea-a985-bc764e2007e4;
 Wed, 15 Jan 2020 17:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail1-vm-srv.infopulse.com (Postfix) with ESMTP id 07BC52A68DC
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 19:05:45 +0200 (EET)
X-Virus-Scanned: amavisd-new at infopulse.com.ua
Received: from mail1-vm-srv.infopulse.com ([127.0.0.1])
 by localhost (mail1-vm-srv.infopulse.com.ua [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id 8VeqOB5ItAFS for <xen-devel@lists.xenproject.org>;
 Wed, 15 Jan 2020 19:05:43 +0200 (EET)
Received: from ex1-vm.infopulse.local (ex1-vm.infopulse.local [172.27.148.103])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail1-vm-srv.infopulse.com (Postfix) with ESMTPS id 6611A2A68D3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 19:05:43 +0200 (EET)
Received: from ex2-vm.infopulse.local (172.27.148.104) by
 ex1-vm.infopulse.local (172.27.148.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1847.3; Wed, 15 Jan 2020 19:05:42 +0200
Received: from ex2-vm.infopulse.local ([fe80::84d7:5545:848:6b54]) by
 ex2-vm.infopulse.local ([fe80::84d7:5545:848:6b54%5]) with mapi id
 15.01.1847.003; Wed, 15 Jan 2020 19:05:42 +0200
From: Ivan Sheihets <Ivan.Sheihets@infopulse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: Raspberry pi4
Thread-Index: AdXLxdjYF8JmwHhISwSy+j9K5Lq3iQ==
Date: Wed, 15 Jan 2020 17:05:42 +0000
Message-ID: <9dc4022c93cc4552a71d6d21407b6cc4@infopulse.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.148.81]
MIME-Version: 1.0
X-BitDefender-Scanner: Clean, Agent: BitDefender Milter 3.1.7 on
 mail1-vm-srv.infopulse.com, sigver: 7.83490
X-Mailman-Approved-At: Thu, 16 Jan 2020 05:28:26 +0000
Subject: [Xen-devel] Raspberry pi4
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
Content-Type: multipart/mixed; boundary="===============4420058452084221106=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4420058452084221106==
Content-Language: en-US
Content-Type: multipart/related;
	boundary="_004_9dc4022c93cc4552a71d6d21407b6cc4infopulsecom_";
	type="multipart/alternative"

--_004_9dc4022c93cc4552a71d6d21407b6cc4infopulsecom_
Content-Type: multipart/alternative;
	boundary="_000_9dc4022c93cc4552a71d6d21407b6cc4infopulsecom_"

--_000_9dc4022c93cc4552a71d6d21407b6cc4infopulsecom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello guys,

Does anyone run Xen on RPi4 and can help?
I just found https://www.mail-archive.com/xen-devel@lists.xenproject.org/ms=
g50685.html but there doesn't work HDMI and memory limitation.

Best regards,
Ivan Sheihets
Infopulse Ukraine
+38-097-913-10-01

[cid:image001.png@01D0A777.74430340]
www.infopulse.com.ua<http://www.infopulse.com.ua/>
P Please don't print this message unless you really need to. Thank you.


--_000_9dc4022c93cc4552a71d6d21407b6cc4infopulsecom_
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
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:Webdings;
	panose-1:5 3 1 2 1 5 9 6 7 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
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
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:42.5pt 42.5pt 42.5pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"UK" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello guys,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Does anyone run Xen on RPi4 and=
 can help?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I just found </span><a href=3D"=
https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg50685.html">=
https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg50685.html</=
a><span lang=3D"EN-US"> but there doesn't
 work HDMI and memory limitation.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#5B9BD5;mso-fare=
ast-language:UK">Best regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.0pt;fo=
nt-family:&quot;Segoe UI&quot;,sans-serif;color:#0070C0;mso-fareast-languag=
e:UK">Ivan Sheihets<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#5B9BD5;mso-fare=
ast-language:UK">Infopulse Ukraine<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#5B9BD5;mso-fare=
ast-language:UK">&#43;38-097-913-10-01<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:U=
K"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:blue;mso-fareast-language:UK"><img border=3D"0" =
width=3D"90" height=3D"25" style=3D"width:.9416in;height:.2583in" id=3D"Pic=
ture_x0020_1" src=3D"cid:image001.png@01D5CBD6.C7F10900" alt=3D"cid:image00=
1.png@01D0A777.74430340"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span lang=3D"EN-US" styl=
e=3D"color:#1F497D;mso-fareast-language:UK"><a href=3D"http://www.infopulse=
.com.ua/" target=3D"_blank"><span lang=3D"EN-GB" style=3D"font-size:8.0pt;f=
ont-family:&quot;Arial&quot;,sans-serif;color:#1F497D">www.infopulse.com.ua=
</span></a></span><span lang=3D"EN-US" style=3D"color:#1F497D;mso-fareast-l=
anguage:UK"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:13.5pt;font-=
family:Webdings;color:green;mso-fareast-language:UK">P</span><span lang=3D"=
EN-US" style=3D"font-size:10.0pt;color:#1F497D;mso-fareast-language:UK">
</span><span lang=3D"EN-US" style=3D"font-size:10.0pt;color:green;mso-farea=
st-language:UK">Please don't print this message unless you really need to. =
Thank you.</span><span lang=3D"EN-US" style=3D"color:#1F497D;mso-fareast-la=
nguage:UK"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_9dc4022c93cc4552a71d6d21407b6cc4infopulsecom_--

--_004_9dc4022c93cc4552a71d6d21407b6cc4infopulsecom_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=2270;
	creation-date="Wed, 15 Jan 2020 17:05:42 GMT";
	modification-date="Wed, 15 Jan 2020 17:05:42 GMT"
Content-ID: <image001.png@01D5CBD6.C7F10900>
Content-Transfer-Encoding: base64

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

--_004_9dc4022c93cc4552a71d6d21407b6cc4infopulsecom_--


--===============4420058452084221106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4420058452084221106==--

