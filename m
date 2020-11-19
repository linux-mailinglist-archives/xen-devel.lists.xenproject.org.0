Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E1F2B937D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 14:18:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30771.60915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfjo6-0002Lv-7A; Thu, 19 Nov 2020 13:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30771.60915; Thu, 19 Nov 2020 13:17:02 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfjo6-0002LW-3d; Thu, 19 Nov 2020 13:17:02 +0000
Received: by outflank-mailman (input) for mailman id 30771;
 Thu, 19 Nov 2020 13:17:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rCgr=EZ=nxp.com=jorge.pereira@srs-us1.protection.inumbo.net>)
 id 1kfjo4-0002L0-Bz
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 13:17:00 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.57]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ace5c85-de39-4dbe-8f1c-ad9ce3d35a70;
 Thu, 19 Nov 2020 13:16:59 +0000 (UTC)
Received: from AM6PR04MB5863.eurprd04.prod.outlook.com (2603:10a6:20b:a5::11)
 by AS8PR04MB8021.eurprd04.prod.outlook.com (2603:10a6:20b:2a7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 13:16:53 +0000
Received: from AM6PR04MB5863.eurprd04.prod.outlook.com
 ([fe80::31b9:c9d3:cccf:fc94]) by AM6PR04MB5863.eurprd04.prod.outlook.com
 ([fe80::31b9:c9d3:cccf:fc94%6]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 13:16:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rCgr=EZ=nxp.com=jorge.pereira@srs-us1.protection.inumbo.net>)
	id 1kfjo4-0002L0-Bz
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 13:17:00 +0000
X-Inumbo-ID: 5ace5c85-de39-4dbe-8f1c-ad9ce3d35a70
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown [40.107.2.57])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5ace5c85-de39-4dbe-8f1c-ad9ce3d35a70;
	Thu, 19 Nov 2020 13:16:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJbSA9QifaNMRNoSXXonvKzf83vqsUazqYr7S+QxVEnfjWHsYNywc7rdatFgDAxf0SKpGdPZXefnyGs++5Ynnd9muOwfVkMsWJ4JNROsMcUiZZcU8WS4TPeyilqQEwcPz5YCoM/+nQTDxCXpUS3QQI9LI/AdVuCmagP4uaz5hFw3HlK8IQEDP4OJk7aP8dMpYtUpnWAxe1vbp7xPN2ADu3iDOzuQNaapVQULmn3rx9nqcXoxA+3fwBpblmXMwSdLdHCewVIP4OeLDcZ66bBqgyr++43pDod4CaLaPF2mq+/O4V1qBke1uT+YT3zziMZFiej/nwbkRcPsOFSofPo4Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akqBHTHhWXED2JlETSeHCpkPfKyML6WEm6Qtt195NcY=;
 b=f/DqZHfuTI5bEi8/YTTB74t7+wDeG6T7mEWoxBHJUcUprdUAimwUBvyv6E9SgiNcWmCsTp1IgObzuNGXk59/1TV25CRI/9OiSDPsQamjYbglEisTjSNKt7JLe+shNFXB2HeERfgP7gt5dM4PTYCAM+56zZUP7ABNYX7Io/YeYKY6B+YV6oFznkRsOez16RlDurx0EnlxlurepWeZzc5hfWYDgPRfdUYiJZvX64HA4fN5d4D2RYFNVOpBbB1Akttor//eQ+hc1Esct1CcNKHBF3+b2sa8ftFdp9Ni64Z7g+4qxDL4JYDGsLYKm8C3aorDjy1iEwwuOpqEg4Aqqv2aFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akqBHTHhWXED2JlETSeHCpkPfKyML6WEm6Qtt195NcY=;
 b=hgX7atsHllq6LEtyVENCo/cbX4DNKd7ast2ZV8BEG5KewBVtPHryNZM9rjV9D2GEGl6NcgagnvvbTA+HUZx5rwmxu/BpvnBe33o87zTA76x6H0UzwCUCeKwpzpdH/JKm/k+F4tkWV4uOjNfK2UwlrsiCCWGu4gaqW4LEKvN9ZSU=
