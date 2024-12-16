Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CDF9F2B82
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 09:08:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857564.1269789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN68L-0007a4-1U; Mon, 16 Dec 2024 08:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857564.1269789; Mon, 16 Dec 2024 08:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN68K-0007Y6-Us; Mon, 16 Dec 2024 08:07:16 +0000
Received: by outflank-mailman (input) for mailman id 857564;
 Mon, 16 Dec 2024 08:07:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=952r=TJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tN68J-0007Y0-9n
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 08:07:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20605.outbound.protection.outlook.com
 [2a01:111:f403:2614::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1fc722a-bb84-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 09:07:13 +0100 (CET)
Received: from AM0PR02CA0207.eurprd02.prod.outlook.com (2603:10a6:20b:28f::14)
 by AS2PR08MB8832.eurprd08.prod.outlook.com (2603:10a6:20b:5e6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 08:07:08 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:20b:28f:cafe::3a) by AM0PR02CA0207.outlook.office365.com
 (2603:10a6:20b:28f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Mon,
 16 Dec 2024 08:07:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Mon, 16 Dec 2024 08:07:06 +0000
Received: ("Tessian outbound b4c479532664:v524");
 Mon, 16 Dec 2024 08:07:06 +0000
Received: from Le616b5eb4440.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1F791742-4497-4487-BBCA-1F58B2EE7E53.1; 
 Mon, 16 Dec 2024 08:06:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le616b5eb4440.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 16 Dec 2024 08:06:59 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB7693.eurprd08.prod.outlook.com (2603:10a6:20b:50b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Mon, 16 Dec
 2024 08:06:55 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 08:06:54 +0000
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
X-Inumbo-ID: c1fc722a-bb84-11ef-a0d6-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hRb3mpU9DUiQrdCIdvSEo7fmJKt700Ocbvjok5JKAuZtRUIX3nEDA9l+FVcw1qBLmW8dRVTKvLCh+c5Yhx3HzAZc2G7ZLspWYkOl6Dtzvkk8j5uwbUpZSycBjMb56CGod7vWh0jy+/l1wBMzAPWEQ/qi2Z9S5vpVJdE2utO0AjcA3V5PukN5SMaaEMVXAkM0szLdw4Tj8f2rfnhA3OJI5rwkOKJkyFreQnZR4OnZ+4U/86kdjgL2BFhCO8808qZKAgEmCbzArhIciuhNdNlgc6YhTE55Z73yIzyHaRd1FFwD1GUWjIXHv+IUxb9EA3u9E3b+LscmGqX5nReRR1SyaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykHkM1i8na4wGJSlOKQ1GvbGFnUZhRjYH11j9HgkP0A=;
 b=w1HabQ1TM2XBYrZ0aYpWKjhSicZFFd+cwE8O48lukYT9hRKVRwM4dM02NBTeqgM5jkFI6nCIQl3Lb92XzyDSnN8G/cYr9h81B/SRJRe6iQ3T675x+Xqb2dDw9nJ3DyvUHR3M1Smx8oEwcFOfeNX/LsVHdE2QCJG7LysrmML9rA2F+Uz2u1FUM0/OlwSIiac2y6BW7pU4aQljEfjdu5uuqW88S6Bg7D+Ke/VQOYhg4By/sX92cXKREb8oxhhilJ7YatZTRjwcll41iZW0wzpglQU4mymC+z9ha3zHTbC3+7ijekSPttdmDC1liw//BVP/7ov22Cv2Yr208AWiNBoe3A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykHkM1i8na4wGJSlOKQ1GvbGFnUZhRjYH11j9HgkP0A=;
 b=K//NkHN6ZPPF/LHSGbIOhOQaGUCmElqjMQQMuRlgJ5DMQ9RSJeJgjVctYc9xn2TrS4jEmp2vyhCbB6LBKEqx9EgyCy/rhK2jtTYSKsahK8NHpQr44yJgXDTEZij9MyVacn1lwIindjlAkdjnydGejyZmjJpz7KUwDVELI1PST7g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b5bd94bc582082ed
X-TessianGatewayMetadata: nScMtncYObil3Ebf3wZNv8TAOP+WP47Jz9zvK2jTMQUv+H3wJdxyzQWlnaD2hReqUE9s5xQ8Vh8uemfpP0lt9d3KnQ5ApqWCItn8U7OehSmUYK1+O1EkcOWABP4FeouEGQ9355TCvxRSd23RGcCxp6xYegXaITmLho2JIhdbGSg=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ez0IIkR8o+a4dbJpBIDpo65srq+aCSvdyoS44H6BGYaTzFsTUaILxJ8/8CYosoJGEjqUw3gBeaF8m4GqsxN5Un+35O/0U8uqhSAyuRfUP8/je4yKNoPH4acAyM4cSM95/qKgX1bbyGJ8uTEaT8tAI+fJrHXBu/aym6m84ZD5xPLzuPpARbUo+4w4aI5p+uFvhuwwDRxn/Ftw+ERc2Yq/xpO6vP1/8GkaAW+laaGDr9x8Ghr+xmVPBrZNncu5mpYVBSbaRfO5P2AuaTJCu+Q3WP92MV3hNeoikRDWPV44n72j7WXgpK7nXvskXdsxdIxINW+zajCax3765T9suj6ghQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykHkM1i8na4wGJSlOKQ1GvbGFnUZhRjYH11j9HgkP0A=;
 b=i8Ot+I4mbYq3plUIvDSWz8BuHwXE1S8l09dzaHU9fbFKITlpnDJmQw4ZiQLgsGtvZPlcwd6lkaSgcSOHTcMaUjSw3GDG7GhaaugINrs0RqCKeehNMsxJpCBbaDoJWi02C0/ij318GZPzJVgSR04VLgEYWijgnhInpHVxwvvvDR0qMtc5mpPVd27M/9RZf1rlRXQ46EOtHtm5io1dBZzi1ULLbA9EIVugdKWXlKyq6RhAEw6Ys4uXl0ygXDIF3GEeDPGTg2cZCPQN6iFt47XyTSmwrsDIoSypX+o7M4QLIHZn8zv4YKVSgsT+TFAnknvjQx2o4N96ZTmWcd2hKTwyww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykHkM1i8na4wGJSlOKQ1GvbGFnUZhRjYH11j9HgkP0A=;
 b=K//NkHN6ZPPF/LHSGbIOhOQaGUCmElqjMQQMuRlgJ5DMQ9RSJeJgjVctYc9xn2TrS4jEmp2vyhCbB6LBKEqx9EgyCy/rhK2jtTYSKsahK8NHpQr44yJgXDTEZij9MyVacn1lwIindjlAkdjnydGejyZmjJpz7KUwDVELI1PST7g=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jens.wiklander@linaro.org" <jens.wiklander@linaro.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 04/10] xen/arm: ffa: Fine granular call support
Thread-Topic: [PATCH v3 04/10] xen/arm: ffa: Fine granular call support
Thread-Index: AQHbQOahZBVDYXOcj0uVqGja5nIgjbLk4umAgAO+LIA=
Date: Mon, 16 Dec 2024 08:06:54 +0000
Message-ID: <03D53BB9-1751-42DF-9AAD-41B25E915027@arm.com>
References: <cover.1732702210.git.bertrand.marquis@arm.com>
 <1b02c9c1df9ff2230e076f25398a5de876f98a51.1732702210.git.bertrand.marquis@arm.com>
 <8d8ef7f9-d73f-4ff8-8af9-4e73cda97624@xen.org>
In-Reply-To: <8d8ef7f9-d73f-4ff8-8af9-4e73cda97624@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB7693:EE_|AMS1EPF0000003F:EE_|AS2PR08MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: 66a9ee84-4872-48df-2442-08dd1da8a1fc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?DNC9UuNFGxF2JFkqRiI91WqeDSFdnLa6Dz9xAjZeanvPfy9a5VjhTUQxij5z?=
 =?us-ascii?Q?CJsCgrPh69bb4elq2TUN+oBQA5ZT54fPu9o0iqlnEZG2adOOuQzXctIu/iNq?=
 =?us-ascii?Q?2VYcym4gkjuQ1CDv3xMsP2+CfUzyDdZcA3vLIhCa2hD1tO7ILIyWjGkoTZsp?=
 =?us-ascii?Q?medK5hI9KHjWvq9DFKmnJltrYIQmUGKT3bwdExG9i0zT7GmLOt1bc7R+KJEF?=
 =?us-ascii?Q?VPvLH2nAADks8Gg5+YwsHoEUPqLSulUW/FI7jM5lB38DGOYZFFZfYgn8k0oT?=
 =?us-ascii?Q?cYQT3smfO5j5EaPVDIMDPIxsNsejf72M3JeRm8gzKoy8MPSGA2u3o+rh+StP?=
 =?us-ascii?Q?z4b5Yb53T7Ceu+PrS7yNJdhxlH9Kcm1A1IL8QmtbhTJewKGstSDAbSmEhMNI?=
 =?us-ascii?Q?ThUmLEN+BY1aL+wpWWHeE9Fr3N6R/R7TShn5CoVjOkJ+v2WIuxx51ojw4p8C?=
 =?us-ascii?Q?qOyRnr7sFhbr+RITH11J0lSnhs1gCZYuuYPW5Tz2bkmDIP5Ehc7Wnn/fxarn?=
 =?us-ascii?Q?9R6QxofWBacVyRJw4Ltro2ywPviJKcZcEoJtZddkokfJLYSn4Ui6HrK9NEY3?=
 =?us-ascii?Q?CZYX00IxuYA1JcaMOAQdQR/Ul/LiY+uMS2pB8h+IyITqPYOwNAXhv+Imc3tZ?=
 =?us-ascii?Q?ckumigbxBjjgXdhe1mStnCU/ssSkaeh4Evm7KYLWSPLzKgxJLLlGwzgE3+Kz?=
 =?us-ascii?Q?tEPKhTGqsubFI0roVtHTXfiTtmr/GC5597tl6LTlZxBkSIVJ76qgKOs7VyHJ?=
 =?us-ascii?Q?OCRsgzzvoj0vNjjQxf6sPDHdvssBys1ZE2ebp6sSdWGCgSpyeEkGy9gAMb14?=
 =?us-ascii?Q?b5RS6/lJGtf93c8GbH8CLeP7tSL6zW0Vx+0gNJBqGgKG2mnidi/t899fmXCA?=
 =?us-ascii?Q?NX/uKHmtSgqpc1we+Py4KfpwXMH6Hg8+RY2weE3+eyBPtpRIonJFVKE/Bhhu?=
 =?us-ascii?Q?moyUvA/OcyIxrzyy7Vt/DNgnNqiYFig3wC6ggN0pELxzCAqdrEG+5eP1sQc3?=
 =?us-ascii?Q?wb/KSixDe9x2u47UnBV9tEdXYO8IgAQ0bSx0ozoniQASXKlLD5izqV1O/Df0?=
 =?us-ascii?Q?fdg+I6qlKJayjPE6QSo5k/G7rGqOPdYmzL+oKmJeis3/ljF0Zh/Adab3P7N1?=
 =?us-ascii?Q?5sdBy7tVlz/2WIaZcNAqrNTtQktatmHiiXlFm+qPYZHAIXkel/sfi0lSrfCV?=
 =?us-ascii?Q?qEI6CngUx/G4BaoUQg2t2X/RWeU6jNIKeRSxv19WPvN7LgLyPEypySv7OzQs?=
 =?us-ascii?Q?dhy+fQKACBHnx97Zbrq1ChntPqb/yYK9zcoTAWQWW8CsZx9nQyHfzEIKT3s4?=
 =?us-ascii?Q?7j4fvDDzdE92ntHNNJZVaaIP6BSF1l5q/b9Ste4wxBVVfoB+VvQnvPJUiXdq?=
 =?us-ascii?Q?xGRcQlnFNrNnVqXY/8rkDTzPN0kwuO1WfHsWJlysY3+Bo8AP2GF6qJCVmR6B?=
 =?us-ascii?Q?PdPzFv6KXOJ2CvbdDiq4GkYVlKmFZmBD?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6F77F50B2F93514DB4EE21D3F070BAE0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7693
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c0c25af6-dcb0-4de8-512d-08dd1da89b09
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NmNiTokIQyYO5CFNUYYWTmOT5zLmPr5/OTGSK2C86dOSE4NWCF2JVToV5f+Q?=
 =?us-ascii?Q?gRTbT92ippsneMB6XBnleXVn6RUm0xoBcSWN/9pX7ls3AsoZeNgQ7GjtbhMk?=
 =?us-ascii?Q?zEUM7Ig4zxFITSuY/PKLqcS41K7BBDaehDwLHukeNO2HypiUlk0OL4Nqlekw?=
 =?us-ascii?Q?+Fs2Rrvx2aX/f5p8PzlHOkXBxYkj2afwkC4/iNscbq/jCesmWdNRJnADOCx3?=
 =?us-ascii?Q?1paaU8Z+8tVGAs6mreHJGSuTNPB2e3QXgwhEpgxpEYqUVOh05/4KZ4cvLh3Q?=
 =?us-ascii?Q?I78FRsZk5OnKKggMbmQcK3sGpbW2IV4yHQ3JNK3GarqVe13zoBRtDtDZJCD1?=
 =?us-ascii?Q?cI8nhCIDMcBfLzvnoUC5zqX9y5JEbjV5pj2rZZ4N0GL+A4LpEysCQsNJ6dev?=
 =?us-ascii?Q?VuTBhN0kKw2fiaY+ClncpG/tKihLkoqigk6b5f2abUmacer8jdJyl3JBkSKX?=
 =?us-ascii?Q?9YQtoA2Dj8Mbe3G+tPOhh7alpDRQARq6yDEi4upeBh31Vs2VFod1RWYiGam+?=
 =?us-ascii?Q?+b/NlMpVE3TbW3VerScp8SQ8gCTBDrHUA9wvYe/ajLWfyYc8ehmZm0SujVxX?=
 =?us-ascii?Q?iXONlkLLTKfqNFcRLBXxMRfR2ek8wIJqXIHo2aqsHt8lhtMW6BzFR03Gs3m0?=
 =?us-ascii?Q?n3p7Q17feOLKMgn3KzIcJdPWclXHZhphBa4525E01i8HsgLiJohzAXlYCtz4?=
 =?us-ascii?Q?xUzElk46VU7OLl7WuZ59PU6mtoJKo2OGqrswvVA1Ve1f7Z4Xkgo9vD1FykqF?=
 =?us-ascii?Q?EVOguZku34l1aQMx2qRXEBX6yZ38tzhL0cYN+8fL3RBqiva9Hytj8kIJ1ysA?=
 =?us-ascii?Q?YCmLwShlir8wKtHdHVhKRnsKL6fOmervLhk26//ujleOVr5SrydLwVWLAokH?=
 =?us-ascii?Q?Ax0PN7K4mI3sToAgN571gbodHZeZPEia4PSZrI78I6FMJZ7fxlfZrE4KqH4L?=
 =?us-ascii?Q?dwciy04xtf/Bo4PXhSJDNMgQcFZ4/Zgj93o21Qnh/JtjzrrfKXiBGIOjafl3?=
 =?us-ascii?Q?aAHviTv0vB3MUBpfiZfHaSkSF2qDSQORVMjvR8jvDcUrjtpcVlcWqepgCK2p?=
 =?us-ascii?Q?UxNhGMK0dueURWu8oVUa05TvIH+9eUTCm56J+00C0vLqnv5uTdOwN43QOp37?=
 =?us-ascii?Q?cCjqHGHC7tKqs5FaugZV5oz41e2Hj+qa0ezGmyhX891EOYmNj1n5tQmvEG/I?=
 =?us-ascii?Q?whxRu44Sa/YHWIj1F5MYo8AVoRRAD2IkVuYvwSDxcTmwp+kC7czF21vKrB0J?=
 =?us-ascii?Q?bHW0paH/6KzPO3YeAOr2Ce7pzQWiz82q8EeYdYM6VQNCr/Ic2xpV8XDAOY53?=
 =?us-ascii?Q?QE3fZiVvBI2FE5QRcZizvKVd0WAbeA8nZhy6b2Au39DCHGsKBCYYOKYVKtdC?=
 =?us-ascii?Q?px00HRcXL2IOMazWO5Fq9J3TsyKEhgX1+l/iWnNQXPim7E3zLj5cuWOYQI8R?=
 =?us-ascii?Q?w3NQ6rx3mH4niExcKXrRqCZiV07cLIyyonia1MwdQVPlJCpCUS3CQUBvV6k7?=
 =?us-ascii?Q?VCXFZMCr4iFdZak=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 08:07:06.4595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a9ee84-4872-48df-2442-08dd1da8a1fc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8832

Hi Julien,

> On 13 Dec 2024, at 23:57, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 27/11/2024 16:07, Bertrand Marquis wrote:
>> Create a bitmap to store which feature is supported or not by the
>> firmware and use it to filter which calls are done to the firmware.
>> While there reoder ABI definition by numbers to easily find the min and
>=20
> Typo (I can fix it while committing): s/reoder/reorder

Thanks for the finding.
Please fix on commit if that is ok for you.

There are also 2 minor findings on the patch 7 that could be fixed on commi=
t.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall
>=20


