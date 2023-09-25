Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2315D7ACD90
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 03:26:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607565.945802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkaM3-0001bD-N9; Mon, 25 Sep 2023 01:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607565.945802; Mon, 25 Sep 2023 01:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkaM3-0001YK-Jo; Mon, 25 Sep 2023 01:25:43 +0000
Received: by outflank-mailman (input) for mailman id 607565;
 Mon, 25 Sep 2023 01:25:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LToL=FJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qkaM2-0001YE-CC
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 01:25:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7d00::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f03d209-5b42-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 03:25:39 +0200 (CEST)
Received: from AS4P192CA0008.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::6)
 by AS8PR08MB8945.eurprd08.prod.outlook.com (2603:10a6:20b:5b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 01:25:31 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5da:cafe::6e) by AS4P192CA0008.outlook.office365.com
 (2603:10a6:20b:5da::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 01:25:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.18 via Frontend Transport; Mon, 25 Sep 2023 01:25:30 +0000
Received: ("Tessian outbound 5c548696a0e7:v175");
 Mon, 25 Sep 2023 01:25:30 +0000
Received: from ba72c6b69c28.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CFCAABC7-F42F-47BB-BBB8-CF481D85C437.1; 
 Mon, 25 Sep 2023 01:25:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba72c6b69c28.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Sep 2023 01:25:19 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB7900.eurprd08.prod.outlook.com (2603:10a6:150:5f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.25; Mon, 25 Sep
 2023 01:25:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 01:25:16 +0000
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
X-Inumbo-ID: 6f03d209-5b42-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/vZMDp7KTt0o+VWPvt+26ms4pghEwvn0k7H3jh0O5c=;
 b=4MOpo2qViPv87DfxDrxuAaNDa6bSW7E94YhMG2dhUQmrPNC3EGkravJMfBC6M+koEV1eEcwtLns1aOVHkCPdu/5MHdZeJlLMil7B+HFhA6qLGMloN1pDL/5cg9u4hszyll4Xfd4b4G7tQzxRAoShsXNYGSvXbOjuEuqJNEhdY8Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0701ac3117f8ebf2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndjgbas92fQECCAqHFLjm0yWkn3Z8DtkbHF6S7IIv1+cnTTdG9wBqKtHN1ydfD1BuzvNbo6JikVzNe55dX+nFCR5NX9b58U2ZTooZzsqznHDvxHeLv5HeBZs0DRLwuyzQVp6dA5hiLrsVZ4OY76ujzdiTzpzr15fj1xSze18csVpejUnLCHY+KxrteETEPNkbbwXMYVapwUjC1rwNTiysE8FCltbgRKqIodtoa7jduyhLTTiQKnMJnsdiJnwa9w9YDNgQU5jY6x2/SIj8CSaAFsvtKhl/KE9No38o4RyKIfCZBc6jqhAdrNb4L7hPIlnkSGRAPvWu+jDsmNj628RZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/vZMDp7KTt0o+VWPvt+26ms4pghEwvn0k7H3jh0O5c=;
 b=cONU6I4R1/uHYRJk32nmAL32qkL6VQJ/+Fiot2OA7dIBX6T5AUwL4m0dPi33s2Q8XDFcpDG+HBZ30jC/JHjEYyN4ls5XV5fZA9CK23HK62GrK1BlHfwVTyf3e+eEEDGkT0OwEjeWRlbVV8iVbtgfVGlAaQdLmRojfLdzG3p/cAyqpRSAqXWAAZoh2JNvnYDjDvYgnYGbE6UubJ5sHnz93DgRubk8THnLEgFCfr5t15vFqAVvHou7t9NEUgY8BK5bJ7w//O9C7LIaiW2hm5cu23ErjwmnfbQvpnlWqDItA0fZia0+Nz+55vFc0iGmiHxwDbjxes4n4iuhDeqCoxhLEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/vZMDp7KTt0o+VWPvt+26ms4pghEwvn0k7H3jh0O5c=;
 b=4MOpo2qViPv87DfxDrxuAaNDa6bSW7E94YhMG2dhUQmrPNC3EGkravJMfBC6M+koEV1eEcwtLns1aOVHkCPdu/5MHdZeJlLMil7B+HFhA6qLGMloN1pDL/5cg9u4hszyll4Xfd4b4G7tQzxRAoShsXNYGSvXbOjuEuqJNEhdY8Y=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
	"jgross@suse.com" <jgross@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>
Subject: Xen 4.18 release: Reminder about code freeze
Thread-Topic: Xen 4.18 release: Reminder about code freeze
Thread-Index: AQHZ705Dwyrpd4I60kahQfZlaJ2JtA==
Date: Mon, 25 Sep 2023 01:25:16 +0000
Message-ID:
 <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB7900:EE_|AM7EUR03FT063:EE_|AS8PR08MB8945:EE_
X-MS-Office365-Filtering-Correlation-Id: c2512685-89dd-4c86-f6a6-08dbbd664e83
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 D5OOeEDICQV8FGENy9FO8ntCSgNU2OmZuCuaQyouKBRA1UR1sxN55jJrMpioM7OJmyIBUprh8Ub73HP8ChxPpF7dHvHeDgoqKgIy0l8fuENx8b3euyKQveijPusPDjd5qJMy617voihjxVT/IFAj3vi2UxeLnH7o7WBj87nUnrCFqxRVhZyueXCNwMNVzwxwNJgxIaVA+TcACdAhuKR6DuEVXRNjLKxvsFJioR17BoOyLPGw8eIe0b6bSC6N0/e8YzUzI4V5glbDcOIghJWObAtoB5P4vWtdno+DXHATOiCU57F3HobNly/GU68HUS1O9tg5ieiLOz705nj/U/R3nES84ELbSUFVpiAomiqe7iaMwphVPJe1SGgQCcodny3RJW8c5g+5IpdwbM+K4fPVLVmop5fTK1zBLl3pYpNSU51biVPvr0JnI7+KDFwSNfso6a4NXx6+buWSbPwGT6P0LHs86JoLPx7KSxXcL2QprCcoVyGMxiKKGscwnDjwIwighVJzmHD4yIQ+6w3gIASl5VCCtV4xZ+cFF9lJW9xO0WE3kH+8ga8/hNh2mugjU50dySL7k0+F9Zzxyms5CLOWSfE4febOaDpR8KflnLuy/dxu815CEQL8D1EQN5n7vwVOHEkLDopM1TDmwJik9wU9EQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(39850400004)(376002)(230922051799003)(186009)(1800799009)(451199024)(55016003)(2906002)(83380400001)(4744005)(166002)(122000001)(38070700005)(38100700002)(66946007)(9686003)(76116006)(66556008)(66476007)(66446008)(64756008)(54906003)(966005)(478600001)(52536014)(6506007)(71200400001)(5660300002)(26005)(6916009)(316002)(41300700001)(4326008)(8936002)(8676002)(7696005)(86362001)(33656002);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AS8PR08MB7991D1099E32CC9F03B0E0F692FCAAS8PR08MB7991eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7900
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f552aa30-54a8-4b2e-519b-08dbbd664600
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D4JZgi8Sb2bYWL+KiA5Ka+bZ8sVhylOtctH8CH/7EupxN/GV6CG1scOtl1z+bAfKxHHorxG/s8hBoM7XrfawaXLod8vZ5p7Uu62MiFEZT5IHO1Ogg5QZ6v2bnBKkynaUieR4TZpPdmrnogcW1anSWP6MEKvjNSISBDlnBHEGOjLaRyXD4nlB69HKHNwV1CvvPv1Fn1xQxaHso/uZDhNbrl2RdxxlJOEeG2DnHtgFJLEvHMqkcnEJqLMZA86rt61AkPfvmoCUWf69y5E2DYyzYh2WtB30up+1/5EqYISAE4/juhmpL0XtJ4PQiSgbhI46seu8HZ+WtJDJVvTOKy7SAwYND5UWhMdu8e271g7R/V38UPHboY3lKhzS6T7u68J+zUHSaMHCtCwUmizrPJent89NhLtl6C9m3wkscg4wtHDzlw6691556+onmHkg/z9z17HxErVe01M7cQoUkigKdxbzbojTB89buOQ9FAok3QwOshh4j0vRG/IgEqNYYwQcVz8EapOhBWwMVrxhWn3JoOH+lCAZm3KK6llFkzRYAot1mBkS/jU7LtsczUrNPcWHs90hGSH6HP+ZCBcuyzcQYUjXItBaUnoaAHT8uEHouXKlENhwcyi8UoQu7D87lNTrcn6goJjye0uyF9JwT0HbcTJSdnSPGZGWh6ieU2bGrlp5Pzr9cPJDsbPUxdTmniwYWMCkZ9PNiipIT3XbisX2OStkngc8OTyyMc5l8qhVqVo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(376002)(136003)(396003)(346002)(230922051799003)(186009)(82310400011)(1800799009)(451199024)(46966006)(36840700001)(2906002)(55016003)(33656002)(86362001)(336012)(26005)(9686003)(7696005)(6506007)(166002)(36860700001)(356005)(82740400003)(83380400001)(81166007)(47076005)(966005)(478600001)(40480700001)(70206006)(5660300002)(70586007)(54906003)(52536014)(6916009)(316002)(8936002)(8676002)(4326008)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 01:25:30.3861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2512685-89dd-4c86-f6a6-08dbbd664e83
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8945

--_000_AS8PR08MB7991D1099E32CC9F03B0E0F692FCAAS8PR08MB7991eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

This is the reminder that we are currently in code freeze. The hard code
freeze date will be in two weeks, i.e. Fri Oct 6, 2023.

The planned date for 4.18 rc1 is this Friday, i.e. Sep 29, 2023.

Also, below is the (updated) critical items on my list for 4.18 release:
1. [PATCH 0/7] tools: More Python 3 fixes (part 1 of N)
https://gitlab.com/xen-project/xen/-/issues/114

2. tools: Switch to non-truncating XENVER_* ops
https://lore.kernel.org/xen-devel/20230117135336.11662-1-andrew.cooper3@cit=
rix.com/

3. dom0less vs xenstored setup race Was: xen | Failed pipeline for staging =
| 6a47ba2f
https://marc.info/?l=3Dxen-devel&m=3D168312468808977
https://marc.info/?l=3Dxen-devel&m=3D168312687610283

4. [PATCH v2 0/8] Fixes to debugging facilities
https://lore.kernel.org/xen-devel/21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmai=
l.com/

Kind regards,
Henry

--_000_AS8PR08MB7991D1099E32CC9F03B0E0F692FCAAS8PR08MB7991eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
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
<p class=3D"MsoNormal">Hi everyone,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is the reminder that we are currently in code f=
reeze. The hard code<o:p></o:p></p>
<p class=3D"MsoNormal">freeze date will be in two weeks, i.e. Fri Oct 6, 20=
23.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The planned date for 4.18 rc1 is this Friday, i.e. S=
ep 29, 2023.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Also, below is the (updated) critical items on my li=
st for 4.18 release:<o:p></o:p></p>
<p class=3D"MsoNormal">1. [PATCH 0/7] tools: More Python 3 fixes (part 1 of=
 N)<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://gitlab.com/xen-project/xen/-/issu=
es/114">https://gitlab.com/xen-project/xen/-/issues/114</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">2. tools: Switch to non-truncating XENVER_* ops<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://lore.kernel.org/xen-devel/2023011=
7135336.11662-1-andrew.cooper3@citrix.com/">https://lore.kernel.org/xen-dev=
el/20230117135336.11662-1-andrew.cooper3@citrix.com/</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">3. dom0less vs xenstored setup race Was: xen | Faile=
d pipeline for staging | 6a47ba2f<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://marc.info/?l=3Dxen-devel&amp;m=3D=
168312468808977">https://marc.info/?l=3Dxen-devel&amp;m=3D168312468808977</=
a><o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://marc.info/?l=3Dxen-devel&amp;m=3D=
168312687610283">https://marc.info/?l=3Dxen-devel&amp;m=3D168312687610283</=
a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">4. [PATCH v2 0/8] Fixes to debugging facilities<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://lore.kernel.org/xen-devel/21cc28b=
9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com/">https://lore.kernel.org/xen-devel=
/21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com/</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Kind regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Henry<o:p></o:p></p>
</div>
</body>
</html>

--_000_AS8PR08MB7991D1099E32CC9F03B0E0F692FCAAS8PR08MB7991eurp_--

