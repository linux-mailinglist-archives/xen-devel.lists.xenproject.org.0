Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162BFA2AC07
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 16:02:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882908.1292993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3OD-00026I-Rm; Thu, 06 Feb 2025 15:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882908.1292993; Thu, 06 Feb 2025 15:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3OD-00023S-Nt; Thu, 06 Feb 2025 15:02:01 +0000
Received: by outflank-mailman (input) for mailman id 882908;
 Thu, 06 Feb 2025 15:02:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUPl=U5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tg3OC-000235-0Q
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 15:02:00 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2608::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 501606ad-e49b-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 16:01:58 +0100 (CET)
Received: from DU2P251CA0010.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::25)
 by DBBPR08MB10748.eurprd08.prod.outlook.com (2603:10a6:10:535::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 15:01:56 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:230:cafe::ee) by DU2P251CA0010.outlook.office365.com
 (2603:10a6:10:230::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.29 via Frontend Transport; Thu,
 6 Feb 2025 15:01:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Thu, 6 Feb 2025 15:01:54 +0000
Received: ("Tessian outbound b77899637302:v567");
 Thu, 06 Feb 2025 15:01:53 +0000
Received: from Lef98f9c57999.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2D8CCF29-E3C3-48D2-9CAB-167758674B9B.1; 
 Thu, 06 Feb 2025 15:01:43 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lef98f9c57999.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 06 Feb 2025 15:01:43 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB9PR08MB6603.eurprd08.prod.outlook.com (2603:10a6:10:25a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 15:01:39 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 15:01:39 +0000
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
X-Inumbo-ID: 501606ad-e49b-11ef-a073-877d107080fb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UVt9LGtshASSPNs87lShPUW64ImgDFylz4oA9ULdSRd/tjBNP76/wGn/jBDHmBTumdFKQyILPltMpJh91VZ3BS7F8pd0LvyF56AbMG52cfkpoK7XWqbPH3jc7t+Uh0G7OCkb5PRblsg96iao9lt+Z7t2k/Kn7GsdWywqUoZdYMIoxVHl8ZI+bMoC0g1hmDS3nWjRAp+CJghNiPcL7hHSKfeGafU9cmhLScZTtSfAzdUFhffvmRDkOEJA4EETQHefQbhhndBijEtSLGLeK1V7k3jBBP3QIIsjpxIfiB7kT6jQcrPJdVGR5povMQ9AvMvT242lSN0vClDvEtCH6C1D4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWPZxCELBs2R1/ChJWb1T8mSgOW396uZbGTcuivp3Wg=;
 b=XILQbSRyl3s2aaQ1/+WuA/9yr+XNL4iVEFMimTJQJHZq/AAx755jen8XzI3zB7e2hoQLaQ9pEEjD0sJaKlgplZhbsoTRU35k5AqsrIfmnICMZet7rZ5EOdtFeNNTgW7fB/UoHV5FNXAxj31SMssso4/lQJbhs9IEyXD3PL2bOTrGBYWcQjhj/6mJW5+CV+BqEBU8T+obUtE/RZ6wqdaTJ+M3LfFEbpHDlpvoFPKuE9EUsa9VDiE6hB4AHI27P9GXAsRob5QCynvlOW4RP8kVBZ86oLv9AM4AlQpd+EgHFeI9mBNKTwxFfwFDBUUZeCvTX5wd1LDgtDk7cIi4+p810w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWPZxCELBs2R1/ChJWb1T8mSgOW396uZbGTcuivp3Wg=;
 b=rXSQc+8FRXjPNxCZCZy3bbcdxL2ZK59kEzmyAOuJjUn1LXoqJ4d5VUstlHAQMU0kwngltEScPZILfha7sTRRQup0pl93/b8QM0LduKELV1lszghCo4kijThIN6JTYvpo7eogSeX1p56l1oIsXcVFS1+09wLkjFwvzikd/8miXZg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e0eb20e0deed743b
X-TessianGatewayMetadata: Wt2m1R4kFOfQPF7QkSnV2iKv+CPzFzGdWy86VKyLe58hJax/oA8Kc/IhjDd53ryGCQKjHX8Rf63uJeSr7TJPzm8cqI2qddAIeBtMpt2YpmDPF1O3/st8RPQ7nnp6RMi09+AvWXiI+BynwfvKxVV44OgO1ljSckBju9d65yMjVdU=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLnCemUJ8bV9kn5VjTrV1bd0JAZtU/ZqW50PLXNV8cigV9w0Y0+XFs5utRI6iHifIK/X440Qrxeyflub4BsuSb1S8xEjs/GOp5pfusv69H6AAVk6svbzHClABplHgShzWFe/QL+JE/dPJtAXxD+IRbKniGAOPNdwLDgSTwCstE47CWuzxaynetqXPJ4y30NfnLGaTjn85FEcPAbI20+1mOluSY93IMBvi5LETjoXyFuNJpPyVxrAwCDRtsnXGTOhNcVUXPt145ybW+Tkt1cmnCpqsK/KPWKXHEeUJ8ugO62d/yNXps5VKUl8wf09fkWVBNrMHD7qbOyee1y1pZLI9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWPZxCELBs2R1/ChJWb1T8mSgOW396uZbGTcuivp3Wg=;
 b=CiLJZxz9xxn2trpfmmRxdnpdTLYYO8HW70EJzRPHCYUQcgYlz326V6VevlKoEtFvRoy+iHV9TvX+UJnkqeT1NR7XUQp9+lCKJ/9VIHXZ60D7F7delWapJ0/zpMBmRTUnnCaE/eGQWEXx04ErIspfLJ4pMBzKZDtjsGuK/dP4S28u4g3YuQadZDWbgy1VZY64Or0NoNkARyrMQX//4VekTx5YWq47kAuafO1coA2GPxV9ZCbKwB6VUWoW98RG09vkPWxqDWH9jVMBpX4MrV9HgFkLAmpaQyOXbhEKvUKMZDZwr4l4Hp74AobuI3rDgqfz5784FNoH4BxEUwukxZCPVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWPZxCELBs2R1/ChJWb1T8mSgOW396uZbGTcuivp3Wg=;
 b=rXSQc+8FRXjPNxCZCZy3bbcdxL2ZK59kEzmyAOuJjUn1LXoqJ4d5VUstlHAQMU0kwngltEScPZILfha7sTRRQup0pl93/b8QM0LduKELV1lszghCo4kijThIN6JTYvpo7eogSeX1p56l1oIsXcVFS1+09wLkjFwvzikd/8miXZg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/5] xen/arm: mpu: Move some of the definitions to common
 file
Thread-Topic: [PATCH 3/5] xen/arm: mpu: Move some of the definitions to common
 file
Thread-Index: AQHbdzpt64DSSlVqrUGsnEaCrB85rbM6YXOA
Date: Thu, 6 Feb 2025 15:01:39 +0000
Message-ID: <18E074A3-A76B-4C9E-A8B4-8E23B07CB7B7@arm.com>
References: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
 <20250204192357.1862264-4-ayan.kumar.halder@amd.com>
In-Reply-To: <20250204192357.1862264-4-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DB9PR08MB6603:EE_|DB5PEPF00014B9E:EE_|DBBPR08MB10748:EE_
X-MS-Office365-Filtering-Correlation-Id: c7743c66-8907-4c05-8623-08dd46bf31a5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?mYhs67T9BrVVoK8Ai7GLvKGz5aYmwnaX818TyY9hvjih7NziCuM+5E8QiRZs?=
 =?us-ascii?Q?GjbZavqz4bu+QzTJatxW7kO4evI2DxYeks7jEdOAJDlslW7k56VFasPMC5aK?=
 =?us-ascii?Q?7m4/9ykMdKrjqdr61Dg75S4JCr8zwBRIDD9Eab4wu+EISLE3THQrEhrVzIRd?=
 =?us-ascii?Q?nFXiEVos/PfWIoyJLmqz31gJScs2/vx+FagYsi9dPs6Bv00EG52sjM2owsZw?=
 =?us-ascii?Q?CVvYI8v/Ybb54Tpj7kGmL20EqAXp0bgH8hponOYZROT0I9btdu6dJfbDPeFW?=
 =?us-ascii?Q?laZTsJktK4RfIPqcnYuUTBbkqZUeFdxCpu3nl2OzTZroJV9TZ8SDNpxACPse?=
 =?us-ascii?Q?8nnt5If5U4jpyUlClZNl/niEKQIGOZMrgHAMXc0MLwBH2QuwRFBCahcsZ1Zv?=
 =?us-ascii?Q?E2lPu5apeGMXiZLEv6LvEFL8x7QC0Ng0UQtz92tVhnXX1eg3T4BbfEJO5MOX?=
 =?us-ascii?Q?9frWOp8ogcyhCAmZYd4fPpCgC14wiG9EWDEzTIXrRgIkEbXiHP3fDnpL9XT3?=
 =?us-ascii?Q?4WUp514QLi2Lth76w6m/BskvMIduEqPWxAm5STERWmJF0jgAdYV8Er62+pro?=
 =?us-ascii?Q?LZlTkklOeg8so7w0cB2SiRiYQBjA+J/BJGmkh01qicC1BSRdBYMv051PbBzk?=
 =?us-ascii?Q?LP1N/jLxW7fUkSzipqTm2lVYN8i5MuldJElNq7GHLy1VGp2C4VWHaRyYwNBo?=
 =?us-ascii?Q?olBtJiRvr+sARd/u3iGx9wui2hzCBaZY/JImtINAucBzs3FhDNVwg+gxQCCf?=
 =?us-ascii?Q?TpAoybxM7qD6PyqRCyfgQvB+6zoBO3An+lzy1Yi78yIodz0zeRpTAYuHq75+?=
 =?us-ascii?Q?Cpsn9AT/vnIdrCT1toBJfiVMnanlUlWp6Q7hNHmxQCi3OTUJLY80Yj1lWENy?=
 =?us-ascii?Q?ajZu0m55ZJP9DizlIrfCdZkdPXUpcJ8Z74plQrwzo2nvzEeQ0W6yyxfNGuDl?=
 =?us-ascii?Q?tSMipKudl1V37ZL/IkNMdDTcR+9DejNxbXjErmA8eTnqOgEbCWMuXh74plvl?=
 =?us-ascii?Q?fCP2hPjsfNpGMwcIzx/gz63GzAWtI2DxRt4CmG+FawBQ86lpJf5/uLZfT6Kw?=
 =?us-ascii?Q?DVgt34sfszbaumDDJlD9t7uTlESMkaEbt6tTcG8RucWQME27PPP2k6+2VX+b?=
 =?us-ascii?Q?o6PE//+0b5L3svVKv4j9C+x56QBMXRQZ+oobvhoaCye0hGqiLmZGi3pqREpX?=
 =?us-ascii?Q?7tdVHHGq5/OtSb3WRKyudDg2Wg3mxSGhm7f9R3JX8SFPN+nvGi4g5kyAO1pj?=
 =?us-ascii?Q?thKStGi7Zm8M7r/v6xiD1J8LOhFLqlGLMPkKa51qeG1pO456mOaq8b39lNrl?=
 =?us-ascii?Q?N8E6HojHvmrnwkVq3eSRJtkt6/fv6MRXR714/B8IjPrKWD3N81eNNFX6E09s?=
 =?us-ascii?Q?9yC246UNWRXDQTB2nTF3PeHQb6+2BCg7qvVUqQC6kkFEdXWx2V6ufKCUkG99?=
 =?us-ascii?Q?Gkkrvxz2z8sNAiGBV3kJ8oMccPTjVnFk?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C033B562D96EB544A9DB2097FA08CFA3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6603
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	33e26b21-032c-4b05-303e-08dd46bf28f8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|14060799003|82310400026|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6ussrxKuoFala1d6vwsgdKG3z/GYcYE9B7qYH8zVHwrns7I363jxqaD+VCug?=
 =?us-ascii?Q?Oa+aQ6/4ZS7pTMpzw8ybtfjuo0v613xmNHKrmVY93IpV6TkZztUH7qiM7feJ?=
 =?us-ascii?Q?ORP4XE122qX4xdTrnjQFXin7rzmBInn0hjS6FGuohbD2/Ucsdk9q1rerw2dc?=
 =?us-ascii?Q?C4x9i+izFrjC1ii7B1l/Kr5FVBHNI3Qn2PKyH62czsC5FCcZ8lJVgC5+HbYk?=
 =?us-ascii?Q?UC9RSx1J/4abcbw1c/Ees6CMiQcBnUVw3kNyh9eA5fN8XA63MRAetU19X3fy?=
 =?us-ascii?Q?bASq0cTJULHLCMPw+CCMUwg6mNH55hLfoLjxHQ0mXeTwQUVUg2jFgbQoDNgS?=
 =?us-ascii?Q?hKmk53bVy/MDyB1xNxfDENQu4Pl4vtqjVaxdd/55ReMitJxN5tZj+GDo/07U?=
 =?us-ascii?Q?v0BX+9NndsL/vIgZE9jV3UGpD6oejdeJtvTl5M+bQfaVqoFhz5X+ibalsTDj?=
 =?us-ascii?Q?bCgNJKtXLEAQkUC7Mg2l9UZJMRm/lE2GyokUaqAUfIAjfNMioQOwgBK6pzk+?=
 =?us-ascii?Q?lXSV8vlvosAd5Dsc+GYJwc4jSdKvJMaWDsXXaLJ+xs3HLOM7EF67i49ysAz9?=
 =?us-ascii?Q?Z+I96KlFRyVcbD3jxZTJQ5FznW5u7xiEtIkTL06JJC6mnHfrTSxuMQsKGxTv?=
 =?us-ascii?Q?ezeY8onR9FuDEqoVQsfdnbI8QKaQoQrfelbFqkv31uXUdJ2Z/w3lVvw3o9VU?=
 =?us-ascii?Q?4IEKcPOXMcBuWLw3ymIFmXEhMLlQLWCSKoy9Ac0rXdT37Xkw1fIZQpzxey6J?=
 =?us-ascii?Q?ec2IHBzc8N2WiE4X4sDqhTqjMwVNSR55/pgmztbtbVxqWTDfiMO3cLpEgkv4?=
 =?us-ascii?Q?detx2VH8C/GHxT6OR6yIBlSU3veXe8G8x1WSf2qQubeZnAjHNh7Z6QrRHXf4?=
 =?us-ascii?Q?GHx4e03mhPC96jfgKgdQAr0WtUpiEgAHwnca5Gun2zF8hiz3eIEh4Jr/zTLO?=
 =?us-ascii?Q?bMHZPS+53SMazVhCNi83wYX+KBk110be5r2SLwmtfT08eZAZBct9naIn4B13?=
 =?us-ascii?Q?hfHYaXdFF/8dwtyZ5PGUIcHLB/HSDmRi2XSfC2UYNfrtyyeFEak+ni2pOqno?=
 =?us-ascii?Q?6uP81t5GTQBQg7pblr9HuBcWkcHLuj8506NxYegz9kWAJDcQIYg0RUWyYfMP?=
 =?us-ascii?Q?oKarYgzPOtVSXUQZpG1aupd8Lw3SUb/1287BOIcqRxrDMp0xLV9mrQIJaa6o?=
 =?us-ascii?Q?zcTX83bdmOI+jGgfRdwP5CJ1qarumcjCcC+PAT76hPM8TUOZwQe9pt1KA46v?=
 =?us-ascii?Q?HeEvAF4RD9FleMmCZbhocQ/aoKf1VgjBaVTKRCAIjz2BNMaR0I8pJ1XxkW5S?=
 =?us-ascii?Q?IKkJ7OQZ+vOWEClI/pkCAM54OlVNx3rUlJbZM6GCj7zJa85H3fHL+95rEnC2?=
 =?us-ascii?Q?r8QLlWZ3ArObSpnEyicHv5gBBYCqdRtJAsuT2mJerMgOQbSklcsOAeKk+Idm?=
 =?us-ascii?Q?aUmSfP1RZYQLkhePMkhLUuEgFRnDA1xZMLTN6LUtGybK3J0sWxk44tcvLEr4?=
 =?us-ascii?Q?cZUrzyyd25Nowuw=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(14060799003)(82310400026)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 15:01:54.1951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7743c66-8907-4c05-8623-08dd46bf31a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10748

Hi Ayan,

> On 4 Feb 2025, at 19:23, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wr=
ote:
>=20
> For AArch32, refer to ARM DDI 0568A.c ID110520.
> MPU_REGION_SHIFT is same between AArch32 and AArch64 (HPRBAR).
> Also, NUM_MPU_REGIONS_SHIFT is same between AArch32 and AArch64
> (HMPUIR).
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> xen/arch/arm/arm64/mpu/head.S              | 2 +-
> xen/arch/arm/include/asm/early_printk.h    | 2 +-
> xen/arch/arm/include/asm/{arm64 =3D> }/mpu.h | 6 +++---
> 3 files changed, 5 insertions(+), 5 deletions(-)
> rename xen/arch/arm/include/asm/{arm64 =3D> }/mpu.h (87%)
>=20
> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.=
S
> index e4f2021f45..7b659aa42b 100644
> --- a/xen/arch/arm/arm64/mpu/head.S
> +++ b/xen/arch/arm/arm64/mpu/head.S
> @@ -3,7 +3,7 @@
>  * Start-of-day code for an Armv8-R MPU system.
>  */
>=20
> -#include <asm/arm64/mpu.h>
> +#include <asm/mpu.h>
> #include <asm/early_printk.h>
>=20
> /* Backgroud region enable/disable */
> diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/inclu=
de/asm/early_printk.h
> index 219705a8b6..644fd0fcfb 100644
> --- a/xen/arch/arm/include/asm/early_printk.h
> +++ b/xen/arch/arm/include/asm/early_printk.h
> @@ -11,7 +11,7 @@
> #define __ARM_EARLY_PRINTK_H__
>=20
> #include <xen/page-size.h>
> -#include <asm/arm64/mpu.h>
> +#include <asm/mpu.h>
> #include <asm/fixmap.h>
>=20
> #ifdef CONFIG_EARLY_PRINTK
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/=
asm/mpu.h

Why not in include/mpu/ ?

Cheers,
Luca


