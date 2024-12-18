Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566209F6A18
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 16:34:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860597.1272608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNw3R-0003eR-Mw; Wed, 18 Dec 2024 15:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860597.1272608; Wed, 18 Dec 2024 15:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNw3R-0003by-JZ; Wed, 18 Dec 2024 15:33:41 +0000
Received: by outflank-mailman (input) for mailman id 860597;
 Wed, 18 Dec 2024 15:33:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=auIu=TL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tNw3P-0003bs-Ru
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 15:33:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2613::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72bd7f35-bd55-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 16:33:37 +0100 (CET)
Received: from DUZPR01CA0180.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::14) by AS8PR08MB7943.eurprd08.prod.outlook.com
 (2603:10a6:20b:53b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 15:33:34 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::21) by DUZPR01CA0180.outlook.office365.com
 (2603:10a6:10:4b3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Wed,
 18 Dec 2024 15:33:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 18 Dec 2024 15:33:33 +0000
Received: ("Tessian outbound 7762b28e8285:v528");
 Wed, 18 Dec 2024 15:33:32 +0000
Received: from L6c2ca8def663.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F5F8EA2C-0454-4610-B4F6-C9B7A214FD3C.1; 
 Wed, 18 Dec 2024 15:33:26 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L6c2ca8def663.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Dec 2024 15:33:26 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PA4PR08MB5902.eurprd08.prod.outlook.com (2603:10a6:102:e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 15:33:23 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 15:33:23 +0000
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
X-Inumbo-ID: 72bd7f35-bd55-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rHt0/fgkuR4mRojim33k9bP36lX2k8weuHfzt8Yx4caIZPir+HrQA1qXBWk7RZu5jZx5Yfe6/YKmwB5fxfD2JXOUQdSX5RZ/UGV73Obzm6+2gsM/1wlqh8broK7gJjD4Ol0vLlt3emXcWPFgULTcN7CmKWkIWoEjlvKFmSmT6paSbszJHWZpTSMt4R74CIVhHhXphLLz/KZuLT3PLsYC2HWZAygNMtKdw6qYAc/YJoNN3nVkpPo8G1UtyFSQ1alQXoYGpYmc2ppUdoy4QRoZ6FMLFc/dUcG89NyKNgEb15XvX2feTmYR2TLdZymVxmaRQnrhyjk784QhIaVPXVn/8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeF69qxkFVgxp6FBZGWYzoDZGDPSxyXVHeQUalW1vBw=;
 b=MncqRTuSu83Mx+RKxQjyEUNRZQrEafxwb059y6lGsY4bcf8AwE2ZEg8Oslqy5a9FHgVESCy1zjuV8O/dCGfEgTSyd/Bcj0QhNqI4fomCWwOkEQb+S8bx4spESRKLJHyEPzACO28HvTQcQM8GG8LaffpO1HdeDovQK0UFUerD+K9uBvytyH6SY8agGhBnJB0o2INEli3ejnJ9g1caqz055ZpITFI1kifRTHuBKE0otL9lz8QimGyezh/oxF5rQEulbCB55+TGh3SwXaEjnFUzLvrhLTvaMXgkim1j87yNjoN4BbrYuQ2eZLSj0wwiQ6DEWu0chRKjIyUTe5bBV+nfhw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeF69qxkFVgxp6FBZGWYzoDZGDPSxyXVHeQUalW1vBw=;
 b=bQBrKkPcJmJhO2/MxZfoyXM2w0jW0r88CwwZiK3TTdE7ZpV8gZojFUBiUfkbze0TAk7MZqtUXSpgiz4OEAXuinS4meqPiJIDEWyIC3oxCEBpW47IAKe3I87pJkgsGBlt7/N19rJ5PB2RQ3SEyF+gkfetLsxCsBENm23L0kFKC+E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 83d89a49479e711d
X-TessianGatewayMetadata: QBZfLWm0Pb+bVbzVOVtsYXQwMDntwmEJwldjSGGum+ryoezT+OsgOfjyyKn0QlJr10UWG9ClM80MoGqj/cXPpUoXOJpB9u7hVOt/9SUhYu7zaDq+9RQyjoxKqGKCSccCbzQKkpic7nHPZlucfbtARa0iYVvmXIabpQ6ZJQ2aCXU=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nM3drWsxZY9QuqOFzB9TYmO7f9poxOvhscZJ4u3g1lcTFBuxpQRsyzUt7Lj7vAhOYNqhcXG7vm6g7A62JBu8dFsSE/AmjE/ewXlwERbw+VX6XATiMvKim6/ArBk1pzF5QPOfb5dhBn0GwcS7Oaa8T5XAIpVwkBd5vqNxn773Y8vGL6LGGceBXpH9OMlz6UYO1ajXoV5ktjwB2TLt/GzxfSARd/oh0Soqv1+QHgp+T0SvCtSH+FvSILLga+DhS5AGJkXJbDy55kAq7ED75kX3gNq9FDC5H0ZE1K203jtTmP67jMdtxtizKij0O7SehXt6hG8nCmKBkHVUFmABg61vYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeF69qxkFVgxp6FBZGWYzoDZGDPSxyXVHeQUalW1vBw=;
 b=isS/2QxL42jVd0/+sFAA9BvWsPPydqYM6lyZBTQ1YsjuLmAnqpUj40M5A44ZQ4kKxI33peV8lAKU0k/hJwOLCMyYTl8ZX38H9DVIiAPaZihI7pRJ5HiJnqd4YFb7UnpWt+Itb1ziAfiYyicbquvVmEXoaAsGwL9MqaCW6Z7+T4TudRdVEV/uT5inDrgEFpUK2+JAAxTR1MKiF9x20Q94UqYhglfMbSRB01xlL4t9URLbq0pI/j3x6blKGr5LCP9gF4E94mF7geGtJ37tinax+CEKRb/wgsgScQJqcF5CuBuki1Kg3TbofhJ4mC+8W8taYEB0LTEJZT33jZ3K//3qqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeF69qxkFVgxp6FBZGWYzoDZGDPSxyXVHeQUalW1vBw=;
 b=bQBrKkPcJmJhO2/MxZfoyXM2w0jW0r88CwwZiK3TTdE7ZpV8gZojFUBiUfkbze0TAk7MZqtUXSpgiz4OEAXuinS4meqPiJIDEWyIC3oxCEBpW47IAKe3I87pJkgsGBlt7/N19rJ5PB2RQ3SEyF+gkfetLsxCsBENm23L0kFKC+E=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"S32@nxp.com" <S32@nxp.com>, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/6] xen/arm: platforms: Add NXP S32G3 Processors
 config
Thread-Topic: [PATCH v3 3/6] xen/arm: platforms: Add NXP S32G3 Processors
 config
Thread-Index: AQHbUTVdoMCMlYyvB0KhW/HQpIvTvrLsHi4AgAADtIA=
Date: Wed, 18 Dec 2024 15:33:23 +0000
Message-ID: <3FDFACF4-C998-496C-806F-530CA3C87622@arm.com>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
 <20241218101142.1552618-4-andrei.cherechesu@oss.nxp.com>
 <8f1c342f-61d3-48f5-8311-a1162a20cb24@citrix.com>
In-Reply-To: <8f1c342f-61d3-48f5-8311-a1162a20cb24@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PA4PR08MB5902:EE_|DU2PEPF00028D10:EE_|AS8PR08MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d80059-d1bb-4d67-64cb-08dd1f7954f9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?ukTIn/yrSirP+pMqXa7heuHiRvVO3X55ReIB0oK/GQpebn2RNQQV8aPxv6/c?=
 =?us-ascii?Q?ZViptNehWjEFLBGycn/8yrrSGN90fmViqeNjZoRKrxLYgi1BYDQ2CzAG5+E3?=
 =?us-ascii?Q?ql1S5Lnsc6jsT/9sNq8cRBrhnv6pSM2/Kfj6ZZUVQTWqmWAhzzcshnQU6M1z?=
 =?us-ascii?Q?8bNrJVFnTuRCh+COv8W3VlAD/LkBExD7pUl7Kz7w/auCB7iDwjFRbUPWEWZv?=
 =?us-ascii?Q?PWnLsm8HkES00WDj0u70KAY1C35CvO68oZUKuBjgvYXcFJ1aLJ7uH7LgcxHP?=
 =?us-ascii?Q?X5D8F5x2yZ0w4o21YfKR8xv2S0LquXxp68/mS0DnzOSfTk1aBmkMqTdKyV//?=
 =?us-ascii?Q?oKjuSInW7sOGzmSfW2xUduoP7ApU64wRL9xGbxSjZRHu++pi8Fuy2Wx1rGPP?=
 =?us-ascii?Q?LzaCW/uMJPKN3il3tBy24eZmg4Q/GIIGNglpIMWBgJVY7WEUgTB0Zloeu6wU?=
 =?us-ascii?Q?hQ10oF1ufDJvSm3Lsqa8w5Sgz2qprHkZ66TcvaiSvaNHNvk7NuzhiUwQM8b/?=
 =?us-ascii?Q?3PDikP51Q3KPJwLFaTIUtuUO0/zWYXDbqal6gbg+NlpK9bf9bFeAYsQa0Fsi?=
 =?us-ascii?Q?j2IwLUhStCuRWzFdWlSONGCsgEpyzv6n0ku627JpNkq26IsNx131LQ9LN/lp?=
 =?us-ascii?Q?Ru8g3LOyYyqUC+bhSG7vPIZlQNNmAY6vnrghq13hBRVljTN7D9LRdz/nBREx?=
 =?us-ascii?Q?45RvRlNlzul2csHW7k/5nJGouU0Q06tngyYDvpN1dSFKpQIh4F27n/BdkOr0?=
 =?us-ascii?Q?7sXd/1hDjHZWpZPR7jKvWZG3UN8Vd9Jxt1HPtgc022RtnE4H3si4qHAQNSio?=
 =?us-ascii?Q?UoPHzDYFDILhOWT5aCOhUUa63CYc9UZPBvZk4j9x5bErHHCLevBZWlvmH0DY?=
 =?us-ascii?Q?gyUdwXNvtFit0vDkviIPSl3T8vb47YCt1cTG6zWFnbXwFPySsZRQMItada9k?=
 =?us-ascii?Q?ru87f10q8xwtRzA+Yfe29NRSJrTSP+R2LRfcMO3x9GvyZAvg8rXGup98cT6L?=
 =?us-ascii?Q?81iwGWOMvoASflUtwc/ODyc6o15YQKADLRP5+1Cakz3Jx9vq+IroWuZ40Ink?=
 =?us-ascii?Q?WYIZNwTezM+HnWK//Mb+WYJD4je3AS8jSRkE7+hBEkgJmp15+SyimSxDotai?=
 =?us-ascii?Q?bZq6BVTNnl97067zRSnQAAEGix228F36gYf3vKUWM8U2blOKlwFIW4xLaPcF?=
 =?us-ascii?Q?dBXtGjzzHakE9YwFcL78WsHrrWsHWoyIKvYZoLjYxdL8svNL6GKHgyTrIOzp?=
 =?us-ascii?Q?hsnf9E26+9xzKjbilBNA2+mLgACpJn4QFGhg6/2FFNm0/4CCBam/hApwqv5B?=
 =?us-ascii?Q?hUGoX9nWggLuutL88Uu9EW5AJliiXQR/50DFpG8vxF5nRduGEpIV5omifcXf?=
 =?us-ascii?Q?n3Hn8RDsdpxaytnqWr6p/8JKH2Eu+LpZ0OXskwxpWG+YYCvcDTj7uxIUedQf?=
 =?us-ascii?Q?s2u//NFt7JoEfQdMx99EJsUBx5xyXPs5?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1750856CE4D3D543BEE400ADABAB4F22@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5902
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9610bfa9-088f-408a-106f-08dd1f794f42
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QkI5cE17kwVwNQfF7R1Q+NpzFjUu8Bn6VLvnO6c+8klmD4pYkToCz+ETaoia?=
 =?us-ascii?Q?VZhTUZf5YBzmybhhT1JJ66LBskTDYgtm62+n4nSqBR2/lLItfX3ORVcOV5gd?=
 =?us-ascii?Q?9+KgGpno5qam45u0aYYHBuRsBet5UMW79n/oFuqoCgBuP1dPS19GVaj6poXH?=
 =?us-ascii?Q?reTe2DF25M2GKCWvbv3TT+P+Ptmq35fUQTz7yN6ShllySQHE2E+zJ76MtpDE?=
 =?us-ascii?Q?XwaNC7cpL1l21WmEHYaQ7Sy17gNGxxzt2yS+vNbyw28hpbxOvD3wKecfs/m7?=
 =?us-ascii?Q?OgxAJpqKcyDULjXPaQCEkAkVpufY1Ituz6ltUrLjruLRbh935fcv6mIL6hsR?=
 =?us-ascii?Q?GEw4FS5vBQVG26XPaKKc4lrVRIbzZFfuIIEVk746Pp9p3d/pyk6cQgzxXqXr?=
 =?us-ascii?Q?kyqUKztAYZmxEWegU22Nd9VU+RQeihrBFqllv9jKdk32cPi1KnNYavfSgMeo?=
 =?us-ascii?Q?Dly7G3QU4E4JT7jGip51Zt3z4Z3MlxTzCxOEvggAkUumd7wsWE8uXJ1/DGQz?=
 =?us-ascii?Q?HZdt+qRVCRKkTMZiipg/rl+e6l7P5Og6VuHOK8/FuKvAqA9SBCx1Ya3IkzkS?=
 =?us-ascii?Q?aMNKOy+L3OCcV2pJj1rxyndvF5av+QmH+DXnu5cDnFaM6OMpSCYR/Rsf/BDW?=
 =?us-ascii?Q?+4m3bkzWsxr2F0I+hF5lbek9OrA4ViIVLGlGuslrKS35SbxVTS0WjSP6kXbL?=
 =?us-ascii?Q?CixptpYc15hrwdZJQSNH5+tQm5XryWmc4nLxVpI+7T3EnxexAtj5bTP6XKvy?=
 =?us-ascii?Q?nY4Y27mZD47/w/ooJ+4VKOsyN7LwpIzASPG4piOt/c7jEODJTLqzXPl+AufL?=
 =?us-ascii?Q?x65IdH4sYoA6daJkYpfYCUY7N0FuJPNC6Jvr6uyhCWahu9YZeMi1zd5C3BHT?=
 =?us-ascii?Q?IO9Fybwk1FBfNZZ+a8vfhz4jKpN+ZUtp1ujvXFIWZ5yrxL48lmarbM9NNfFb?=
 =?us-ascii?Q?MrIhjObpVhpReFCcgGwqw8mXa5V0p+sBu8tmYOLw1pbS2PEWbKEcMXRx7rSM?=
 =?us-ascii?Q?/Glhu9NOv/sZSoBNXb0MgtsvlnqZYcTPSNLuI5WjNrAxeLuwba3emX2VYzOW?=
 =?us-ascii?Q?Gv0DSG5liZ9SNE0mDVh68BxG2Olw144T8lyf1kOUHnWAI8wDfIArSngLOdZE?=
 =?us-ascii?Q?t8dnwHM+yN4LvQIQdI5hz6WPBW6OTll4ODJwb2zpatXypPmCyte76KcaPoRy?=
 =?us-ascii?Q?65EBI5rahTSS6SyuSK6OF2W4zu/bvcaGUDq1tPBfenFvGoJBGWFgN3+V+Dl/?=
 =?us-ascii?Q?KVE95BH7Zd30HuBn/wSIFOjAJLx2H0o8rpo+DbTHiJSqRhJYSIbNNStHAjal?=
 =?us-ascii?Q?SZANHt+IxfKpSkHOs31U4cN7bgGsI1yWj3KVG2QqrhAzHirsJcImlmIpSVaU?=
 =?us-ascii?Q?9zY+cL1EOIh5KCMG+Ek5ir8Wsz3YOj/bD+kY1/9nQZJPC37nlcKyaRlHA5c8?=
 =?us-ascii?Q?5gP1A2P7c4o0Y83mFwI3hNvnkq0f75y+YmqDV3fBI52k/QzjayPTYa7gbetT?=
 =?us-ascii?Q?1wR7K2ON4u0WxbA=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 15:33:33.3456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d80059-d1bb-4d67-64cb-08dd1f7954f9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7943

Hi Andrew,

> On 18 Dec 2024, at 16:19, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> On 18/12/2024 10:11 am, Andrei Cherechesu (OSS) wrote:
>> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kco=
nfig
>> index 02322c259c..6dbf6ec87b 100644
>> --- a/xen/arch/arm/platforms/Kconfig
>> +++ b/xen/arch/arm/platforms/Kconfig
>> @@ -37,6 +37,14 @@ config MPSOC
>> help
>> Enable all the required drivers for Xilinx Ultrascale+ MPSoC
>>=20
>> +config S32G3
>> + bool "NXP S32G3 Processors support"
>> + depends on ARM_64
>> + select HAS_LINFLEX
>> + select SCMI_SMC
>> + help
>> + Enable all the required drivers for NXP S32G3 Processors Family
>=20
> Minor point.  Help text should be intended by 1 tab and 2 spaces.  The
> surrounding examples are wrong.
>=20
> This can probably be fixed on commit if the series doesn't need a resend.

All entries in this file are actually wrong.
I did not mention it due to this fact and I thought of pushing one change t=
o fix them all=20
instead once this would have been commited.

Cheers
Bertrand

>=20
> ~Andrew


