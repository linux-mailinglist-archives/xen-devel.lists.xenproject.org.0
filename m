Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9B6A7759C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 09:50:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933573.1335489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzWO2-0000Ed-Fd; Tue, 01 Apr 2025 07:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933573.1335489; Tue, 01 Apr 2025 07:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzWO2-0000BU-CU; Tue, 01 Apr 2025 07:50:18 +0000
Received: by outflank-mailman (input) for mailman id 933573;
 Tue, 01 Apr 2025 07:50:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hrmQ=WT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tzWO0-0000BO-JY
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 07:50:16 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2302159-0ecd-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 09:50:14 +0200 (CEST)
Received: from AS4PR10CA0023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::15)
 by GV1PR08MB8380.eurprd08.prod.outlook.com (2603:10a6:150:80::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 07:50:08 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::a5) by AS4PR10CA0023.outlook.office365.com
 (2603:10a6:20b:5d8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.39 via Frontend Transport; Tue,
 1 Apr 2025 07:50:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 1 Apr 2025 07:50:07 +0000
Received: ("Tessian outbound 5d826d745fa9:v604");
 Tue, 01 Apr 2025 07:50:07 +0000
Received: from L6e0d3955cd35.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A10058C8-0E0E-4EC8-B378-688DCB4C357C.1; 
 Tue, 01 Apr 2025 07:50:01 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L6e0d3955cd35.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Apr 2025 07:50:01 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by GV1PR08MB10455.eurprd08.prod.outlook.com (2603:10a6:150:16f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.51; Tue, 1 Apr
 2025 07:49:57 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 07:49:57 +0000
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
X-Inumbo-ID: f2302159-0ecd-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=isXX6ZtfckrC/5XBQ5hAP2ojw56g790ENRjXlIh2ZoaY/zMvRd7qWYQ3Vm8hDGJT7fUqW8AhQnRQr1d9XPu4biOa/sUfMx4V154IcxYvKXbxyf2Ghd7T8ZBHM/cAe3F270f4F4m/9i7e++BxuqXeEHBW/gvx2q393kl4B6bamf+PSxgOye+Wj6sikPs7Q8GkJIJ8R6H8LCXOUhjsSxdcMIWCAAOaAMdKANTtBF0nhhsvFsFYwp7V01qlpSKxj6SpDQRCth3aaf7gPxqVTcNq5n176L4nbsvrHpWfOqcWsrKcONiBhIkSJuQhY6pR3GXXfd2MvGu+Bjmprl/aVYJErA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USuQfzxBUVNlwPYZRuVv6Yeh3NFUDbJv5/Ei20OuS/s=;
 b=CL8FY+EMjhH4f1VibT1ARxqd2Hih75b92tKIwM7gTy4B6lOuhwpm/mrSms/oTDRzikJkxGUZDGS6boanHbXgT8kQ5ADG1Q1Pjwdf0sg/ZpVhO2VSWin3NI4DKd3Zb+VawgrSKkB8WS6lX4g44JJRTsyHFGKP34MEZXtRWwrzzdoDV00TTtyVInXGMj0ZBwQ9NhBuIbuJdojJbrsU4IadGOGMlc7IatF7FNEhVgf7LoLHuJqzEAoXxsXkbr4VVgQdxisw8MTj/52+/FjRbYPYLizuiTqFnz6w8RiqkGG42qJjbH3IjmSW9y5kBhLAXfcKwRxXnpy4Y1Z7K+PaHBE2Ow==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USuQfzxBUVNlwPYZRuVv6Yeh3NFUDbJv5/Ei20OuS/s=;
 b=oBjdQ1AyQg1TEEBcR0mfp6itgQhWEB4+z2ZkP44o4lG390HZU/Rc7rNlSX7VzU1VKSQD2VKhhQ2gmZ9Mcyof5m4KQDZjkXTOj6c5/gJXXGrZApQxuTxJpqMHpVyMC+WUs+VhTmJz4QRtkYctx3dmh643XfuTmSBk9pC5PgFNAeg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7ae1b8f3b6facffe
X-TessianGatewayMetadata: HDa7dnEjzEkRFrc7oc8B+mlu1YzaAlmosx9f9olLoX0JZOKGkgyH78mdzoxGvRoPpzVyjQQ0p8W4trBDmb/H2TDPzzPDNlkA7qIsXMTVAPRMlG4VWQ+WpMmYfdd4CmuTEJUNr62Gn/fHDaZL02Bg90S4/7WecC+goAX8qn48P6A=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJifkbxPZXUOFKPiw3jo6IGpEiwiVIvPRqDnG2WvKQ0JwYN4uOOF77fUCmnPdQu4xqMIjYZPWEwp7FJ2KwBo7A7b2WvGoP2X63FPUJvqvn/yYITI8GuaZWONZdb74DQoU8lwpw8CF8QTKa1UBhJPCsP7r+HUVTSvdVtwAfFSotxv7XymGFZXoGY4kib4XEbZjXScCLMEg3Xr26gFZ1/7bOnTuX2A94Qt2+ShWcmYgOgNfxW/Y8dx0uV8Ohb2ffJHNosTzbgnhLhBKHfRyEsPXzbyE6NcraOAGU+RhBoiDnGTtJ5wcdEkq6PzhjIwP409IW724vtL+rHvKTYFgfyIiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USuQfzxBUVNlwPYZRuVv6Yeh3NFUDbJv5/Ei20OuS/s=;
 b=J0ZeuA+ircU3Q7p7d9F5ZBvt34Qf7k0EvdoG8WRI3Yi9xt0dG1WFO3Hwx9wZ8D65YYn2+07Dr9loO+S5rUA6im6Hj3El/+CrBszD9JzfzpWuQ8VG1CH80jInwYAeAdE28Ae9VpXGxG/k72wCEI2zjv/sJy0OQ+L3UmB8huI0UupBhEWc6kAZphxOnCczvdxBtnjanIoye+n6mKUB4fh1gnAVCpwAoKnmJGB1Oi3GS3EeWPithivwvDPzK8GZg7G40pYE1Qi5DpuPOOPX6Dmbt+vkhWbyQ8s0w/uqBD62/52MgDyoGFxNtSoABVqsKXokXXZ0N5DTMyFe4Den2hAiQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USuQfzxBUVNlwPYZRuVv6Yeh3NFUDbJv5/Ei20OuS/s=;
 b=oBjdQ1AyQg1TEEBcR0mfp6itgQhWEB4+z2ZkP44o4lG390HZU/Rc7rNlSX7VzU1VKSQD2VKhhQ2gmZ9Mcyof5m4KQDZjkXTOj6c5/gJXXGrZApQxuTxJpqMHpVyMC+WUs+VhTmJz4QRtkYctx3dmh643XfuTmSBk9pC5PgFNAeg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jens.wiklander@linaro.org" <jens.wiklander@linaro.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v4 5/5] xen/arm: ffa: Enable VM to VM without firmware
Thread-Topic: [PATCH v4 5/5] xen/arm: ffa: Enable VM to VM without firmware
Thread-Index: AQHbnMQpJ/OSxu9MyEmYd5oQRaZ927OGF78AgACVfQCABZFUgIACPS+A
Date: Tue, 1 Apr 2025 07:49:57 +0000
Message-ID: <5E8833E6-D4CD-49CA-A8AF-E2195759BC22@arm.com>
References: <cover.1742824138.git.bertrand.marquis@arm.com>
 <0f5cf498c3c511ed192e8b7b7d0f4987e00e5c0d.1742824138.git.bertrand.marquis@arm.com>
 <6727ece4-d589-4ab4-9172-07dd6a7f2b44@xen.org>
 <8742853A-E32D-4BA5-AA4D-C69A2FCAEE85@arm.com>
 <504f5df7-4d23-4fbd-a15d-632262f2b685@xen.org>
In-Reply-To: <504f5df7-4d23-4fbd-a15d-632262f2b685@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|GV1PR08MB10455:EE_|AM4PEPF00027A5D:EE_|GV1PR08MB8380:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ac3e2e-78de-49dd-ab39-08dd70f1d2aa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?3k2LR/vuwo1UB9R+l1MVgamazpwXSqd8B4jyjZccxFPnbggZS2Lz0pEX9yp8?=
 =?us-ascii?Q?CvMzaWA+GhPelWs8hoKU7H6truHtHwuG5WOFaiBOqfiDLX2w4tpyNcaDa9l1?=
 =?us-ascii?Q?bjtX1Q4Yf5J8nt7OmO6HW2lr7AbHJXd1uHQLZM4TZjGT3eP5mDbjcviBHnAN?=
 =?us-ascii?Q?DoS2UyyFKgWp2KWNhwO7srxDNlMz6pK1yU0T1lNLpLDb9JoWMLAdhwV6XBPx?=
 =?us-ascii?Q?cdc5NBBYtZ6MdJNVHhPQDFKGJMHbUMLNS1ibR0DagKTpFtdDoQ8uILNt1VMS?=
 =?us-ascii?Q?U5c5eboJ71KWopuTS2S0T5sddAqSZADsQAMP8pKAqbSYop+wft8rwyYh+6W4?=
 =?us-ascii?Q?Nev3l4Eq4uEvgYlazG+OQRtfQfN2UokfBI3qyl5ZT7dGaHPBGcfUGbWuLXQq?=
 =?us-ascii?Q?URUiAmugMu8LqbSXxuwCElMll/uafloSqFZoRrAdiq4R0TmXlMjaxGaIdgiR?=
 =?us-ascii?Q?b/xBY2ttjndNP0ge/CYbCbbP0wELTIYex1rwLo3bCT3eLyN6rKKmo2H3jsDl?=
 =?us-ascii?Q?oYuTrAC08V5fVeUYEn71aqhWXnOrLf3rhmYsDiOuz2VrS2C/ZbPX+2/2boHO?=
 =?us-ascii?Q?f8PVGV6jIEZaJ9o06qzFJzkuG/cYiH5d6DNts1dl1GVvt7l6jupbzN6zDrqu?=
 =?us-ascii?Q?nEux3sJuSSwSpq1E2e6TsMnRviEDNEBlcLs2HMS3TvkhzSN3l2LtXg2Qw5ge?=
 =?us-ascii?Q?s+ewpd+eGSzMLsMEqqx+kyJrYb9L4aE2di7mbHe5/OI2WyZ58LowRwGfqhTV?=
 =?us-ascii?Q?L/9M+hM89xEpeLmhFD4QyvEpFRHfI8dYeu6nq9MRs/igi9zyILjTzkZwArgX?=
 =?us-ascii?Q?0l0jub6ybQp3rDJE/Cn1JgM7ROLhexHBmBcEFtcWahaq6/L7ZpcoRwBQQy16?=
 =?us-ascii?Q?1DKwgHGZ90djtOFJxFJyTRlGUq2dVP0t8oQRw52EepBwzVTBlNDUeqcBqdhs?=
 =?us-ascii?Q?aFP+EDuzV5k/nLZUiOlmq5gEzni8F+bVP7WwuwM7lFiSuGSv/VVGtz9ZscTb?=
 =?us-ascii?Q?Qq+fYcMsCvWMbGn3PZ9vYtZLfGu+AgL77iNJUkndWLqdtpsDUTMtdxNSnXTN?=
 =?us-ascii?Q?FHwIN4wOcCsGe+r4ilHRJc+ArZ/nr06yfijh4mjpUkNWLVrddoyIbpmQRcBm?=
 =?us-ascii?Q?1U6hwN+ynaIMWZiLEHuu5vitnO2VOD0XqopSbPAdQW4ZmAeSPxliM4K4ECk5?=
 =?us-ascii?Q?A0321QToqUg9u8BFK0EWyHEuT4Osa7dOhHSESxB5cGABhJ6GKIuuAMUQdOZK?=
 =?us-ascii?Q?55J3BP/ZQhso/Ljij4lM33SiHe74tKjKLHHhqK0nm50Wc50m60HUVN2Sg9De?=
 =?us-ascii?Q?GLT8zXkN+YmomPX9hMJQhGHP427SrhJVBuLn+HKPPx0m59IdQtSI8H09Pvyu?=
 =?us-ascii?Q?Exs3kicGLe/Iy01BF5zhmQpLKODh/whJKGFx3Ttd3vZRQM6r1drPT8xjUj3Q?=
 =?us-ascii?Q?kudKWNNaSas5sbnMy3TwNSJGt6s2Je/m?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <24C15E4CA0D56441B0069AA749715A5F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10455
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8206e0d1-a81e-45ab-a507-08dd70f1cc80
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|376014|36860700013|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SNkFA2TKodAgziV5jqXOHMms6HxU5luhDaDrlyjn43azdbZflqbtL6PVOKWr?=
 =?us-ascii?Q?5PpfPC7iXjQhJT9qELisP+PUKflzOnM0ynlKmj9pBYitYvfhg+9CMdyF8auA?=
 =?us-ascii?Q?1FZrs2qbLtWhkPjbDidd2/dIVSX1Wdp8gKK+MTeSita6DWVli3+bKEqafW5B?=
 =?us-ascii?Q?E29QvuCXYFGLiMnN4WgHtGyzNMk0aZsNrnGNPa2JbIu8KeFWOyhUTgXRPveS?=
 =?us-ascii?Q?oqRQ19aY4D4DviB5eSzRKZIFTHuYjjzab6073x0MZ7Xr46+ErowMqrB2JBKV?=
 =?us-ascii?Q?X/l0SZQbMWZFoZaaDRxzD4LaxGRpHdV12dReYAVqR1M9IFNjKZVpPKOm2Hon?=
 =?us-ascii?Q?EhzZNIqwNhlztIUSyEArlQ+Czwie4V/dOkFnTKFdVjNM/n2eBGk/uqajN79R?=
 =?us-ascii?Q?Tc0I4MaX4aA5F/UOvwzFhuARV4/+G4qsGOyqswrpkJc4tOL0TTg0JpV4gofv?=
 =?us-ascii?Q?r8od2ZwYVyTDvy+Lrq/oqzvvLjoW/hwtGzKhcvc8yyqFFPucJ+C9UEpWvMo4?=
 =?us-ascii?Q?py5fFgevnsxop5h64khvxD/Yd067XsBEAkYxz0rc+u258ZK3p1aSvAIsOOrj?=
 =?us-ascii?Q?vzIxrqtUwSrGdT7hoeHKHLE6GZSL5Ukn0cpI/aEUoeAMry+gTOVibSxa3lXc?=
 =?us-ascii?Q?9UyhmmmElolQk3XWlSiKVwoHcv07olmlC1p8dHDZLIQvnIKbvp1cytZxJIJd?=
 =?us-ascii?Q?xyTkaEarfGnkggZozWsXLVd5lZNSocYBNCX+15+k6Ug9/enl1zJhCEXX39Rz?=
 =?us-ascii?Q?qkLxc9wt1RBkI7xOi2oFGCRX6Qb9gyHEk+ucqcKlts7WPEuTfVPMvh7mpvgb?=
 =?us-ascii?Q?W1TFn6YYjhkFNrt6jF2NBiNumHY0KSSb2XAq0F+uXlzDu/0FuxtYYvc0kSe7?=
 =?us-ascii?Q?xatUPjEfWWCjo7VsDWxJOrUle/gp9wWBRkuoDu1eQ5W8u4saYg48NiACWU1y?=
 =?us-ascii?Q?ltwodwViv8rNvMgAFaeiH6WlGThCMKsAW53IRp9S5/x0ISUSqa2dQPXylL1y?=
 =?us-ascii?Q?GPZ4vCBR4EYpgqgt104sJaiT3KAhSl7woWNOF0gs76TARKF5hrPeeywjl81y?=
 =?us-ascii?Q?xWHu5elCpGcFbFZ0VcM1Gx/pPSoz7JYGIHwfJL3HxU/O1xqk+EMhd8Jyhqb2?=
 =?us-ascii?Q?E40BquJPv2YNNzgF2UHHy7DTqHHeqSTj03WfpcW6MwRgdi0oeuO/h+lMLpC/?=
 =?us-ascii?Q?WIsN2xysmkCvypl902aIMIvE8gjUKM5bEszdw2icsNQ1GxVUzjMCXyUdKy7x?=
 =?us-ascii?Q?zrd0yWjhaJCN1URQxT7Rhy+Mg59RX4rZtti+LvPRV+XG30ijkRnoKvgG3YYB?=
 =?us-ascii?Q?SI5FoBVOeauolFpJF9bs9QTvdub25geJWLmkgoJGmEpjJ5IdTtWIpC1L2NYO?=
 =?us-ascii?Q?l053VNHL+4sLJF59yCUmVwuxk2NAYujy63Du+5+cY1ooo1nvZYzsHPi+P5Ra?=
 =?us-ascii?Q?kNc77bnle6rL8RzDZB7BAWeJs4GjvtzRU3FiHSM+VYYEhXGBuZUqm1E7byQs?=
 =?us-ascii?Q?kNPAYfuBKh3b7D0=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(376014)(36860700013)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 07:50:07.9683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ac3e2e-78de-49dd-ab39-08dd70f1d2aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8380

Hi Julien,

> On 30 Mar 2025, at 23:38, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 27/03/2025 08:37, Bertrand Marquis wrote:
>>> On 27 Mar 2025, at 00:41, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> On 24/03/2025 13:53, Bertrand Marquis wrote:
>>>> When VM to VM support is activated and there is no suitable FF-A suppo=
rt
>>>> in the firmware, enable FF-A support for VMs to allow using it for VM =
to
>>>> VM communications.
>>>=20
>>> tee/ and the callbacks associated are meant to be used for mediatiors. =
My current interpretation ist this is only meant to interpose between a gue=
st and physical resources. Here you are extending the meaning to "virtual T=
EE". I am sort of ok with that but ...
>> I see what you mean but FF-A will not only be used to communicate with T=
EE (even if the primary use case right now is this one, including have it i=
n a VM instead of the secure world).
> > >>
>>>> If there is OP-TEE running in the secure world and using the non FF-A
>>>> communication system, having CONFIG_FFA_VM_TO_VM could be non function=
al
>>>> (if optee is probed first) or OP-TEE could be non functional (if FF-A =
is
>>>> probed first) so it is not recommended to activate the configuration
>>>> option for such systems.
>>>=20
>>> ... this part is concerning me. You should be able to build with CONFIG=
_FFA_VM_TO_VM and still boot when OP-TEE is present on the system. This is =
not too critical now as this is tech preview but this is definitely a block=
er for making FFA supported. Can this be mentioned at the top of the ffa.c =
file (which already contains existing blocker)?
>> OP-TEE supports FF-A and in fact should be switched to using it by defau=
lt as it allows it to run in parallel of other TEEs in the secure world or =
have FF-A compliant SPs running on top of OP-TEE.
>> More and more you will see FF-A popping up as a recommended (or required=
) part of the firmware features.
>> So the only reason to use OP-TEE without FF-A is if you have an old OP-T=
EE in which case your firmware will not support FF-A and using it between V=
Ms is probably not required.
>=20
> Thanks for the clarification. I know we only support OP-TEE in Xen today,=
 but do you know what will happen for the other TEEs? Will they adopt FF-A?

On Arm the idea is to make them adopt FF-A yes and it will be part of Syste=
m Ready recommendations in the future.

>=20
>>>=20
>>> Also, given this would expose a fully virtual TEE, we should be able to=
 have a system where you have some VMs talking FFA and some using the physi=
cal OPTEE (or another TEE). Whether we want to support it is a different qu=
estion but this design would prevent it. Is this intended?
>> Right now i would say this is definitely not something we need as part o=
f the tech preview as anybody using this feature in Xen would use an OP-TEE=
 with FF-A support.
>> But from Xen point of view, we should (if we can) support running on old=
 systems with an existing OP-TEE but still use FF-A between VMs.
>> This has some consequences on how the tee mediator and FF-A support is d=
esigned and I will definitely give it some thoughts (primary idea would be =
to decouple FF-A with secure as mediator to FF-A between VMs somehow).
>=20
> I am not sure we need to decouple anything. Today, we can already specify=
 the type of the TEE used by a given VM (see tee_type). But we are enforcin=
g the TEE type match the one of the current mediator.

Yes for VMs this has to be specified explicitly, this was the idea behind t=
he command line parameter for Xen to.

>=20
> So what if we allow multiple mediator to run and when the domain is initi=
alized we select the correct medatior/ops for the VM?

Right now a VM gets the mediator selected by configuration if it is availab=
le.

I do not think we should make it automatic as there might be good reasons t=
o not allow to access a TEE from some VMs.

>=20
> For simplification, we could even hardocode FF-A as the second mediator.

That could be a long term solution yes but we definitely need to solve the =
access rights first.
As long as VMs can use FF-A to communicate with any other VMs or TEEs, the =
current approach is the most secure one.

>=20
>> For the review side of things, am I right to understand from your commen=
ts that this ok for now as tech-preview ?
>=20
> Yes I am happy with the approach for now.

Great thanks.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall
>=20


