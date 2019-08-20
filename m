Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AE295C34
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 12:24:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i01F6-0002nU-0f; Tue, 20 Aug 2019 10:19:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4Mjq=WQ=siengine.com=ge.liu@srs-us1.protection.inumbo.net>)
 id 1i0182-0002aD-2K
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 10:12:38 +0000
X-Inumbo-ID: 05ae326a-c333-11e9-b90c-bc764e2007e4
Received: from cn01-BJB-obe.outbound.protection.partner.outlook.cn (unknown
 [42.159.36.110]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05ae326a-c333-11e9-b90c-bc764e2007e4;
 Tue, 20 Aug 2019 10:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siengine.partner.onmschina.cn; s=selector1-siengine-partner-onmschina-cn;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTe44fthvSryiodqHXxDqK0L8IAT5P76QCztLeq9mXI=;
 b=FS3dyjtBJLW3BlkHB1kQNekFxz0xix8vpNyYKhsTPULU3DLWhn9s1UV5EmqkBfQAtc84Z+Jto33s3GJx5XOezeFK8ieCaDLfxEjXA8ndOZfdZm1ck4jXLIhdc4zZJAwyz53ajyZVA7hBoEhxzM9lduPf3llUaCeC7RhGxyYv/O4=
Received: from BJXPR01MB0614.CHNPR01.prod.partner.outlook.cn (10.43.32.151) by
 BJXPR01MB0326.CHNPR01.prod.partner.outlook.cn (10.41.73.16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Tue, 20 Aug 2019 10:12:28 +0000
Received: from BJXPR01MB0614.CHNPR01.prod.partner.outlook.cn ([10.43.32.151])
 by BJXPR01MB0614.CHNPR01.prod.partner.outlook.cn ([10.43.32.151])
 with mapi id 15.20.2178.018; Tue, 20 Aug 2019 10:12:28 +0000
From: =?gb2312?B?TGl1IEdlL8H1uOo=?= <ge.liu@siengine.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [optee ]: about the max optee threads limitation
Thread-Index: AdVXPXlc5alEi1p3Ql+0A9IfmKKKvwAAhFZw
Date: Tue, 20 Aug 2019 10:12:28 +0000
Message-ID: <BJXPR01MB06145299DF5B79F9D9236798FDAB0@BJXPR01MB0614.CHNPR01.prod.partner.outlook.cn>
References: <BJXPR01MB06145557808BAF8117CCD5AEFDAB0@BJXPR01MB0614.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <BJXPR01MB06145557808BAF8117CCD5AEFDAB0@BJXPR01MB0614.CHNPR01.prod.partner.outlook.cn>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ge.liu@siengine.com; 
x-originating-ip: [118.186.220.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fee002fb-34ba-496f-f760-08d72556e7cf
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(4600270)(4652040)(97021020)(8989299)(711020)(4605104)(1401327)(97022020)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(4601075);
 SRVR:BJXPR01MB0326; 
x-ms-traffictypediagnostic: BJXPR01MB0326:
x-microsoft-antispam-prvs: <BJXPR01MB0326CCFAD84C03AD0EEF0D32FDAB0@BJXPR01MB0326.CHNPR01.prod.partner.outlook.cn>
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39830400003)(366004)(396003)(199004)(189003)(328002)(329002)(59450400001)(790700001)(486006)(6116002)(7736002)(4744005)(3846002)(2940100002)(186003)(102836004)(26005)(66066001)(8676002)(14454004)(9686003)(81156014)(2906002)(6306002)(54896002)(76176011)(55016002)(11346002)(446003)(476003)(7696005)(478600001)(5660300002)(316002)(63696004)(76116006)(95416001)(2501003)(52396003)(2351001)(6916009)(66556008)(66476007)(66946007)(66446008)(64756008)(5640700003)(85182001)(71190400001)(71200400001)(33656002)(8936002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BJXPR01MB0326;
 H:BJXPR01MB0614.CHNPR01.prod.partner.outlook.cn; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: siengine.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FUswlt7K7E5TTUhzggKVBE5EXPt2Xsi1qIG4nN/7FrDA3yn8sloGzoHDVF0vY6issAGaYoGpDt0y+3mtCLPLwGQ+z2wmNeJWqv4EuUr61MYKcQmiMtvUBDdAstMSL/cKB3dLkt+veIGBdl5esRT99m3Rz118geww/WWvaRVs9eJqqojYnMZWV4jSGmJyclbcdUCmhm6QeItaCRzMefqomnh50cfcnclFPqMkSVv9JPRwgM3AS2agJPC8Gsepkcp5BG+fy+bt/tP+DYSRovQuBdE+shsln32PivzCX6ioBnFGAKy9zppxwmGvQHip5duc5Wcby3MtwEMf9h1lOXKw2rpAyHAxy6bex5N6+b4wciUcbBYonrUx4xEkyg94z2xavWFTMAOjg+wEGCu/d+7tiroWTU0OSYDbYm8xuwWkDys=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siengine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee002fb-34ba-496f-f760-08d72556e7cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 10:12:28.0227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dfd77111-ddba-4349-918d-07ae3a4b9d8e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Hjsh/YyuXLnx5pVUJbM9x8Hztjo3s0dsh5xAa69WyIcp63vfcS2V6KtuGxSCj5hq/8bLSjs8urFjM5Mpe9Prw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0326
X-Mailman-Approved-At: Tue, 20 Aug 2019 10:19:54 +0000
Subject: [Xen-devel] [optee ]: about the max optee threads limitation
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
Content-Type: multipart/mixed; boundary="===============0410870986852782471=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0410870986852782471==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_BJXPR01MB06145299DF5B79F9D9236798FDAB0BJXPR01MB0614CHNP_"

--_000_BJXPR01MB06145299DF5B79F9D9236798FDAB0BJXPR01MB0614CHNP_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

DQoNCg0KSGVsbG8sZXhwZXJ0cw0KDQpJIGFtIHJlYWRpbmcgdGhlIGNvZGUgYWJvdXQgdGhlIG9w
dGVlIHN1cHBvcnRlZCBieSB4ZW4uDQoNCkkgbm90aWNlZCBmb2xsb3dpbmcgY29kZSB3aGljaCBh
Ym91dCB0aGUgbGltaXRhdGlvbiBvZiB0aGUgobBtYXggb3B0ZWUgdGhyZWFkc6GxLg0KSXMgdGhl
IGxpbWl0YXRpb24gc2hvdWxkIGJlIGFwcGxpZWQgdG8gYWxsIG9mIHRoZSBndWVzdCBWTXMgcnVu
bmluZyBvbiBYZW4gPw0KaWYgaXQgaXMgeWVzLCBob3dldmVyLCBjdHggaXMgcGVyIFZNLCBzbywg
aWYgdGhlcmUgaXMgYW5vdGhlciBWTSBlbmFibGUgdGhlIG9wdGVlICwgdGhlIGxpbWl0YXRpb24g
bWF5IGV4Y2VlZCB0aGUgbnVtYmVyIG9mIG1heCBvcHRlZSB0aHJlYWRzLg0KSXMgaXQgcmlnaHQ/
DQoNCkZpbGU6IHhlbi9hcmNoL2FybS90ZWUvb3B0ZWUuYw0Kc3RhdGljIHN0cnVjdCBvcHRlZV9z
dGRfY2FsbCAqYWxsb2NhdGVfc3RkX2NhbGwoc3RydWN0IG9wdGVlX2RvbWFpbiAqY3R4KQ0Kew0K
ICAgIHN0cnVjdCBvcHRlZV9zdGRfY2FsbCAqY2FsbDsNCiAgICBpbnQgY291bnQ7DQoNCiAgICAv
Kg0KICAgICAqIE1ha2Ugc3VyZSB0aGF0IGd1ZXN0IGRvZXMgbm90IGV4ZWN1dGUgbW9yZSB0aGFu
IG1heF9vcHRlZV90aHJlYWRzLg0KICAgICAqIFRoaXMgYWxzbyBpbmRpcmVjdGx5IGxpbWl0cyBu
dW1iZXIgb2YgUlBDIFNITSBidWZmZXJzLCBiZWNhdXNlIE9QLVRFRQ0KICAgICAqIGFsbG9jYXRl
cyBvbmUgc3VjaCBidWZmZXIgcGVyIHN0YW5kYXJkIGNhbGwuDQogICAgICovDQogICAgY291bnQg
PSBhdG9taWNfYWRkX3VubGVzcygmY3R4LT5jYWxsX2NvdW50LCAxLCBtYXhfb3B0ZWVfdGhyZWFk
cyk7DQogICAgaWYgKCBjb3VudCA9PSBtYXhfb3B0ZWVfdGhyZWFkcyApDQogICAgICAgIHJldHVy
biBFUlJfUFRSKC1FTk9TUEMpOw0K

--_000_BJXPR01MB06145299DF5B79F9D9236798FDAB0BJXPR01MB0614CHNP_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=B5=C8=CF=DF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:=B5=C8=CF=DF;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:=CB=CE=CC=E5;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:=B5=C8=CF=DF;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:=B5=C8=CF=DF;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello,experts<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I am reading the code about the=
 optee supported by xen.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I noticed following code which =
about the limitation of the
</span>=A1=B0<span lang=3D"EN-US">max optee threads</span>=A1=B1<span lang=
=3D"EN-US">.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is the limitation should be app=
lied to all of the guest VMs running on Xen ?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">if it is yes, however, ctx is p=
er VM, so, if there is another VM enable the optee , the limitation may exc=
eed the number of max optee threads.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is it right?<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">File: xen/arch/arm/tee/optee.c<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">static struct optee_std_call *a=
llocate_std_call(struct optee_domain *ctx)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">{<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; struct optee=
_std_call *call;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; int count;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; /*<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; * Make=
 sure that guest does not execute more than max_optee_threads.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; * This=
 also indirectly limits number of RPC SHM buffers, because OP-TEE<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; * allo=
cates one such buffer per standard call.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; */<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; count =3D at=
omic_add_unless(&amp;ctx-&gt;call_count, 1, max_optee_threads);<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp; if ( count =
=3D=3D max_optee_threads )<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; return ERR_PTR(-ENOSPC);<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_BJXPR01MB06145299DF5B79F9D9236798FDAB0BJXPR01MB0614CHNP_--


--===============0410870986852782471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0410870986852782471==--