Received: from AM6PR04MB5863.eurprd04.prod.outlook.com (2603:10a6:20b:a5::11)
 by AS8PR04MB8021.eurprd04.prod.outlook.com (2603:10a6:20b:2a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 13:16:53 +0000
Received: from AM6PR04MB5863.eurprd04.prod.outlook.com
 ([fe80::31b9:c9d3:cccf:fc94]) by AM6PR04MB5863.eurprd04.prod.outlook.com
 ([fe80::31b9:c9d3:cccf:fc94%6]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 13:16:53 +0000
From: Jorge Pereira <jorge.pereira@nxp.com>
To: "'xen-devel@lists.xenproject.org'" <xen-devel@lists.xenproject.org>
Subject: smmu-related clarification
Thread-Topic: smmu-related clarification
Thread-Index: Ada+dgwvLpGgRoDvTYGCt70DgFD1qg==
Date: Thu, 19 Nov 2020 13:16:53 +0000
Message-ID:
 <AM6PR04MB58630B20435EEDF65D2577E2F0E00@AM6PR04MB5863.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [93.3.33.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 118d9785-41f8-46b7-dae4-08d88c8d6213
x-ms-traffictypediagnostic: AS8PR04MB8021:
x-microsoft-antispam-prvs:
 <AS8PR04MB8021EFA50C677BA443A5F61AF0E00@AS8PR04MB8021.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ioSD3s2rEPTmmHy+MuGHrPChwJB8yGm0SxWAKCFE0ypn7RgCis5jDc6huWS1ldeD7e0TxNk+Ohl41cczYnomscnoY7cZ3znjZZqIBKeoBnWhlsR1kU3ctlKfiUYLHgVsV5t+sMahtb5W2lsQL6ZrXBaQggpid5RVMKcz15WGzv3ZgdwoWNGcImX9dTcrMnup/UzPUI4E/WmEiXY6Ipaj//z9turMamIbV3nwR9aozZ7IVKv5GYZcPiG/8OflJPy6UG7heRDG/nlTu2WumwdS1U6Gcoota5xFyxSduayxMvby+XkUvzPuDhip52TyLZRDPFd3NPoFp00vFvCTTZIrHYXK43ie9NNNwOZ+M8XYHEcjB2H08umcwwvZt1qNJq++
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5863.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(366004)(376002)(346002)(186003)(6506007)(316002)(33656002)(9686003)(7696005)(86362001)(64756008)(66556008)(66476007)(66446008)(71200400001)(76116006)(66946007)(5660300002)(478600001)(26005)(52536014)(4744005)(44832011)(6916009)(8676002)(3480700007)(8936002)(9326002)(55016002)(2906002)(491001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 g26jUx4gd3Du3muJf+OUSo1+JNlhcKsi1de546XT6E1MxNiTfjiBmT2jQj1RIQuiRXF5lCRWK/emo6QQEnCkDC0a9VC3O93kKfjtdulRW9jZpHIG6+7ok3SSzXzCthwTw0pwd3LpeYnMJc3644UNcM7j84Q0At18y42bT7/cBIyWIy62Utsuoym9JMkXkXAeDH1RBtcHaipSE1QPdnriRr9klLeds3/3H6NJyCUREC2TWRv+UAMMab2Qsg5XHPSbXLZSxSS6Qo46Hzl7YhIMm4/0gxQ1tYI0OreAhTMkdOjEtKAhbsCcikz/hGMapWEB8yvlZVFdMojVJFkXGCmi7zA1/MFrPBw4kabQ7n2LsakS7bF5qPYZ/SOHYSETMst0TKpo1RfHnSVS7gmAjm2bSP4NMSKN3PjZpAcm1EQF3A2AOFvzjDgFeCIkKbkJgeWv9LBG1ck8L7IZ5Sl1kbAv/uG1w9C7TgvGdypGQNdpmrIUIe0iXPB2VHk+V+hrHfYcly0+jHBeFqtuA1Oa+S2ekat/koOhIQ4jEZI+vLeR+xarzYhIlibfdeYZGw/PuuY7p2n8D5k2asFtuO8+nWcHXpgKDfQGJv++2Yx4ES6lBk6cEP7XOMzWJYAVhcJcCxQs8POMpf7PXxh5gaMusREY9A==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_AM6PR04MB58630B20435EEDF65D2577E2F0E00AM6PR04MB5863eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5863.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 118d9785-41f8-46b7-dae4-08d88c8d6213
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 13:16:53.6101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VDPXcxYEg2UySVjTnGAoSSL9YXLHxvPQ5C8sHbkpeoQw0w7EpxjnCAWx6D6FyiX/rTi1+CSt1QTGJA8SOh5epg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8021

--_000_AM6PR04MB58630B20435EEDF65D2577E2F0E00AM6PR04MB5863eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

I'm having some smmu-related issues, I need help.

So, in my use-case scenario I have two linux guests running in parallel - d=
om0 and domU-. I have to enable the smmu because I want to passthough devic=
es to domU.

Would be great if you help me to clarify the following questions:

  *   if I enable SMMU, it will applies not only to domU but also to dma-ca=
pable devices assigned to dom0?
  *   Do I have to add all smmu-masters  of dom0 in device tree as well? Or=
 since dom0 has 1:1 mapping I don't have to do anything?

Thanks,
Jorge



--_000_AM6PR04MB58630B20435EEDF65D2577E2F0E00AM6PR04MB5863eurp_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
/* List Definitions */
@list l0
	{mso-list-id:1456826159;
	mso-list-type:hybrid;
	mso-list-template-ids:327331254 984142610 67698691 67698693 67698689 67698=
691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:DengXian;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m having some smmu-related issues, I need he=
lp. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">So, in my use-case scenario I have two linux guests =
running in parallel &#8211; dom0 and domU-. I have to enable the smmu becau=
se I want to passthough devices to domU.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Would be great if you help me to clarify the followi=
ng questions: &nbsp;<o:p></o:p></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">if I enable SMMU, it will applies not only to domU but also to dma-ca=
pable devices assigned to dom0?
<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso=
-list:l0 level1 lfo1">Do I have to add all smmu-masters &nbsp;of dom0 in de=
vice tree as well? Or since dom0 has 1:1 mapping I don&#8217;t have to do a=
nything?<o:p></o:p></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Jorge<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_AM6PR04MB58630B20435EEDF65D2577E2F0E00AM6PR04MB5863eurp_--

