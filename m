Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C62579A0E8
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 03:09:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598873.934043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfVPp-0001uE-BL; Mon, 11 Sep 2023 01:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598873.934043; Mon, 11 Sep 2023 01:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfVPp-0001s7-7R; Mon, 11 Sep 2023 01:08:37 +0000
Received: by outflank-mailman (input) for mailman id 598873;
 Mon, 11 Sep 2023 01:08:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uN2d=E3=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qfVPn-0001s1-RT
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 01:08:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b87a292a-503f-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 03:08:31 +0200 (CEST)
Received: from AM4PR05CA0004.eurprd05.prod.outlook.com (2603:10a6:205::17) by
 AS4PR08MB7480.eurprd08.prod.outlook.com (2603:10a6:20b:4e7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Mon, 11 Sep
 2023 01:08:27 +0000
Received: from AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:205:0:cafe::cd) by AM4PR05CA0004.outlook.office365.com
 (2603:10a6:205::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34 via Frontend
 Transport; Mon, 11 Sep 2023 01:08:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT046.mail.protection.outlook.com (100.127.140.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.11 via Frontend Transport; Mon, 11 Sep 2023 01:08:25 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Mon, 11 Sep 2023 01:08:25 +0000
Received: from f3a178bde539.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2344B7B5-6641-436A-81E0-A143EAECB86F.1; 
 Mon, 11 Sep 2023 01:08:15 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f3a178bde539.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Sep 2023 01:08:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB8371.eurprd08.prod.outlook.com (2603:10a6:20b:56a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Mon, 11 Sep
 2023 01:08:12 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 01:08:12 +0000
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
X-Inumbo-ID: b87a292a-503f-11ee-8784-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mv3gctODV4hLLyY9fhyTdUrJT3OZJMCcvvS3z+oVtTY=;
 b=gXH6DDdTjkIHWf1M0o8LypfUSl0JjeN8JhKr6qUqoVPmBxmQXxDnHO8V/CnXU/ySaDwtN+OsoHGzaaV+iJgVakGgAEyb1qzMmvqUVK98euKLkuCgqjJ4txm54DhCtClcFwcV+nEMds+v68/eE1qNiDKEpv7EibW5Sbog9Altgus=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2ed8532f611e024a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGWDytTtptzu55VFxiC8FjJCyLxcAWFEi//H4SVfWYm4aRL9sE3OsdyuhtKw48Zfu5bBPzdc32wYo5Ws9nNrW/yP/0HErSbzPAyFmooGkFOZs6KJgmxPEhvE5SbzY/khuxpYybJ5+iSbYhifd2o+/nA7geiLr46sjXaIeB932pHBSvkRJo5TAR1Xek4TtWAGabsvU9ApClQWP28TJrL3n3caOIuRH97sJUoL+NVJQjUyGVmu8I61nZ6RpNrD0DIP9FE1zd3Lay7C9B/tM0KFqqVABClRm64+XjRyVrhhO1smXW4Z+AP19SgyJqcsEhxVKRPrLgDv/7eWUr1cxHaYJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mv3gctODV4hLLyY9fhyTdUrJT3OZJMCcvvS3z+oVtTY=;
 b=MTBhuYO8nDcaBYKCzeQ4Si8bXzbvBIku9WGJ5Fp1tvq+H/+fAfg9o0fNxJNRO+c1Dijon5ulD2BA/Kd1AW7CvLsvxjYODE6R2FEL/8W4kr73T+MUKlbHlkVmrnNo1/UmVDO/6CfKBTguhThbiRLSgd5ue5dknEi9bf1yEkahgHFj5Mne9iSldgUD186pH0ha3M5VROn0mNXCWYIA3jtQ79I3HfJjKLHw2U1SdIP1b6skjcUsx3hXaCbD6jOn2s91u1zxxYIA9G7iHoZ0/LlqXfk8906BhVHSEkHiHp5srVGLNFhMWw6vUItrmrj1umi+AL82H7YWarsCuIpDSy3Z/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mv3gctODV4hLLyY9fhyTdUrJT3OZJMCcvvS3z+oVtTY=;
 b=gXH6DDdTjkIHWf1M0o8LypfUSl0JjeN8JhKr6qUqoVPmBxmQXxDnHO8V/CnXU/ySaDwtN+OsoHGzaaV+iJgVakGgAEyb1qzMmvqUVK98euKLkuCgqjJ4txm54DhCtClcFwcV+nEMds+v68/eE1qNiDKEpv7EibW5Sbog9Altgus=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
	"jgross@suse.com" <jgross@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>
Subject: Xen 4.18 release: Reminder about feature/code freeze
Thread-Topic: Xen 4.18 release: Reminder about feature/code freeze
Thread-Index: AQHZ5EwwAcMhmoMxmE+/YPpcDc9wAA==
Date: Mon, 11 Sep 2023 01:08:12 +0000
Message-ID:
 <AS8PR08MB79918D6EE559A2807DC6D56792F2A@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB8371:EE_|AM7EUR03FT046:EE_|AS4PR08MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: 941b8d80-19a3-4719-6148-08dbb26399ff
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0oZvnJ9WDSds9TqAcD1ZDUJL+VXOhOJiOmIGVf1umx9nI+5EZoYp1k8SAH3b2e7zJvSJBs9Ww+vb6LSBCScFPH/V0RdpPAj1WTy+ZpubvlUoB5iGA3eoKl8MSmrWoqZJWwITZKF8fdTFwmqocEv95r4L5Jh7kApxdd2zuSb/gAFP3S+l3K5Z8YfH5o17VcENCDzpFlPDGLkGM1Fm2gfzMvf6bucknVZk7DlRaeoKDS7geSJHkAmWjCoqKoPY4SH00Ql9dn/3r2bO+wP2ojC7O4U8Im+rrZhq+J81nnzHEsU3V4LqD7nnHMnLw3TeVtSPi65TXlVSbng/0yg5XddR6+/OhTz3EMScEYQTaWdd+KuE7819kxr9ZHxv2ZmSlFBtWZHgetP6KdFpbkKQKS/5SeNy4ESQ3J6T7Ae+A7UvaHcABNga6chzVKxpODnpNn4ayubLBugXhjrHIWjj+e046kbwDy6Eo1QTrSxelIjaRgqvQCXoToWx03MkoDDCWBBivy1NFmdS/de5eIWVvpw5b+O3cPyUvVh+GdZabO3hVUarnEsSsWoDwu5eWSnRt+ye+xD9UWGj3KYd2N8mKBBW0u5dEqPUOKmgYUu683FjYwMcIQ/FaGJ2OzZrM44wZJ/tByr3V8xRHIEyl8RQ64SLIg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(136003)(346002)(186009)(1800799009)(451199024)(2906002)(166002)(86362001)(26005)(33656002)(966005)(71200400001)(478600001)(7696005)(6506007)(9686003)(122000001)(38070700005)(83380400001)(38100700002)(55016003)(5660300002)(41300700001)(52536014)(8936002)(8676002)(4326008)(6916009)(316002)(66446008)(64756008)(54906003)(66476007)(66946007)(76116006)(66556008);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AS8PR08MB79918D6EE559A2807DC6D56792F2AAS8PR08MB7991eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8371
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	23f71c73-b6b0-4425-28f9-08dbb26391cb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3ncCt3qXbgI7lhpGaQvAY0/u3kXfKRHjn+gogLwPeVaLYDA/oLEO7KsXCA/kSLpXy3kUq/1IjW3v5MPSb2wQBgAPbtCMZMi5lG5vUJyRBdMebH1Ytod5ojeP5qWnoBA2VM0PWbzgO7m60kLPEzdEURXeM7MVWfa3b923Ppt40pVfWaOfYdhA3XwjVWzYHYSsrjt/zzR1cRMp3IHBjnTPOZLHO8QhN+LDyn4yO6FwriS4LVbmTsS9nQidO3fnku22fT25ffrqHuyXpFb7JtHZ7jGon15ETBHCm48CbNW29yrCUNl3rnwvbVFTv8t0LB5YPIG67OfqkqIT57zbd8fZJpQHALxkFwGUJLwG3B5MuzlIDHWRlfQhMcvw9EqxE8BswVU1j7Ef2gjTvrPVNB5m5TjXs7yzLjwspR0kKlygzvub7q+AwSHozeTGHUVtDK7PjnEf+MCvnAf9DVTUsnSfXfQAEtPMaUsfa8yS6rYTXEBEIbgVGIUdNb/CeBGmKPG6nQHJ+p5C3LDtWzYcOQGkgJazAQXEr1MwcSkMp4qxlOja3HFhzJcUq5kCUog2hrqVZ10mBzVI9g/PXum+4E09RkMZ34YHDEgOhl5AoF6Y6fGwKQWIsMJrqkToof7FEX3noL29noKLRXjWTJVZfu6KGgGjcUV6RqwGDDYL4L+ri8kHtCwPV+WORyR53Q3rTlUdZLwOaO3iUHogXsXvIbSn733nW/TNNoAIDpkI+M5H92g=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(82310400011)(186009)(451199024)(1800799009)(36840700001)(46966006)(9686003)(7696005)(6506007)(478600001)(83380400001)(966005)(2906002)(336012)(54906003)(4326008)(6916009)(8936002)(316002)(5660300002)(70206006)(8676002)(41300700001)(70586007)(52536014)(82740400003)(26005)(36860700001)(166002)(47076005)(86362001)(55016003)(40480700001)(33656002)(356005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 01:08:25.7433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 941b8d80-19a3-4719-6148-08dbb26399ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7480

--_000_AS8PR08MB79918D6EE559A2807DC6D56792F2AAS8PR08MB7991eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

This is the reminder that we are currently in the feature freeze. I apologi=
se
for the delay.

I decided to make the code freeze date on Fri Sep 22, 2023, to give people =
more
time to react because of my late reminder about feature freeze. The hard co=
de
freeze date will remain unchanged, i.e. Fri Oct 6, 2023. So currently we ha=
ve 2
weeks before code freeze and another 4 weeks before hard code freeze. If
everything goes well, we can cut 4.18 rc1 at Fri Sep 29, 2023.

Also, below is the critical items on my list for 4.18 release:
1. [PATCH 0/7] tools: More Python 3 fixes (part 1 of N)
https://gitlab.com/xen-project/xen/-/issues/114

2. tools: Switch to non-truncating XENVER_* ops
https://lore.kernel.org/xen-devel/20230117135336.11662-1-andrew.cooper3@cit=
rix.com/

3. dom0less vs xenstored setup race Was: xen | Failed pipeline for staging =
| 6a47ba2f
https://marc.info/?l=3Dxen-devel&m=3D168312468808977
https://marc.info/?l=3Dxen-devel&m=3D168312687610283

4. The proper eIBRS support for x86
https://lore.kernel.org/xen-devel/ec8e75da-743b-50dc-4665-854c446c974e@citr=
ix.com/

5. [PATCH 1/2] credit: Limit load balancing to once per millisecond
https://lore.kernel.org/xen-devel/20230630113756.672607-1-george.dunlap@clo=
ud.com/

6. [PATCH 0/2]  Revoke IOMEM/IO port/IRQ permissions on PCI detach for HVM =
guest
https://lore.kernel.org/xen-devel/20230809103305.30561-1-julien@xen.org/

7. [PATCH v2 0/8] Fixes to debugging facilities
https://lore.kernel.org/xen-devel/21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmai=
l.com/

Kind regards,
Henry

--_000_AS8PR08MB79918D6EE559A2807DC6D56792F2AAS8PR08MB7991eurp_
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
<p class=3D"MsoNormal">Hi everyone,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is the reminder that we are currently in the fe=
ature freeze. I apologise<o:p></o:p></p>
<p class=3D"MsoNormal">for the delay.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I decided to make the code freeze date on Fri Sep 22=
, 2023, to give people more<o:p></o:p></p>
<p class=3D"MsoNormal">time to react because of my late reminder about feat=
ure freeze. The hard code<o:p></o:p></p>
<p class=3D"MsoNormal">freeze date will remain unchanged, i.e. Fri Oct 6, 2=
023. So currently we have 2<o:p></o:p></p>
<p class=3D"MsoNormal">weeks before code freeze and another 4 weeks before =
hard code freeze. If<o:p></o:p></p>
<p class=3D"MsoNormal">everything goes well, we can cut 4.18 rc1 at Fri Sep=
 29, 2023.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Also, below is the critical items on my list for 4.1=
8 release:<o:p></o:p></p>
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
<p class=3D"MsoNormal">4. The proper eIBRS support for x86<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://lore.kernel.org/xen-devel/ec8e75d=
a-743b-50dc-4665-854c446c974e@citrix.com/">https://lore.kernel.org/xen-deve=
l/ec8e75da-743b-50dc-4665-854c446c974e@citrix.com/</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">5. [PATCH 1/2] credit: Limit load balancing to once =
per millisecond<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://lore.kernel.org/xen-devel/2023063=
0113756.672607-1-george.dunlap@cloud.com/">https://lore.kernel.org/xen-deve=
l/20230630113756.672607-1-george.dunlap@cloud.com/</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">6. [PATCH 0/2]&nbsp; Revoke IOMEM/IO port/IRQ permis=
sions on PCI detach for HVM guest<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://lore.kernel.org/xen-devel/2023080=
9103305.30561-1-julien@xen.org/">https://lore.kernel.org/xen-devel/20230809=
103305.30561-1-julien@xen.org/</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">7. [PATCH v2 0/8] Fixes to debugging facilities<o:p>=
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

--_000_AS8PR08MB79918D6EE559A2807DC6D56792F2AAS8PR08MB7991eurp_--

