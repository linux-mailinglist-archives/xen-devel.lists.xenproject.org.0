Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3C77AF710
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 02:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608600.947200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlI9I-0002z5-DV; Wed, 27 Sep 2023 00:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608600.947200; Wed, 27 Sep 2023 00:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlI9I-0002w0-9t; Wed, 27 Sep 2023 00:11:28 +0000
Received: by outflank-mailman (input) for mailman id 608600;
 Wed, 27 Sep 2023 00:11:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x8T5=FL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qlI9H-0002vu-0R
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 00:11:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65ba1fcc-5cca-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 02:11:25 +0200 (CEST)
Received: from DB7PR03CA0074.eurprd03.prod.outlook.com (2603:10a6:10:72::15)
 by AS8PR08MB10290.eurprd08.prod.outlook.com (2603:10a6:20b:63c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 00:10:56 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::f0) by DB7PR03CA0074.outlook.office365.com
 (2603:10a6:10:72::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21 via Frontend
 Transport; Wed, 27 Sep 2023 00:10:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.19 via Frontend Transport; Wed, 27 Sep 2023 00:10:55 +0000
Received: ("Tessian outbound d084e965c4eb:v175");
 Wed, 27 Sep 2023 00:10:55 +0000
Received: from 06177d7caeaf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 65D7D1B4-6F4E-4B82-9E2E-99008D6FB30E.1; 
 Wed, 27 Sep 2023 00:10:15 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 06177d7caeaf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Sep 2023 00:10:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB6384.eurprd08.prod.outlook.com (2603:10a6:102:154::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 00:10:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 00:10:12 +0000
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
X-Inumbo-ID: 65ba1fcc-5cca-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkEyoOCf3ll+n+6vhBV9iRtbs/uirNtc5FtaApQyVZE=;
 b=4a5S7TmbzjMMZbNENy8ii9Uv5wAK2Fv24LuFUjqQSlgxBSf233LfA0BwblJIhnZE0UsquaDO8es5qJotEl88XeSFBSf0HiDlqbY+BavKgywJkp0ycPbKPM4He/xlR+LC03QTX/cFm+TfGtz1+MRetnmmC4DUW07u8qoHNkzudvE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c80221ebb69171e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+8nVRp+QCy+H02aaCpfmPyWuyMqZeE3jWl/OXw1P0DDiYx+Y+otmMY2odUIdMWiYw+3huVkq3dr134GLDa8cJ8tLjLCGejAhtC5QvaAfn74jSplTKmlT9N2GeTPNgKdhUa5PBBAXSwk6HH55CCwMNdX5C4nCS8IlIp2smt0pbA7fwZcC8uQOUkYPOFhDkngz2+xdpf/4eXzTO1yEnlEeHQJubKRDdD+np7m0XeoIatxZNYpfE/lxbzxZdIMFTI3iaLIBs6RlQl2Q7Rxi6+dpUCl/c5LMgiUDt3Q2gYotTwaoKEwMocdW2zGM0/iVVKQg+ccCTmtOhVLCV0nZ0FlHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkEyoOCf3ll+n+6vhBV9iRtbs/uirNtc5FtaApQyVZE=;
 b=Vt81uNVhjW3Km7MAsPYMPef65jEkVr83GmzRN1IJZ2drJpcLi0Ip6Qevm2S5GuFSp8aBR/eFyCog30qyQU0PV+9v3ztCXEz4TtJ0bjD/zV9LAqqzAB25rBOdJBzVB50TdfLEXOUNMuJblDgTX3RY0oFh5Je1pP5eWfzpIbn0X6r3z3hSJp363qk7Ge+X3f6uJ2qGkZ/Hdg8aF/oRS7aacM8osLXFkCy405s/nyLeIe7z5AtvW3g/g8ebM/Hl8CjoBp2UZ0+mP2UgiLyTIG7J7Bf2KmM0/VxTDVJOwrfAt36ZrZKoTObpTti1pspmNCYA6ZGjEGA0PfmsrwF1YWsOYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkEyoOCf3ll+n+6vhBV9iRtbs/uirNtc5FtaApQyVZE=;
 b=4a5S7TmbzjMMZbNENy8ii9Uv5wAK2Fv24LuFUjqQSlgxBSf233LfA0BwblJIhnZE0UsquaDO8es5qJotEl88XeSFBSf0HiDlqbY+BavKgywJkp0ycPbKPM4He/xlR+LC03QTX/cFm+TfGtz1+MRetnmmC4DUW07u8qoHNkzudvE=
From: Henry Wang <Henry.Wang@arm.com>
To: "committers@xenproject.org" <committers@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>
Subject: Temporary commit moratorium for 4.18 RC1
Thread-Topic: Temporary commit moratorium for 4.18 RC1
Thread-Index: AQHZ8NWHieDtW3L/RkOX7PfWoLrW7g==
Date: Wed, 27 Sep 2023 00:10:12 +0000
Message-ID:
 <AS8PR08MB799113F8D3EFDD9AC16DD88F92C3A@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAXPR08MB6384:EE_|DBAEUR03FT025:EE_|AS8PR08MB10290:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b5b756-6bd9-4621-2d39-08dbbeee3830
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 j1dgmCIL8lo31E+XOaONV+0dDRLCqwVcqlLI6wIoDVPPAri1NolkevR5gLvNlTsc3JqfVgPwYveETs1y4kUkIIOgr7MfnGvMiZp3WMKosdX5bcN5vkGmLY6G1JHyBTj2ZYqWmO2m0Hz1WfnHlhY6J30abeT1g6hOI03mZ0xzVfvllALENX1gmhx7Ip+7f/nh15EhhgjvUEtw0BqPrT2qoPRAH4EFUz1EJNHY/EaVJhk3oLgqmFUQawnfM2hvx4Mftgj4O6icjCoAljTMoqqojNmRFkT3EinjqSTu/mHSqoJsv8LjwR4bSRlc9u+5GDUvMqVMxB/qhjdGEbFFsjpiRHQiIsfaxnuCBMfhXhJb6Q0d0QEzAO3c1+0G+SDobpQCXe6UTpLDJaKpEqrEjUihdg5gO4geX7w1dxtWEqzZ9Xhglt6TOprRAqI0hO1WU2vQhhcHsqfPHoXxQqH6C6SjlkjnNrjN9Lhb5KLtbf2QbylUdUvoeihadr+m6wARMirRlQXNQOfUHyycPxCFdqltSIV3wbw0CdjY1AJ46kTWOC7QmG4eADrDH59ZG+xVXxpOzxGwFpB4BNSCUKeJeKOO8YgW6eNygeRQJVg5PKKYdHp8og4adMX57kwwCeF+lsnM
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(451199024)(186009)(1800799009)(83380400001)(4744005)(55016003)(8936002)(4326008)(5660300002)(8676002)(478600001)(26005)(71200400001)(86362001)(38070700005)(76116006)(38100700002)(316002)(52536014)(66476007)(110136005)(66446008)(54906003)(122000001)(66556008)(64756008)(9686003)(66946007)(2906002)(41300700001)(33656002)(7696005)(6506007);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AS8PR08MB799113F8D3EFDD9AC16DD88F92C3AAS8PR08MB7991eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6384
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0bcf5712-eaba-467d-779f-08dbbeee1e66
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UpTxfYQgM4mmV14qwkoLtLOCtSGorD6d1RGRQ+Gno0U9z5LLiU5KgKrrxNf0i+Rq4vidzVDcAoQ93h8GIhzWyGcHGio+7VgTBSWpz9AWrAPFWZjIrTIwUHmD2WHuH9yCMggvJx2FbVIJJFIbnbMAZU0JoBRrA3EgspXuoN1EU6uVdXpRlETCfNOEjBBA/HCy1o1N+LjGBpVddOKEjuibvvQGxOkQMk3c6Ij0HAk/tH1DwglkNWrqVeDtebIJisZW84+uNy1jkAZyoghyCNFjn1Ibx9eqYxnAQou1zxloE55v1+ipT3IGgq/lIcT6m2uuHan68OCVMJ9OlQ/Iyypz/vGmbRfTm4wbikgNCgs46bcyzkO8f7vXGV1NOtPm4m5zXeHIktQM6DJPvsZDHczmlQHs13jgbw6r6n3FsF7kLeMjbdSEcz44g5xMCaTLWUFXrFAufcCucmeezmzKG2x7i1Go2sp3tUSCCOtpnYrWV4yLBUJCsNCYjz5keNYOPCffAkIRG3BFT8S2FMsG/g2Ka3grLLBJpPZ5wIGxnVzrFioF/C4r+5b6ehZsCfIbVEWRPdG2ihAiIsPjI79ADox9IZNpx6JNzOK5K/BOuogwv5/O9qtCHHkTugN3V0EWI3Q/CsYBqMj2mx8mk22UEdSTM4Y9e6fraUlnWjuGX5lBdkQHbeUMkXuQ/pA7iHUXKNbWL8v4Y75UkBtIJ4pOyLYvU6f4ujbKyNS2YyFq9xLKF1TVY0/dmJWzmKsGEuPonxrp
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(451199024)(82310400011)(186009)(1800799009)(40470700004)(36840700001)(46966006)(6506007)(478600001)(336012)(26005)(47076005)(81166007)(33656002)(9686003)(82740400003)(356005)(7696005)(70206006)(110136005)(70586007)(36860700001)(83380400001)(316002)(54906003)(41300700001)(40460700003)(40480700001)(55016003)(86362001)(2906002)(5660300002)(52536014)(8676002)(4326008)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 00:10:55.7232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b5b756-6bd9-4621-2d39-08dbbeee3830
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10290

--_000_AS8PR08MB799113F8D3EFDD9AC16DD88F92C3AAS8PR08MB7991eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi committers,

We will be tagging the 4.18 RC1 on Fri Sep 29, 2023. In order to have enoug=
h time
for OSSTest to do the sync between staging and master, if there is any patc=
h to be
committed, please commit them by the morning of Thu Sep 28, 2023, EU time a=
nd
avoid committing to the staging until 4.18 RC1 is prepared. Thanks!

Kind regards,
Henry

--_000_AS8PR08MB799113F8D3EFDD9AC16DD88F92C3AAS8PR08MB7991eurp_
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi committers,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We will be tagging the 4.18 RC1=
 on Fri Sep 29, 2023. In order to have enough time<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">for OSSTest to do the sync betw=
een staging and master, if there is any patch to be<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">committed, please commit them b=
y the morning of Thu Sep 28, 2023, EU time and<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">avoid committing to the staging=
 until 4.18 RC1 is prepared. Thanks!<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Kind regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Henry<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_AS8PR08MB799113F8D3EFDD9AC16DD88F92C3AAS8PR08MB7991eurp_--

