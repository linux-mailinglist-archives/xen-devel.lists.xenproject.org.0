Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB4DA4BD09
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 11:56:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900180.1308099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp3SS-0003Ka-9f; Mon, 03 Mar 2025 10:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900180.1308099; Mon, 03 Mar 2025 10:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp3SS-0003HS-6h; Mon, 03 Mar 2025 10:55:36 +0000
Received: by outflank-mailman (input) for mailman id 900180;
 Mon, 03 Mar 2025 10:55:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W32C=VW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tp3SQ-0003HM-VW
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 10:55:35 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2606::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 062ff87a-f81e-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 11:55:31 +0100 (CET)
Received: from CWLP265CA0282.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5c::30)
 by AM7PR08MB5416.eurprd08.prod.outlook.com (2603:10a6:20b:10e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 10:55:28 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:401:5c:cafe::51) by CWLP265CA0282.outlook.office365.com
 (2603:10a6:401:5c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Mon,
 3 Mar 2025 10:55:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Mon, 3 Mar 2025 10:55:26 +0000
Received: ("Tessian outbound c3a902884497:v585");
 Mon, 03 Mar 2025 10:55:25 +0000
Received: from L982abe5780b5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3CFC75D1-C5B3-4BFF-9FE8-4EE3E93100E1.1; 
 Mon, 03 Mar 2025 10:55:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L982abe5780b5.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 03 Mar 2025 10:55:16 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by VI1PR08MB10297.eurprd08.prod.outlook.com (2603:10a6:800:1be::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 10:55:05 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 10:55:05 +0000
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
X-Inumbo-ID: 062ff87a-f81e-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tArGjVds1z3GoY+N9yV5C0nVrd4X6WExhnhozSX8Am+Qsk4Jr5M83KpZ95bcuk3V4i62RtMMndDWDD2sMX86tP1rLqiviIv7Iv5mdlE3/alpVNUTlTOdLpKaN47GdcGEiPlV6UXFXFcKunkryC3PrjwMwiDUB0QOyLhGAESY4YFgdN71tx+PhfKF4xciSxDsHlDs3wwLydgHdLKH9hdMVQ/r8PcMMZBtjrHQZQh3gWjRjP1lXTlNVV7ZTAE0PDYBTIisNpjYGxRc2qUc1GWxWNOuV4R8G/MbrOUQ0E2GgMuxlUVcWAFN/BXQIGabd4DZKy11tAn4VN/jbclR8krt2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrdXhi2lIyRTdHeSLM75x+Fh+9AVE7Q6S4qMlPqNG6s=;
 b=UfYFLEnDkoeL150pGNOnJb0G83DNKeFuEuuj7jyH+gKBu5s/H2aYGq21DDqMg6SKBNRneGOk1Y2UuhA/+XiT3QwwEcSXBBjJ7YHCkzv8Q+u6OkA1A93pU2i7j1TYqd6eNMqPTxE3BpnFNOKpsrQE1Gng7bOy4u1LWH+jNb69pkuSusCqpv32x4IyQ3v6aS9YS5CV1obWqLjOHoVtc59KHMEUmvzMgQvjdbCcFI5JNUDWr+Nim6jSp6Ccj2MituzOT9paM9F0dIlR7Q0FUAL4y6gHeENaDYWlEXG3h3AqnN7ydZ0dIm9EwUf0XNi6j7+wGDhNz/XYmgCqsWf4rb4n6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrdXhi2lIyRTdHeSLM75x+Fh+9AVE7Q6S4qMlPqNG6s=;
 b=UQ5VsQM3iABoms9V0JPmFvWQ3qgh4jKCOYMMGNxQR8ZFovhaxiC1R7eGMhSqWUxnFS0BWLwE9X7tkdeIsD2uhIipFC6VVhwz9C+cwY7eWramGOFBqa8DWEuuN1TzeIKTwR4+EYaaz0Ld5p9qEt/fZugnUfvREiXKwVoAlJH4HD4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ce0d29f39659946a
X-TessianGatewayMetadata: jTkNHHEtWj/ka4d1c0jlu1c5dV8SQ2eZ70vYqVrQBoMeE73bUqZDzo/I/QIQOVoODlxPG5qMvLccPPIjNDZ+T/yynLtrB+Pzrtt3MZVh4oZmUT4RZ9r9iGU3QdDMcUM9aGcE1ACjf0cbDrJuLb978w22zpoSCT9ybMdHQDgxaA4=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJHbouuD5+AUAHHcD7Zb7K5i3LZAEXMjT5IrdiEDEAM2ZtTh2cv7gJlnynbgwWSN8VC43TgC1HSx1XN3hAE9Fncs3TFHKAa5lwYb23eW+1X6RDchQFBZeumnUYvPpyX6BQgLG2dwa5EFr4A7Atz9jdYP+1Q+NBWZHjmK/wl/Icnoo6hP+rDQuvZcZzOEU2KiXX+OZFBgPIf9tSHfRrxw+2aKlxpStgEbnoGWHKFWohc6l1k8I/q9/dRhzfbSLduwKOsrBfOv4UxL/6SbWEW04+7c5jutBi3sGyM7mcs+Zd2EAtH/PA3cQeXMEwb4YNxGGOzmMDDW6nHml8cAAJow4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrdXhi2lIyRTdHeSLM75x+Fh+9AVE7Q6S4qMlPqNG6s=;
 b=atZuxpYwp7DLRUP+owZXhVQkfVswvM+EoWEu/PXmOxxDgdX0znZV5t/+APKP49Aj8wBRbNpgSG3/h9Qigb0zECQnaq3UeUUJb0dVyM0LxkuzsCdaV+meST0z61dE9wJ1dgOR3kNPOPlWncDu0/AxrlWuZIN05YHrvrvyBgSF7CJkhZRXiZmMYiikQsn5tkZtq34IU3VT5oXAP/thBModftUQHkUWkBp+KSNPtVFsnb+DRjgrigd10Ya22vWS4VNAuNzPxcvUTO2PngB9DcmiNb4htPB3LEPlvCLT0XkD9uJFML1rezMSnLytQn9XAFneAr0nKvwHop/wDHtKN6ETOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrdXhi2lIyRTdHeSLM75x+Fh+9AVE7Q6S4qMlPqNG6s=;
 b=UQ5VsQM3iABoms9V0JPmFvWQ3qgh4jKCOYMMGNxQR8ZFovhaxiC1R7eGMhSqWUxnFS0BWLwE9X7tkdeIsD2uhIipFC6VVhwz9C+cwY7eWramGOFBqa8DWEuuN1TzeIKTwR4+EYaaz0Ld5p9qEt/fZugnUfvREiXKwVoAlJH4HD4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: Fix platforms Kconfig indent
Thread-Topic: [PATCH v2] xen/arm: Fix platforms Kconfig indent
Thread-Index: AQHbjCbmP0ZUYpmvC0C3Nis8IHvt5LNhOD+AgAAE2IA=
Date: Mon, 3 Mar 2025 10:55:05 +0000
Message-ID: <07C70CAD-EDFA-4E40-9957-5B1469C2B094@arm.com>
References:
 <fdf893f3d685ad48340ae8c11ecf0723523c35ad.1740997574.git.bertrand.marquis@arm.com>
 <8a557cb8-7640-4c67-b59e-d62accb56293@amd.com>
In-Reply-To: <8a557cb8-7640-4c67-b59e-d62accb56293@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|VI1PR08MB10297:EE_|AM4PEPF00027A60:EE_|AM7PR08MB5416:EE_
X-MS-Office365-Filtering-Correlation-Id: f94f5f85-1574-4185-e9e3-08dd5a41e7cf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?DonP66DcSYiwymcWSsW06moeWJIoK0xXPWNWKKMsVuKeskp8DPtWsRKYKvj/?=
 =?us-ascii?Q?Bhcnue7YXZYUHF2osPL0o24EYocEhqmUZWkEZiVbktoOhmsOQMIoh0GXQD7/?=
 =?us-ascii?Q?aaYVZDJi6/Sb4JIro5sqq40dBoxYJiSqFOIutSIn5JuHoa2VI8KHnP0k7q2Y?=
 =?us-ascii?Q?dRNBbBJAQ8jOxcsY6VRtBlPAuu0VeHkqRMvFqXp9/scywQUr83qHW6qKZQC0?=
 =?us-ascii?Q?EbqjynE46IvJIA7sBsWCgpUXw7LdoSaazo3el9SllUJn2aedFDPWWh+dNOqi?=
 =?us-ascii?Q?h9pEG3Ga9R1lJpn7BYXfv6RsbtPuz2An0w/Pj2EKEAOXjer+H5GZ9tg/VFUA?=
 =?us-ascii?Q?vuGiE2lKmxRnd5F1l1VrY4yED3g79JEFQwaom2EUHagoFnW4OiHvRl55MSup?=
 =?us-ascii?Q?0e512sJdnI3+yq2zS7+6sksSQqjDlRto9hAcaPB+PgMJkELd9iBar01gHwB4?=
 =?us-ascii?Q?7GDxiYv8O5Qb6NF/FHjyTpa/ACkxEISjRMJ7CWQEuWsWwTaihAtfqhwhYwXa?=
 =?us-ascii?Q?vsLpzUXGa5kmwMjldVGLeF9tbV8UsPx8RlMoSxE8y9NzC0TSn5CIU1hE5je8?=
 =?us-ascii?Q?UorFyRATJbg1betuBQPSfOtamCCQ0Yqzm4Yy7O7BnZ+KPpKJ3yaT0uct0B5r?=
 =?us-ascii?Q?OfQ60LDpppio9u2KaO/Oij0S2AOxsQGV/dwBh5yxVHTBxCMImRVerD30gG3A?=
 =?us-ascii?Q?CYGHkEnFslFaXUYUUwLFzErTR6YzahKid2+1Xo2xFM659kW1+05z/VNnDDyi?=
 =?us-ascii?Q?JmmZXQi6LocSqhMeHrxI44e1jiE+Q/zPnLrIuvJJes/sI8TKdfN3PoMyqjkI?=
 =?us-ascii?Q?I4EfdtwlH+op8q7L3okk8ZcDTeJed6RwiOq26FsjhW+IEBKLCLVoD7KfD/8I?=
 =?us-ascii?Q?cxeKLwAd7qufG9y6P2UhLpRHUHakLLyNqs105Qv+2+9f/8vmZ4sANyWFUH7h?=
 =?us-ascii?Q?PWzGjkyFrHue+8SVt6yA+ZnfiBHbQ+1xVzcHLFKrwdq7KLIOXHtb4J3rwRhT?=
 =?us-ascii?Q?U8dQk+x5tQDGPzFj5va3HexNMMhbs1U5GJ885ke3R2bUTNFKwrn7CYMCme93?=
 =?us-ascii?Q?UfCDP3ecA83FOhwZjN6jM/Y2Us+zftcDIVxGcTPuOMaz/DccK5S1rEMUeC50?=
 =?us-ascii?Q?xEHuvwAb7gzzI3dDVFnt2Jb2aIP5xgN2w3pRP8SbSDIHVNybPapmsyYSonWA?=
 =?us-ascii?Q?92ov1lxx7+MeC/U0KuEkY//LCEA3N2TRpcHqi9h1z44enWXJfrUAwp2gXJOy?=
 =?us-ascii?Q?DKSbE8fj9MqtPdim1VKIKZuKorS22J9xfL+wyph6eQ6tVG9SkS7QTTccwd34?=
 =?us-ascii?Q?hlE5rIZR24tupsZUsw5gRiv3embV7cGvlWSjGJVL4fEvkvSM/COvLLvQL7A4?=
 =?us-ascii?Q?GJqlQhjEi5shkSm1+N/8+rdCHbkDfdnDHZihjWRGUWEUrD1enmRtVg+HG4Vh?=
 =?us-ascii?Q?z3jiOzlEqBTrOEf3s6a8acjDUajaXDMM?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9DA7AC3042ED73429E0DCCC525D447A3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10297
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4bfb3f3f-b041-4360-e2d8-08dd5a41db40
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|36860700013|1800799024|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JHZTPw6YmLxsX3OruTuTE34WUzfkFy1ByEGknoMWROVywDGB15UZtqjx1aTD?=
 =?us-ascii?Q?Ok4QS6JCndDfeg0mej9qC3v9xURuRuYjUmXjGS8FKdD06f01tAYpd/vznMEM?=
 =?us-ascii?Q?RUm4/I2oy+jexwIBfe67k79zMNy9PJEzuyxxqiTfoomGuYN9X1NpiTK0C77t?=
 =?us-ascii?Q?P5K049t4a+408WlO0X9WZ4qxoIdaudxhLZ76EApOcAn5+9STcAGh2dQnk/lO?=
 =?us-ascii?Q?hr19XBboamClTGsCyAhYHA7PKrGH3+i212kPxVwpWahIDHOE5+qq+tajq8my?=
 =?us-ascii?Q?d4o2RDrlRoZ/Ql4z1lLosEF9Xaaw12lvpbmL0r6cwncTotfUMbjDFtp7rmc+?=
 =?us-ascii?Q?AocJvCSaeMXmsG4FTHa6WslAYdMlZP7TopLB9qvy/Ern2ycG9AyHcc2491Dw?=
 =?us-ascii?Q?X5C+KSB4zKyHALHYozgOlB4F8hs3klTprH0o9m1VcUb9m70VjL9ftvR6yFmj?=
 =?us-ascii?Q?033sOw0Pc+icbrGvSOpki5lvVRZHf2uXfwa+S9xV6+oSBOSuaT1ndbkoMtCq?=
 =?us-ascii?Q?OYKzuR0zZzWH8OMLF4ceLtYOjU/rMFl/iE6hOISxu0sHMh9p/XVis7f+Adra?=
 =?us-ascii?Q?c+mtlb7g0XkOIOoc065dP1TofRnQAGOKf0WqefbQ+keuV6nDW9sp3HcA98XD?=
 =?us-ascii?Q?OwZeJn7eiLOiEdPCGKyJj+StnQO92gMYr5OuO9oXmmE3z9k54axkxqGrhjCQ?=
 =?us-ascii?Q?6Nd/eENZxauKiZ4OYo2g7ymyOUzpqz4qxyeFYBR9FSao76Sk7rsatkGf0gtW?=
 =?us-ascii?Q?hK8gJ/AaZYlGWmSYda99rguCSH4NWMmZAYPbFnkF0sAc0mOItnXcXNLZEhEZ?=
 =?us-ascii?Q?z/NhtFbImmOnIuEk4703du1eEaa7a0EbaRgcGT1p/4XViwRfItzCFP7NaQi8?=
 =?us-ascii?Q?N3pbz96NSqEXpEn6O1p02rCN++mHkvlhFIeB0+oshQYfm5O983uNSKJQsn8C?=
 =?us-ascii?Q?yvNJsRMMxbJehGerhIP0ghFPoKlhelOG8uMkMV73ZJ2FHgAyklmLtHzqBFJn?=
 =?us-ascii?Q?TJnX4zmg0IkKjBHlPXlO1poxc1vnujNfIPRUq9ykcU2PnrOtrpEKCAqddhYl?=
 =?us-ascii?Q?M7BvwvNT+KIBUOL9TYnRtEJ1iL0b0vpIYeFIICoonc0trNGTI/p1jAqlIeba?=
 =?us-ascii?Q?ARoko8RkvTT9Qfmr/CuhcZCRz7Hovpg+7zb5K1JuEqU+QjI2Qp669pesfXE4?=
 =?us-ascii?Q?W22ttO9OwuV8QFGBU0ucKKJFN8KVQWUwnHz+DZ1xo5Qj+FMSwxSosa2JGb+J?=
 =?us-ascii?Q?ogvCgOEbyrs440gwwKDXIoBrSuN0f5QpA7qmLTK7BTAHEgiHTT9ngwgK58uN?=
 =?us-ascii?Q?/FdG0eJqDC3xQ5ffpurC+nvJrZsMHNYt/f503QwExTCUA32CS4/L4c8i4APd?=
 =?us-ascii?Q?aXYDG/SiYEM1eeral+Aoz8BmfgNCGxAyztIfbMRHfIt9UNl3eocxEvkG+RZy?=
 =?us-ascii?Q?fwwaM4sSACBBGbuufZErknPHXJdsJh0TxMNH0nvjr/18qOWtEXnfJnrRHbz4?=
 =?us-ascii?Q?ZikhULeJO/47CFY=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(36860700013)(1800799024)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 10:55:26.3765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f94f5f85-1574-4185-e9e3-08dd5a41e7cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5416



> On 3 Mar 2025, at 11:37, Orzel, Michal <michal.orzel@amd.com> wrote:
>=20
>=20
>=20
> On 03/03/2025 11:27, Bertrand Marquis wrote:
>>=20
>>=20
>> Fix platforms/Kconfig and Kconfig.debug help ident to respect the
> NIT: s/ident/indent

Right sorry for that.
Can it be fixed on commit ?

>=20
>> standard (tab + 2 spaces).
>> While there also move some default in Kconfig.debug before the help
>> message.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>=20

Thanks
Bertrand

> ~Michal
>=20


