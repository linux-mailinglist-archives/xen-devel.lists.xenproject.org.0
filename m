Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBF97B2E11
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 10:42:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610366.949731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm94I-0006Jl-C3; Fri, 29 Sep 2023 08:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610366.949731; Fri, 29 Sep 2023 08:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm94I-0006HG-95; Fri, 29 Sep 2023 08:41:50 +0000
Received: by outflank-mailman (input) for mailman id 610366;
 Fri, 29 Sep 2023 08:41:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xPTL=FN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qm94G-0006C1-Jk
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 08:41:48 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062c.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04f71b5b-5ea4-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 10:41:47 +0200 (CEST)
Received: from DUZPR01CA0202.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::13) by VI1PR08MB5373.eurprd08.prod.outlook.com
 (2603:10a6:803:131::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Fri, 29 Sep
 2023 08:41:40 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b6:cafe::60) by DUZPR01CA0202.outlook.office365.com
 (2603:10a6:10:4b6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 08:41:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.21 via Frontend Transport; Fri, 29 Sep 2023 08:41:40 +0000
Received: ("Tessian outbound fb5c0777b309:v211");
 Fri, 29 Sep 2023 08:41:40 +0000
Received: from 306493108f4d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0386A908-91C4-4FE6-AA1C-27D70C5CF231.1; 
 Fri, 29 Sep 2023 08:41:33 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 306493108f4d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Sep 2023 08:41:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9842.eurprd08.prod.outlook.com (2603:10a6:102:31e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 08:41:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.016; Fri, 29 Sep 2023
 08:41:31 +0000
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
X-Inumbo-ID: 04f71b5b-5ea4-11ee-878b-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcvLXMfA++2OGLOfDdM12WuDckKtpEbX/QxM9ZtrOpE=;
 b=mDcpYc4yWB5317jAfU+NdMt+53J+GwVVPLtHTZ1qk4oGSWHduZH0E+vi87DKCSMuPcDmwPLfnbpbBJrffmSRbt7gfP3FuIHLyVbXPtNlKgziWsIZDu4xQ2dHuHVmVXJFoCG73X2669/S6oV5P/sno/pqyDiFuancvAaLyja5kjs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b3b8a75c1ab81a12
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODmzE2ALD+Pr0KMHQJ29j8zsPzTB4EX6Uoeys/wCbjbjt/YO5SdQXVIo/baq7VS6FF5eyuLnCYMLfkW4hANz1UREYVXHcM8zV2rhVyILaO38aXa6/pRz+n4iJw11VL3c58RQSY0VGKwCEVN3TZ4rApOPU2B9rIwCauvi2AxJAGBD+ytcmqPBvI1TXXXsARkojKYrfVKoZnTNOAFt9S+a1gvBzQzje5Ajcpd3qQQ/oqbExv6s1kOq4McJBbWZRy6zxGT+COsYXQWZd+YIZWxIEr9khmIvv3RTldhGm5RU5s0bC04h56Vsq4+6B7jmyim9TD18o23SjK5RvHSjkT1JYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcvLXMfA++2OGLOfDdM12WuDckKtpEbX/QxM9ZtrOpE=;
 b=MGYmivX+CF3aHIxtT9rqUm+mN8t1y+jIqEYaZBk5vtmpU4Ed2cIdNAJn+LoX06ZdONS2k8P1gOHPMGgWNWBmweRugwtQQBQw/aPHCyCs+9F0bNvrwMAMnzlGxgTI4/hBgNh1kgIe+dsDm9CExetZGS1UCswcRdqK3UIVdh0MoVx0bs5NYid9iCHpx8vacDstyJnRVvCu8kGFsUxFdUhqlpjcLlKlYxNR2BxMaXB1vBpBHWbfwt2B0rPNnc6PrmVXSkYFzGODOzXWJxs7pBpEFEYPofJ36qbyV+BzFb8kyDmB3ThCo1TOxHqS8YxBRyj+oQVryQT4UVQ78NfWJPOAGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcvLXMfA++2OGLOfDdM12WuDckKtpEbX/QxM9ZtrOpE=;
 b=mDcpYc4yWB5317jAfU+NdMt+53J+GwVVPLtHTZ1qk4oGSWHduZH0E+vi87DKCSMuPcDmwPLfnbpbBJrffmSRbt7gfP3FuIHLyVbXPtNlKgziWsIZDu4xQ2dHuHVmVXJFoCG73X2669/S6oV5P/sno/pqyDiFuancvAaLyja5kjs=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>,
	Xen-users <xen-users@lists.xenproject.org>
CC: "community.manager@xenproject.org" <community.manager@xenproject.org>
Subject: Xen 4.18 rc1
Thread-Topic: Xen 4.18 rc1
Thread-Index: AQHZ8rCK24ghm9ApRk6ymvGIHuNicg==
Date: Fri, 29 Sep 2023 08:41:31 +0000
Message-ID:
 <AS8PR08MB799131EDEFFD01D2BB223B1C92C0A@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9842:EE_|DBAEUR03FT036:EE_|VI1PR08MB5373:EE_
X-MS-Office365-Filtering-Correlation-Id: f64b83bc-b59b-4c8c-f23e-08dbc0c7e6a0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YjCTYNM68kWn/VECwLoseUAtEfw3Bh47CuyzRxgtswbjmEKW/da+VXlBs7RGwQT0TjjO+jBpf+Vsqc0lNr6GRbjyAoZOy5wNPuwn/RVAkWiEtrf14XzIuNcfkk5740fBEISoo/P13PICKl12wfaNxtwX66fQt7BqG7DAWQwByHMr+p/upbm13L0tvpDOJBvdNOkeCzAS3NLPmF2pV6vOWqqRCYMFaTkIowpcJV15XTMxiF5CiaZTaWruSK6qnYKXQtSJwJSIBxv/fGqcAoGRMVhQAKKyTZCPWl/KqaVbojxzIseqhQ8djYZ2bcoKp6AJuDW+Hj4Afyw7wv0a8IhDXisEUSVOb8dGLUZFkBwZ0zEpXvkhMn/Em73jJiq93xkuT/Ubh1romhoTqwb0xPPsNBG/qE64fTFG8rd2ISPDkXERscrK6HtHflc7IC8VxzgNeCmrI7QxeKLpTLOUsyykGbGEWiHSvRF0hfSO8r97hQ9K/OzqGXd4iBzvqqp/k8ac85uZ4e9MjUXoDd5rTWY5i6iSb2nR/MAxQ98uUjhHCptV9P74o9TOyjP6n2AZ5DxmBYKgtIaO3mL1D+ICNZFrcZIDvHIGZn1C8bCz0vosTUs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(71200400001)(26005)(478600001)(122000001)(7696005)(86362001)(38100700002)(166002)(33656002)(55016003)(5660300002)(38070700005)(83380400001)(966005)(6506007)(4326008)(2906002)(8936002)(8676002)(110136005)(41300700001)(66946007)(316002)(64756008)(66556008)(66476007)(66446008)(76116006)(4744005)(52536014)(7116003)(9686003);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AS8PR08MB799131EDEFFD01D2BB223B1C92C0AAS8PR08MB7991eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9842
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	00584097-8a37-45fd-bfb4-08dbc0c7e164
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O/cDxTgNle16sysbanknPDfARoHqHmOSUcIzcuIWC7HPmSqU3yAX5E39UUeHPXPJmXZT2Wvjmw5KcgXKG7TD/Bv9ndCBL8O+SMS7cs2PikU1yzPbZ1H/pLJthKUNU7ltSZoMz1XnCAhexBsFSRhvxc4n7wkKiL8dn087nfuQJ2W+C8D74NlBUeEm07i++Fc3mlz1HlcXLS8bsxaY2ZHNtlJkdtEwrPwyUtdRITLja3EsuXUkc1+66mqSWOPWmCzgIvSdZFS3JwfoHIBsDBajQ9kHgkybwQodFFysVOH0C7OvYGXbUtKF3eQ0sqr43fbh1hj8WCIn7yiM8FUfU7iWSK+ZMOZFki1rvRl6xk6SgrR76R1nM8oHZfwYijq5RpbBK3WHxCcXj/8+vOLrkkSd5UMq5HSNVIir1jIR4ocIs42zolkSg8+seSRtptP/UGXy3Hq96QYWiGaD+jBI3iTKvRchKl8n9mtQ28KD69VM6d+vCQ+VZJI/z2yrMpL6HtimFKPhQdVqOA8Q9JpfZ8O7xww/qooat1/GDkarADJwiDnCmIiADIyWA76hv8FzOlyhklQr7hBU4NZXGAZBo7DhxHtyJaiPtaeE7RNvUk75YSrjhMPD9QWMK4ycyDkV7S+ZrJT6Xtu0slQpwngRUk5abV/Yx6rPQyRNeyQiOcFaz3ZYpvu/ha2+CENyjh7YNJZM
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39850400004)(346002)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(82310400011)(36840700001)(46966006)(7116003)(55016003)(7696005)(6506007)(83380400001)(9686003)(450100002)(316002)(478600001)(70206006)(8936002)(26005)(81166007)(336012)(70586007)(2906002)(966005)(82740400003)(356005)(5660300002)(110136005)(41300700001)(4326008)(47076005)(86362001)(33656002)(40480700001)(36860700001)(8676002)(166002)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 08:41:40.3233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f64b83bc-b59b-4c8c-f23e-08dbc0c7e6a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5373

--_000_AS8PR08MB799131EDEFFD01D2BB223B1C92C0AAS8PR08MB7991eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Xen 4.18 rc1 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.18.0-rc1

For your convenience there is also a tarball at:
https://downloads.xenproject.org/release/xen/4.18.0-rc1/xen-4.18.0-rc1.tar.=
gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.18.0-rc1/xen-4.18.0-rc1.tar.=
gz.sig

Please send bug reports and test reports to xen-devel@lists.xenproject.org<=
mailto:xen-devel@lists.xenproject.org>.
When sending bug reports, please CC relevant maintainers and me
(Henry.Wang@arm.com<mailto:Henry.Wang@arm.com>).

Kind regards,
Henry

--_000_AS8PR08MB799131EDEFFD01D2BB223B1C92C0AAS8PR08MB7991eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
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
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Xen 4.18 rc1 is tagged. You can=
 check that out from xen.git:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">git://xenbits.xen.org/xen.git 4=
.18.0-rc1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">For your convenience there is a=
lso a tarball at:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://downloads.xe=
nproject.org/release/xen/4.18.0-rc1/xen-4.18.0-rc1.tar.gz">https://download=
s.xenproject.org/release/xen/4.18.0-rc1/xen-4.18.0-rc1.tar.gz</a><o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">And the signature is at:<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://downloads.xe=
nproject.org/release/xen/4.18.0-rc1/xen-4.18.0-rc1.tar.gz.sig">https://down=
loads.xenproject.org/release/xen/4.18.0-rc1/xen-4.18.0-rc1.tar.gz.sig</a><o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Please send bug reports and tes=
t reports to
<a href=3D"mailto:xen-devel@lists.xenproject.org">xen-devel@lists.xenprojec=
t.org</a>.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">When sending bug reports, pleas=
e CC relevant maintainers and me<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(<a href=3D"mailto:Henry.Wang@a=
rm.com">Henry.Wang@arm.com</a>).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Kind regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Henry<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_AS8PR08MB799131EDEFFD01D2BB223B1C92C0AAS8PR08MB7991eurp_--

