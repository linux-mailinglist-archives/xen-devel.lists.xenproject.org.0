Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5867FA5C2F1
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 14:44:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908179.1315327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trztf-0007St-GJ; Tue, 11 Mar 2025 13:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908179.1315327; Tue, 11 Mar 2025 13:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trztf-0007RQ-DN; Tue, 11 Mar 2025 13:43:51 +0000
Received: by outflank-mailman (input) for mailman id 908179;
 Tue, 11 Mar 2025 13:43:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azTi=V6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1trztd-0007RI-8i
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 13:43:49 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbeca8ad-fe7e-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 14:43:48 +0100 (CET)
Received: from AM6PR10CA0104.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::45)
 by PA4PR08MB7668.eurprd08.prod.outlook.com (2603:10a6:102:265::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 13:43:46 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:209:8c:cafe::ec) by AM6PR10CA0104.outlook.office365.com
 (2603:10a6:209:8c::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Tue,
 11 Mar 2025 13:43:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Tue, 11 Mar 2025 13:43:44 +0000
Received: ("Tessian outbound 0ad77f8d5963:v585");
 Tue, 11 Mar 2025 13:43:44 +0000
Received: from L6c144ed7cf42.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D353C4E2-9270-4041-AB00-D95F335719C1.1; 
 Tue, 11 Mar 2025 13:43:38 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L6c144ed7cf42.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 11 Mar 2025 13:43:38 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB9PR08MB6329.eurprd08.prod.outlook.com (2603:10a6:10:25a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 13:43:36 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 13:43:35 +0000
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
X-Inumbo-ID: dbeca8ad-fe7e-11ef-9ab9-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sjjsdhRYomavd6rBsdr60fa4oxvn8M7P/uCGgE72XinyE6NBvpjxgto84logbLnwJfCv23Ko4mRF0xdOK8TYP3TcieLgysfk4a1C3tIBwyxf3U2rVz6VR6bj3nt/VWdSQw/aIx8RcNLIhIZwM8xXoXuqLuqw4ZxF6Ohar+Xb1AH8AoRfSjEYhGSAf+m/h2/IfqKzvoAqixoLhs0n1cBRlANHSd0C6fdvIJtoUZOiMwzrAmhN6e4bqBeu/1Dlo6V3aotf2Ax7TY82HBXjwwWRs5iglV/Z4rlcc1Cro3ABwXqkRY01fH4BGk+4xu9oFKVtnYT0G8cIc8wbaoDNYJ1O8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MaYazL/QznHhlf+iCXh4lPyN8s3Cz1DVGUqb08LyYw=;
 b=QTYTG6CPopaF+sr2xFzzVKVkAvyCByuvCS/1zN5pCbkiMH0m2EuIohFjtZuRSzc41s6ec77TBVpPKZRWzWhKxaylQhOZk7wm49mggD7FtyfNDb4MttcDaW1FwQk3NCQ5qa0wWP7ZYCpWjNI39wtxKpT/WC1aNVudfx0fDvfBAiJSk0jRkvN7kA21YFMr092LqKbfyOZI/hK0sgSALOgJNe7+qAh2UVk/OQajIMOL3UW+YAvR7NF2yiQKLwfsq0mmUeLLsQiZlXXofKt6IVga+VoT/8m5E/6TKt3O6WpJuDtmS5dKDihF8kCSe09TPZ4m1n4be52kAjWrPfNUCETI+A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MaYazL/QznHhlf+iCXh4lPyN8s3Cz1DVGUqb08LyYw=;
 b=HaiGtdWR1QHO90rc2nz4YhzHMIfK8Cn1LxhcReRDO1hcpqvrlFIatPTUAtDTN7GAz3cGzhIz1uvZRx71Z4N+xnZQZKxO6dfeqUUO2RTeFHwyf5ZYSCFa2pQb0vPFWkLxCtXaDLPYQ0tKGbtLF3Oi+4tdTX10Z8gTi1T8UqCVJyk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 673977a811bef0a1
X-TessianGatewayMetadata: AUiDmhejoeCDGvHFZM+PoaoY7ZO/xcOkZMcRxgaPXPkdT02a0iEFKQeixWgLR0qjzj4h3JE40QwtmJOe9ndDrwoHgl+Pjw5AAUqdqzqF8qHmQbCK63UWN1TeywFWVH7UOS7zC1kMKQyJZ7JVkYR0exMThBTGV2TCim0QE/lxOgk=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8Gl8CKxX9prr1Oa/e48deiN28aNLtwOFVCLF3z+WCWnr3/FR3UVnsHhWvvKvF1FWjNebLW4bdbp7kYWT3cmuPPOdPGXMeRNsG9l+a4BB4l7WO72Jcoh1tsL9yV0IHahmYFFHp/ytWnQanaz0Kcuux0rDhYFw4kzqCbChREXf51KbNeyiuqlvZ5odROj2rQ5APaLXXRyOZzlmZw3PXFsnjRUjyQP2UgGpMyX6RBlOHV6hkgOhdwbZQyCMlFEfJ21kPdcV3KTcCtmlv/3VRzHf2tTLeQdEDt7/50TAoLXnzjRhbOY9MnLmomJ7sgu2MoP6TGY0w5wefYrdb2NfFX1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MaYazL/QznHhlf+iCXh4lPyN8s3Cz1DVGUqb08LyYw=;
 b=i1UnVeT7Dca8pv9cEprPRxrxPukEWHmxIoDbYw5GdwYiSrAiwN8wfL1MTQJBNB39hOc7mK2Xe1eMyzymUDiHH/TPATSBV5fgaAV7EUSjWpNTCstruhNYMx1i1x472xPLVkiQqeEKRYrlf6exrJqLRs9k49wYZyV/J0HspGJ1EBB9zzAmuN17AfRo7Kl17ZllYfb7E3pw545rxfrk2sO+EjgwD1qnlmK8or47wto2nDBMp4qvdAm7Yw3h7UE2cNMAdopnNKga+DaZv5z2JhEWxuR5TYkaABW3pTh1Ctx7x9WVHaqpwEmCu3074uGOgXEY9lAJbqVOt8R037UV353UmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MaYazL/QznHhlf+iCXh4lPyN8s3Cz1DVGUqb08LyYw=;
 b=HaiGtdWR1QHO90rc2nz4YhzHMIfK8Cn1LxhcReRDO1hcpqvrlFIatPTUAtDTN7GAz3cGzhIz1uvZRx71Z4N+xnZQZKxO6dfeqUUO2RTeFHwyf5ZYSCFa2pQb0vPFWkLxCtXaDLPYQ0tKGbtLF3Oi+4tdTX10Z8gTi1T8UqCVJyk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] xen/arm: Improve handling of nr_spis
Thread-Topic: [PATCH 1/2] xen/arm: Improve handling of nr_spis
Thread-Index:
 AQHbkmScFxwSwnbWbUmo6sX8GQY3CLNtq7oAgAAILgCAAAOLgIAADxuAgAAnBoCAAAHygIAAAtCA
Date: Tue, 11 Mar 2025 13:43:35 +0000
Message-ID: <13086ECA-62BE-4820-83A6-D05C84FA3D39@arm.com>
References: <20250311090409.122577-1-michal.orzel@amd.com>
 <20250311090409.122577-2-michal.orzel@amd.com>
 <69E0A550-5B43-4AE4-AD19-0456AA280871@arm.com>
 <2d66e9e2-e6a4-4552-960a-2e8d95555ff4@amd.com>
 <17173844-577F-44C0-AA74-984ACAEBABC3@arm.com>
 <8b06403d-02c9-49d1-a5d9-5aef57dde3cc@amd.com>
 <69752546-1957-4515-B32F-DB541391AE8F@arm.com>
 <df198c67-afa2-405b-bef6-dd4a444dc320@amd.com>
In-Reply-To: <df198c67-afa2-405b-bef6-dd4a444dc320@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB9PR08MB6329:EE_|AM3PEPF00009B9D:EE_|PA4PR08MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 41245b4e-80e5-4344-f6c6-08dd60a2be21
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?rgkwW+TJQoKTl4V4Qp7YYnzW9e+EqmYrZNg3LW4SJxdVdCiI4tL55oI6u4cE?=
 =?us-ascii?Q?DP2Mh4GJ1vsfVEkyKIb16hRybQ2Gc/wa8fY8ksw0ds069ooAvLh3glrI5chr?=
 =?us-ascii?Q?QlpHuauT/Tj8+9s4LDNFhnWDjommGau2NQFStDVit7QYw7c6wNPrySZ/yU+U?=
 =?us-ascii?Q?G45vPhjDpARr0qGeTXqktgV9AXUFjpv+5D5XAG34l7AOOVF9bxQNMTrspAyl?=
 =?us-ascii?Q?z4/lHvunSBN1q6/rY2DTolL33Qg4AnAdv5cpV9DnMT0nEqeddQuuIUcPgST1?=
 =?us-ascii?Q?RvrTNJMdTUdED70bLZWPoE636qn71alf2tOx4E7PP4bao3x2/5XXzKrSB5yG?=
 =?us-ascii?Q?XbkR46OXesbh03mHurkLaziw5bRuXTJMPMGm1NzgsPMlHxsKvlG+U5lyBP3W?=
 =?us-ascii?Q?oKJF2KqpkAk83h7/MeWro9oUcolO+3oGGK15Rq2Ht713ZTjSP7FJrJXU4LFw?=
 =?us-ascii?Q?X2uIvvsJwLhIwuqaIFd0RZtn6Y9L+71YMxlVNGByzt3Frw6gJy/STKmI9g81?=
 =?us-ascii?Q?OPA8UVRY6hGDg7WvMkRJFTZCWLgthyDznip4//Bi2nKzzTwbNGT94Y9O7Lqh?=
 =?us-ascii?Q?wE5/RB7LC0tJlDwWlKxEDt1SbJo8Tiw4gE5ahvpCqgAQSokLuLkPd+zX43XO?=
 =?us-ascii?Q?pn5cSifxn6ak3hZovzX5FZCxxNVeSYTMiOpW6BxV5JzijgTysRB5tDwqApUk?=
 =?us-ascii?Q?Vg/CPQBmHugzKN/Xk7MEHfglna9Nd05mqBkrkGlqtZqvtW0+j2+prLMC+oJK?=
 =?us-ascii?Q?5j5LK4p2ThODYpqB/AynenU2zc9LPz3Y1Ufh0OscfHWD83X9Jbra6dX0zXc0?=
 =?us-ascii?Q?wXZ5bzUOoNbuxc53yBV/A0rJDGPvNmfwDDOKQPjgHzLOw0vtP3TGDSKXWssA?=
 =?us-ascii?Q?+tpUQ7hEKSr30rOP3Dy6Cm+TVZF403Xuq5xlc2Vj1TXvLhmJrqKsRzS016qy?=
 =?us-ascii?Q?rHyp0u0l1mMyt3oY+2Vp8kuptKgtexMzrySpRulHkJJsQ3rdKYNCLUztZ0h0?=
 =?us-ascii?Q?e2zMl3RTWVNxtsJtWrdvokpBIqC5fVXO5c321Rw4FX/DhxYVyaK93c3cpEgp?=
 =?us-ascii?Q?Rmma4KaWBKVlJnbIrlGon0ghZxjBnEFRq/0w7GIieWYc+iooOjdJPqklxUyK?=
 =?us-ascii?Q?hTGjb74GdI6Tw948OZbagZ2cNex6/bviJUH1AuY93CnBM0UJgi6n8utA7VsG?=
 =?us-ascii?Q?G+NEz5MPowjZX0rSrrJG0m4EA2OutEQCqGXdzZd+U9UCYVdthtAIaH/05TgD?=
 =?us-ascii?Q?fAJXkVl5FwPEsn3EyN6Foz0PE218PCdjR+xV0CYQyfE7rrhV1KEl/LLck8f0?=
 =?us-ascii?Q?8LZNMeDxuldrTJxDDcX88jeRTtTVNT47YvN/vs57KwB29HEXxulX+urJjDDy?=
 =?us-ascii?Q?7uS0RIZzzgYXYGcLItgq2w6bx/A2TadQfczoea2btFyUk0KXN4a3M5TDwzIG?=
 =?us-ascii?Q?zoEMrYQp8/akfU52JgwC2+1RNRGcR4iE?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0AAB114CCAEB0D4B8E6B55824F8783D0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6329
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7eaa0527-09cb-4d31-2fd7-08dd60a2b8b8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|376014|36860700013|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K4xZ1XMSSoosdCh9/uiJb36yyJ5jfwiyFOZHF6GedwKUHMc705CDKgUvPqtw?=
 =?us-ascii?Q?gfw4ObzjxhV8+DmXYsH/bwKd3wC8sxy8QP60s6Ua1dMafj7h2aUcpoQdefOw?=
 =?us-ascii?Q?doW9NnD2avsFoSe2lWCLJr2OBxR2Q1RaacdR988wGP8wOMVOeZ6Yd/EQ4BUA?=
 =?us-ascii?Q?N69Aw7IbL7p58Fz3F8b5CtyleYVQvtf76Lib+C6jDVLVDTJdPvFyptLVjr1i?=
 =?us-ascii?Q?KG8QxPEqdP2Q4elJ7OaShS0G6eGaD2FVZDsVTUCq9XE65yzYQX2CNLoaeDzB?=
 =?us-ascii?Q?fwbeQIo15an9HAmZGUFyZB6d3BItT7iFSNQRoJz5bBTyaBV03z3AmVb1x9/c?=
 =?us-ascii?Q?owBjnZb7VsogOMSRcOKarRrm1WqxYtirrkt4qP+e66/ePWFe/xmF/c9KehLQ?=
 =?us-ascii?Q?IWinuqBEn1/ksjKmz15f8Q8Z08Ymvq+ZqC5N4wp4aXtnjLqSDneQl0SbKRIc?=
 =?us-ascii?Q?w1kZSCcViP8O1HUxSDd+5izh9lKkE3Y21JXUcT02Q8zTsF3QkEDEeqnoc6rK?=
 =?us-ascii?Q?rWrf9b++E6mQiN117Vzmex97Uoeq0QHGtXbEG7qVnwfW/S/FJMA2XYq/UeoA?=
 =?us-ascii?Q?DEdPPc4eHi5Gzsi4XD9CJ+XFfxHIj0HcjNj+z45Ycm7lbNafDv8dnh/ufSAN?=
 =?us-ascii?Q?thaFYIbGK5oDxHGDBFprUK/EKI71sUc2ejhTzqJjR8BDKfNf9Q4gstx7gB2b?=
 =?us-ascii?Q?nZ2O4IGUJaeZq52jw67LDKRYL9GV3ViEZxii+Ke7o26QlziMCKk9GpxIvF3k?=
 =?us-ascii?Q?/s/afcUbCSdsDMkm4Ka2qPKt4goEbMaTniEThNPEuTIdhk5rS7KZkccb1MA9?=
 =?us-ascii?Q?UfWb8isudXF/OMAOoDO9dwUwMxci+mJRhteRFbqEt9WsOhfos8hfv50t3ZcV?=
 =?us-ascii?Q?lNtAYpUBw5a2x+0jvVVE3/ug1OJR5R93TmhiXweHcqmnvkPYCd397sZwc66f?=
 =?us-ascii?Q?tvmQTxDZR8wfG2wPiCQ8ObgRpJ39C8ivxDcmpHUYG3g3v1Fre8HwmSwLgoBH?=
 =?us-ascii?Q?2Bv9AT35Dk0zsh7FpfYAs6BpAQaF07mMklkUZSmLD8DTZeiq3LVWbkDrer6O?=
 =?us-ascii?Q?BGR0+VI9LWM+mLvxt4936/0OQI7hs+BUvDb9kWbk81A+LGWY9XZLbQWR7amE?=
 =?us-ascii?Q?r1o72xPGHneh+mhwtoRs6uHad6NVR6brwftUgDqLLd6qsmyYKeadw417v9Lm?=
 =?us-ascii?Q?G4uDG0ckb7KCkZb8HsEwS8fM9QMK14kx6cYULH7OoibbmoKNRmtLMQ8KN7WI?=
 =?us-ascii?Q?8Aoqk7eMtjyNSdZ/pAx33levnTDfB8BlPGrtrR+fP8fE0q9F4Fz+kwzLPNnr?=
 =?us-ascii?Q?ZTNJamNXeFDaYelrGdS8e4s2jFOfABMTmKUk/6FU2DyyPoFDGESUUFFWFect?=
 =?us-ascii?Q?6iTOFjlP1X6GM7+yoUDeR7m8/BobROekkIKKYp++wPVb+XRo5YhiJuTosmbX?=
 =?us-ascii?Q?Yl2NXI20b3h8Hi3RkUyAOXVxWfzDlLyxr5xk6nCOm0+9DV+YDzvZW9XGH+Iu?=
 =?us-ascii?Q?Wxl6HnDH/PQE6kM=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(376014)(36860700013)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 13:43:44.6718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41245b4e-80e5-4344-f6c6-08dd60a2be21
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7668



> On 11 Mar 2025, at 14:33, Orzel, Michal <michal.orzel@amd.com> wrote:
>=20
>=20
>=20
> On 11/03/2025 14:26, Bertrand Marquis wrote:
>>=20
>>=20
>> Hi Michal,
>>=20
>>> On 11 Mar 2025, at 12:06, Orzel, Michal <michal.orzel@amd.com> wrote:
>>>=20
>>>=20
>>>=20
>>> On 11/03/2025 11:12, Bertrand Marquis wrote:
>>>>=20
>>>>=20
>>>>> On 11 Mar 2025, at 10:59, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>>>>>=20
>>>>>=20
>>>>>=20
>>>>> On 11/03/2025 10:30, Bertrand Marquis wrote:
>>>>>>=20
>>>>>>=20
>>>>>> Hi Michal,
>>>>>>=20
>>>>>>> On 11 Mar 2025, at 10:04, Michal Orzel <michal.orzel@amd.com> wrote=
:
>>>>>>>=20
>>>>>>> At the moment, we print a warning about max number of IRQs supporte=
d by
>>>>>>> GIC bigger than vGIC only for hardware domain. This check is not hw=
dom
>>>>>>> special, and should be made common. Also, in case of user not speci=
fying
>>>>>>> nr_spis for dom0less domUs, we should take into account max number =
of
>>>>>>> IRQs supported by vGIC if it's smaller than for GIC.
>>>>>>>=20
>>>>>>> Introduce VGIC_MAX_IRQS macro and use it instead of hardcoded 992 v=
alue.
>>>>>>> Fix calculation of nr_spis for dom0less domUs and make the GIC/vGIC=
 max
>>>>>>> IRQs comparison common.
>>>>>>>=20
>>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>>> ---
>>>>>>> xen/arch/arm/dom0less-build.c   | 2 +-
>>>>>>> xen/arch/arm/domain_build.c     | 9 ++-------
>>>>>>> xen/arch/arm/gic.c              | 3 +++
>>>>>>> xen/arch/arm/include/asm/vgic.h | 3 +++
>>>>>>> 4 files changed, 9 insertions(+), 8 deletions(-)
>>>>>>>=20
>>>>>>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-=
build.c
>>>>>>> index 31f31c38da3f..9a84fee94119 100644
>>>>>>> --- a/xen/arch/arm/dom0less-build.c
>>>>>>> +++ b/xen/arch/arm/dom0less-build.c
>>>>>>> @@ -1018,7 +1018,7 @@ void __init create_domUs(void)
>>>>>>>      {
>>>>>>>          int vpl011_virq =3D GUEST_VPL011_SPI;
>>>>>>>=20
>>>>>>> -            d_cfg.arch.nr_spis =3D gic_number_lines() - 32;
>>>>>>> +            d_cfg.arch.nr_spis =3D min(gic_number_lines(), VGIC_MA=
X_IRQS) - 32;
>>>>>>=20
>>>>>> I would suggest to introduce a static inline gic_nr_spis in a gic he=
ader ...
>>>>> Why GIC and not vGIC? This is domain's nr_spis, so vGIC.
>>>>=20
>>>> yes vGIC sorry.
>>>>=20
>>>>> But then, why static inline if the value does not change and is domai=
n agnostic?
>>>>> I struggle to find a good name for this macro. Maybe (in vgic.h):
>>>>> #define vgic_def_nr_spis (min(gic_number_lines(), VGIC_MAX_IRQS) - 32=
)
>>>>> to denote default nr_spis if not set by the user?
>>>>=20
>>>> Yes that would work. My point is to prevent to have 2 definitions in 2=
 different
>>>> source file and a risk to forget to update one and not the other (let =
say if some
>>>> day we change 32 in 64).
>>>>=20
>>>>>=20
>>>>>>=20
>>>>>>>=20
>>>>>>>          /*
>>>>>>>           * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map =
is
>>>>>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_buil=
d.c
>>>>>>> index 7cc141ef75e9..b99c4e3a69bf 100644
>>>>>>> --- a/xen/arch/arm/domain_build.c
>>>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>>>> @@ -2371,13 +2371,8 @@ void __init create_dom0(void)
>>>>>>>=20
>>>>>>>  /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>>>>>>>  dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
>>>>>>> -    /*
>>>>>>> -     * Xen vGIC supports a maximum of 992 interrupt lines.
>>>>>>> -     * 32 are substracted to cover local IRQs.
>>>>>>> -     */
>>>>>>> -    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), (unsigned in=
t) 992) - 32;
>>>>>>> -    if ( gic_number_lines() > 992 )
>>>>>>> -        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceede=
d.\n");
>>>>>>> +    /* 32 are substracted to cover local IRQs */
>>>>>>> +    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), VGIC_MAX_IRQ=
S) - 32;
>>>>>>=20
>>>>>> and reuse it here to make sure the value used is always the same.
>>>>>>=20
>>>>>>>  dom0_cfg.arch.tee_type =3D tee_get_type();
>>>>>>>  dom0_cfg.max_vcpus =3D dom0_max_vcpus();
>>>>>>>=20
>>>>>>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>>>>>>> index acf61a4de373..e80fe0ca2421 100644
>>>>>>> --- a/xen/arch/arm/gic.c
>>>>>>> +++ b/xen/arch/arm/gic.c
>>>>>>> @@ -251,6 +251,9 @@ void __init gic_init(void)
>>>>>>>      panic("Failed to initialize the GIC drivers\n");
>>>>>>>  /* Clear LR mask for cpu0 */
>>>>>>>  clear_cpu_lr_mask();
>>>>>>> +
>>>>>>> +    if ( gic_number_lines() > VGIC_MAX_IRQS )
>>>>>>> +        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceede=
d\n");
>>>>>>=20
>>>>>> I am a bit unsure with this one.
>>>>>> If this is the case, it means any gicv2 or gicv3 init detected an im=
possible value and
>>>>>> any usage of gic_number_lines would be using an impossible value.
>>>>> Why impossible? GIC can support up to 1020 IRQs. Our vGIC can support=
 up to 992
>>>>> IRQs.
>>>>=20
>>>> Maybe unsupported is a better wording, my point is that it could lead =
to non working system
>>>> if say something uses irq 1000.
>>> Actually, I took a look at the code and I don't think we should panic (=
i.e. we
>>> should keep things as they are today). In your example, if something us=
es IRQ >
>>> VGIC_MAX_IRQS that is bigger than gic_number_lines(), then we will rece=
ive error
>>> when mapping this IRQ to guest (but you don't have to use such device a=
nd in the
>>> future we may enable IRQ re-mapping). That's why in all the places rela=
ted to
>>> domains, we use vgic_num_irqs() and not gic_number_lines(). The latter =
is only
>>> used for IRQs routed to Xen.
>>=20
>> So you will get an error later such an IRQ is mapped to a guest. Trackin=
g why this is might not
>> be easy.
> I did check and we get a nice error that I find good enough, e.g.:
> (XEN) the vIRQ number 260 is too high for domain 0 (max =3D 256)
> (XEN) Unable to map IRQ260 to d0

Agree this is enough. If the user does not get why it says 256 it will
be able to find the warning earlier in the logs.

Thanks for digging

Cheers
Bertrand

>=20
> ~Michal



