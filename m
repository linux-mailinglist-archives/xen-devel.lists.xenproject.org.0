Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88578977905
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 08:54:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797951.1208020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp0CK-0007Th-Mv; Fri, 13 Sep 2024 06:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797951.1208020; Fri, 13 Sep 2024 06:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp0CK-0007SC-J1; Fri, 13 Sep 2024 06:54:28 +0000
Received: by outflank-mailman (input) for mailman id 797951;
 Fri, 13 Sep 2024 06:54:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/Xx=QL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sp0CI-0007S4-SL
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 06:54:27 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2607::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03384025-719d-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 08:54:25 +0200 (CEST)
Received: from AS9P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::14)
 by AM9PR08MB5875.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.15; Fri, 13 Sep
 2024 06:54:14 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:20b:50f:cafe::94) by AS9P251CA0012.outlook.office365.com
 (2603:10a6:20b:50f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.28 via Frontend
 Transport; Fri, 13 Sep 2024 06:54:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Fri, 13 Sep 2024 06:54:14 +0000
Received: ("Tessian outbound b109797c3965:v441");
 Fri, 13 Sep 2024 06:54:13 +0000
Received: from L4b306eb1d4be.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 613960B2-3EA6-4F3F-BCD6-D5E0A219FB1D.1; 
 Fri, 13 Sep 2024 06:54:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L4b306eb1d4be.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Sep 2024 06:54:07 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AM8PR08MB6500.eurprd08.prod.outlook.com (2603:10a6:20b:361::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.9; Fri, 13 Sep
 2024 06:54:03 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.7982.008; Fri, 13 Sep 2024
 06:54:03 +0000
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
X-Inumbo-ID: 03384025-719d-11ef-a0b5-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LyzU03iVftOdqEl1XxsEK/cMf/prlthVQrf8lUoF+d5656JZ9GQCgITQOlu/k/W25keamk15+y6DOp4S8Q4vkqmLId5lTKgL9de+v5I5h9SslKvH4fcA8RY/ZurtiN8/rxXrnv9qlaYgfxBQLIS57p7i9V1zkZOTAIiVeshgQc37wBOrjgb+QZiv21xMIAj9NzrV/h/E4nfEQnwTaMiPHHQc34C0Z1ilxQDs0Ra/LeL/TvpeI+LKlSEkEYyaSMgW8DhiSALIw1JoA9FQEuxYAgGelulS/B1WLSMXo5r/bMke8VZYdVrzrLPtIg8GunPA8R0LK8qMy16LTNtauLqdDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OKDXj7QurQDas3Y4kcf4jIsdsD81iCjMzJiiRnFomM=;
 b=lHG2soXVQlDGHF7KwNknK4Xw7ZbdHGXLuvQmBx6ROweL4WbnK2z/NjewVgNELX+5NIWoGGUjF0qNDH5yjDn3YaZS6h7IXkOVhmYYaPGrd1YUA3HsKThew5lI67+SvB5QWB+Ejhx+4VfJjEMoA9BaWMSAObVOAV2wtSFkSKiTZoHGCnHAjWOzPOju2dCF/QwnsKAuhZRNb8eUlFnfL+LgaT6YgZfwradamHxd/0TMjsCNokFEjhMYJOA99YMa06HIAJJg4zW7SEpTx5EavRcg63CcbkmYxnh1Zmm/IKK1E84AG5ivs2++pqgQbyGprjz17XkRT/EYVUoIf6iK5UEGKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OKDXj7QurQDas3Y4kcf4jIsdsD81iCjMzJiiRnFomM=;
 b=JRXIMoByUb1PnzCgruVBMj6FVRg2RUI6e0wNOOc7MRoPNcaSeVsDrGcDjJzbkM8L1dN86SWJZX7S3EpkOb7Ci6jJla0dPcO8lE4/t3XnsizUuDWatCR8dy0RjesD5OZ85JDA/nk6lOW672+zvKcpdqWl53outxCES23pZWTHXNI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 00ad27c2342c00c7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3Mf+jEjt6L2qvNFDmzSLj1ap0cSLZedeqwigMe1C/9q4NNVHBKFOsGCCa3AxGgtPUy6Zt+hsPm9lKO9/7qGTuONmZiRsAi+2eQWATav41aSv9ui93zFnsvTJx4XlMfd72IR+tPsvoe1HgPVZaswX4iDXOGs/fTPkk9wy/36O5VN/xiYM5eV0sHm/UQOCQaX05grX/3kRVQLpwgfQ2NVVfdTRKEMjVLNn7h3D/2UwkmxgZYruX1osKDEuDT0f7P6hnkdaPxVJ3+kqZaIlTVxbczsVaTrSfqEqPV3XMONchAIPQeVuF6ttkw1GPZkaJX4in22WYexW8uIEHFhGkAICg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OKDXj7QurQDas3Y4kcf4jIsdsD81iCjMzJiiRnFomM=;
 b=c+z0ab7kDzQlSmZJ7vttmX+fcEbG2Enw+7ytf9b7AboIB7uqAyec1nkuouW+x1xdVtBzrQJRcFYxJWsL46caDkYSoVtiXINvQxEMIWcGylH1zoGKAiMA6xpdfn2f0uSUcYlS6bz4MC+v4Itq7sy8kEEklHTq0YDD3FokkDmN+pS8La0ZwFDNng+89KQOw9M05nz000xuIGQzhz8aYRuRNGjjr3PqNv3J2hspEYo6GMzDcu6/Aqvc5DJYQSJG++LpNakmdpdSEQ8q83dQFnObiGCiQigtw7fkhZj6Tj6mwtodcxAsDZ3eaPRn8B6yvNpd2XUIU9twMCxJYOFSGV+Mmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OKDXj7QurQDas3Y4kcf4jIsdsD81iCjMzJiiRnFomM=;
 b=JRXIMoByUb1PnzCgruVBMj6FVRg2RUI6e0wNOOc7MRoPNcaSeVsDrGcDjJzbkM8L1dN86SWJZX7S3EpkOb7Ci6jJla0dPcO8lE4/t3XnsizUuDWatCR8dy0RjesD5OZ85JDA/nk6lOW672+zvKcpdqWl53outxCES23pZWTHXNI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm: Drop deprecated early printk platform options
Thread-Topic: [PATCH] arm: Drop deprecated early printk platform options
Thread-Index: AQHbBaRsVhEiVv6NsUivTMavfUgn4LJVSBqA
Date: Fri, 13 Sep 2024 06:54:03 +0000
Message-ID: <3307FCC0-8268-4D7F-A988-F460552CB83C@arm.com>
References: <20240913061529.213002-1-michal.orzel@amd.com>
In-Reply-To: <20240913061529.213002-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AM8PR08MB6500:EE_|AM2PEPF0001C711:EE_|AM9PR08MB5875:EE_
X-MS-Office365-Filtering-Correlation-Id: 22d3425c-750c-495d-710a-08dcd3c0e10b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?zdzCil+etzios35qwH0a9Ga82gYvu3obInXRefnw1+yVeyqysbx3kGXR8uwp?=
 =?us-ascii?Q?lGSDTf8KxwRrafJ10GyNeCqLE6xcRAZEU1mX3rk8CuIrbX31asxIqwjXnkUD?=
 =?us-ascii?Q?KLtxggTnzPArJEUfBgS1AQRXmmCmKe/JAF/6aAR08g0naL6Ft6z2ca9D4KQ+?=
 =?us-ascii?Q?/66ed9LOWsBM88ipstDUAr8sxNYAKOzcJ8Cp38fuUk6ZbmIDN6zBF4OG/h/p?=
 =?us-ascii?Q?bGH2498rSNO40rJ92v5zudZYu43QuCvS6nuWPL5GvgECZI+pOxSxGwRMTFSZ?=
 =?us-ascii?Q?0D7f8YIHSzsAa92R0SmgUf39fbSc5tZwhPn/CpUS4vnbQSGEFnb//CDaOCKa?=
 =?us-ascii?Q?o1hZhGguvdwrtFOkEK0NggqmOv/yZS43Hu2ivSYisbLi1tzsu+Gp+QqYy0nK?=
 =?us-ascii?Q?QjbSAdnu7Akr6BqzUCvmlBU2xl6pfE4k7WxaONf7UbRafFL66Ws7aiJwxb2b?=
 =?us-ascii?Q?fMhsNnELy5n8e8+0j9P8GQM/mBLgDXWzIWckixRGjrTs5GgB4MrYGqxX2mCI?=
 =?us-ascii?Q?GIFGj8SIgqYpl//SQk3TJuylvWMw1mFZdV7hvuTPRtu1c88siZ1DLRSz9wgI?=
 =?us-ascii?Q?cFLPQMJuazLm6n6izKAhKYEbWVgaW/rwLB0E0bVOYEs0DvxxsGXjor6I4Ua1?=
 =?us-ascii?Q?zUHAYWBwoNSjuS8AMN8MFz+xMUpj8QoS09WkficfcN3b7U1uSKJ9IokRVXkN?=
 =?us-ascii?Q?756+WmC7014e9/8vwyjx+fAq40qo4wYocgadqx2tI3ililG/mfZflA/a0FVz?=
 =?us-ascii?Q?LGm0YAjUtlI3Q0g3DXnQGtiNMllrcQ/As5EidCIpAlziIHmhGZB0qGGk1uEs?=
 =?us-ascii?Q?zLYDLZQHoQC6clGNKH8gfKQ3XL7qiew4Se44s4TL5QaVfejsjIXp026Qi/oP?=
 =?us-ascii?Q?xBu7QpO/CU+chuA/+tt6tAcBXed+aKXbZssHrGTQ6bvaDwI12nknrVMfJgB1?=
 =?us-ascii?Q?fbGCAtjd8nR+d6+AXaQja7tGrc0bMyAlO6G/eiM6kSxNaaNvQGJBqQiNgSIv?=
 =?us-ascii?Q?wpvYqARk9dLJQEjZwDjqX0+xeTXa0Fy5fJWLedn6Yqkqqm/ucfGCquPDO824?=
 =?us-ascii?Q?JMS2Knp3Ic+7qhdJSZNWNwqkAAsusCOckQWjlStwVa3oqAj1mllKi6xBlGaD?=
 =?us-ascii?Q?Yo1i4KGSyUfL7tPrBsoy3l7lvawF03KyRWNGVQwtrFATZRgq1l/6tEMU6PB5?=
 =?us-ascii?Q?+RjpGQ91LBVQzLp2aRM4HJfj0cEUJnmfRdZRYZtsbvfelklJ4lZe9m7sdROJ?=
 =?us-ascii?Q?kmKowKJoK2Z1Xn0L/0YcbVuhSaxqMT2woZavIa4nytNrIHXXJJQdJ4T7xDGM?=
 =?us-ascii?Q?DGh3W+3IPeIALKWsljBd+jlM/+hQAQZhyWl31yPG8oRFD6dW1nTpsbK/gtjH?=
 =?us-ascii?Q?OW25exE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EFF137F37917A741935074708D8F73E7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6500
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	53caf686-7c65-47eb-b7a9-08dcd3c0daa7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h+NmDtQY0ZHllYYRyZvsC59VKPYn2Eir7TKwpY8k4dp28uOiK7j1cKBYD/0g?=
 =?us-ascii?Q?EIUaa6B69mRHy6PvXnQZOkMO+TuTpfo73zBBvSGxG3pNCMv2gvp8ssvBNwWy?=
 =?us-ascii?Q?uir4I+hvoTXTX7odLr1acR9oCn1c0CHdFvznBxiNnpN1LDtfp3zNw5/nP6/u?=
 =?us-ascii?Q?KIm6XgD8WC5RLpNex8PkuAVc1sC55jeooIsbh1KZwMdLVFjeq4fSAgpFzcuZ?=
 =?us-ascii?Q?nk4CDi4EF7vwKN66ICHd/vSyq0puZEuIMMHKuyYgTCWS/ZhPVr7VlgV+oOwB?=
 =?us-ascii?Q?2RclMnRdTRdVdZqTID8rbBSuTQq8cxx3ou4HsMBLhlP3LyPWCE9FAwq/Sh4N?=
 =?us-ascii?Q?yTQznQhFcJ1tHT/bNeM0NKfTfLnB8iQvjloiRQzVP88T4OEdu9+uVEnVhAB9?=
 =?us-ascii?Q?Df+U683/QacJKxyoI6QuEIhvx4QEEP0y/vNskbewuEwfIlLUG6M3UafDllLw?=
 =?us-ascii?Q?4aH8PbpJytHhCtC6UbdYko/kZbV9X7pLJ/cNT6QPXOblAoyR98dWrK5AduU3?=
 =?us-ascii?Q?wUeOUUeaYgIWAv16Ye+m7LNMzLdaSuF3hnrZoCiBT2lkz5dfmlHS5lC90oKf?=
 =?us-ascii?Q?OJ+YJX7dGynxdTPFWbAGLVUkzLDxSt9BX7o2AlV4ar86v+14c2/ByS8/nOoU?=
 =?us-ascii?Q?CJi7HgTV/5TsVddaOB8pcFE/qeempvSOtym8VKcWapuRQlbh+LbkcH7eLCcr?=
 =?us-ascii?Q?pCHLzSaqTyCIBq9uGGP38YeHWAY2aGIs+ER+yRpkQfICq2S+TOxH3WcTaNXT?=
 =?us-ascii?Q?VQrURPYuCW4LH+rqnc38UzlMxGPR1CglH6322hQ9AsDFRU7mcReWM36G1Vel?=
 =?us-ascii?Q?FKcDCNLYcFoF5UJJRBG62Eewaztku9SVV0uZKIX9gOiUDsL6+NmG9F3RZwHb?=
 =?us-ascii?Q?xOOCG/7I6hZkjjaPwDKT/2ahSprSvVwP9cCnmMjLlxbaSZ3YGSfAprA0XaSA?=
 =?us-ascii?Q?Yrm3qpk7p8QmFnDVNwPx7REQBdVtytqoK680H9yJQWcT4AYKZIchxtAZVK9S?=
 =?us-ascii?Q?omCo+v7oUoIcMET3axeFABkgT+JoogcSBoTWqmL9cxgnAsPxb3sQdi+207Hd?=
 =?us-ascii?Q?nfMwbrRudaHxoNdicPs/4pDEE/DYRE6uRX4Dy6LIzUaDZW9eRJlzbVKEXnGQ?=
 =?us-ascii?Q?jjLitKwENWmpIb9zR5GtOsQMR1G6dovHjKu8BzssmOZbzFrlwE6ISSCsqjFR?=
 =?us-ascii?Q?XXMMCoNOnJ0gskIwbXeAscTr3Vwjk1YLgDddAjLErCpasxoPwU1B7jiAJR64?=
 =?us-ascii?Q?QWhYTYAvsHMks7ymNpd67tV9thSlyd/znzideYM+t3q9IGcHynpDZJmau4AR?=
 =?us-ascii?Q?4rZLYmhU3gjyLJzj1/4lLw9Axf6rfCe7bKjj7jneVQXa5C6DhEot5aC+1MNj?=
 =?us-ascii?Q?Ga/w9tU2MTV+xy/p+3jSJc6KYYM9?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 06:54:14.1791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d3425c-750c-495d-710a-08dcd3c0e10b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5875

Hi Michal,

> On 13 Sep 2024, at 08:15, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> The predefined configurations for early printk have been deprecated for
> a sufficient amount of time. Let's finally remove them.
>=20
> Note:
> In order not to loose these predefined configurations, I wrote a wiki
> page: https://wiki.xenproject.org/wiki/Xen_on_ARM_Early_Printk
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> docs/misc/arm/early-printk.txt |   4 -
> xen/arch/arm/Kconfig.debug     | 155 ++-------------------------------
> 2 files changed, 9 insertions(+), 150 deletions(-)
>=20
> diff --git a/docs/misc/arm/early-printk.txt b/docs/misc/arm/early-printk.=
txt
> index bc2d65aa2ea3..e6b9124a38e3 100644
> --- a/docs/misc/arm/early-printk.txt
> +++ b/docs/misc/arm/early-printk.txt
> @@ -35,8 +35,4 @@ Other options depends on the driver selected:
>=20
>   - For all other uarts there are no additional options.
>=20
> -As a convenience it is also possible to select from a list of
> -predefined configurations available in the list of choice for "Early
> -printk" for specific platform.
> -
> By default early printk is disabled.
> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
> index eec860e88e0b..2fa0acd2a3f1 100644
> --- a/xen/arch/arm/Kconfig.debug
> +++ b/xen/arch/arm/Kconfig.debug
> @@ -13,177 +13,67 @@ choice
> Choose one of the UART drivers for early printk, then you'll
> have to specify the parameters, like the base address.
>=20
> - Deprecated: Alternatively, there are platform specific options
> - which will have default values for the various parameters. But
> - such option will soon be removed.
> -
> config EARLY_UART_CHOICE_8250
> select EARLY_UART_8250
> bool "Early printk via 8250 UART"
> help
> Say Y here if you wish the early printk to direct their
> - output to a 8250 UART. You can use this option to
> - provide the parameters for the 8250 UART rather than
> - selecting one of the platform specific options below if
> - you know the parameters for the port.
> + output to a 8250 UART.
>=20
> - This option is preferred over the platform specific
> - options; the platform specific options are deprecated
> - and will soon be removed.
> config EARLY_UART_CHOICE_CADENCE
> select EARLY_UART_CADENCE
> depends on ARM_64
> bool "Early printk via Cadence UART"
> help
> Say Y here if you wish the early printk to direct their
> - output to a Cadence UART. You can use this option to
> - provide the parameters for the Cadence UART rather than
> - selecting one of the platform specific options below if
> - you know the parameters for the port.
> + output to a Cadence UART.
>=20
> - This option is preferred over the platform specific
> - options; the platform specific options are deprecated
> - and will soon be removed.
> config EARLY_UART_CHOICE_EXYNOS4210
> select EARLY_UART_EXYNOS4210
> depends on ARM_32
> bool "Early printk via Exynos4210 UART"
> help
> Say Y here if you wish the early printk to direct their
> - output to a Exynos 4210 UART. You can use this option to
> - provide the parameters for the Exynos 4210 UART rather than
> - selecting one of the platform specific options below if
> - you know the parameters for the port.
> + output to a Exynos 4210 UART.
>=20
> - This option is preferred over the platform specific
> - options; the platform specific options are deprecated
> - and will soon be removed.
> config EARLY_UART_CHOICE_IMX_LPUART
> select EARLY_UART_IMX_LPUART
> depends on ARM_64
> bool "Early printk via i.MX LPUART"
> help
> Say Y here if you wish the early printk to direct their
> - output to a i.MX LPUART. You can use this option to
> - provide the parameters for the i.MX LPUART rather than
> - selecting one of the platform specific options below if
> - you know the parameters for the port.
> + output to a i.MX LPUART.
> +
> config EARLY_UART_CHOICE_MESON
> select EARLY_UART_MESON
> depends on ARM_64
> bool "Early printk via MESON UART"
> help
> Say Y here if you wish the early printk to direct their
> - output to a MESON UART. You can use this option to
> - provide the parameters for the MESON UART rather than
> - selecting one of the platform specific options below if
> - you know the parameters for the port.
> + output to a MESON UART.
>=20
> - This option is preferred over the platform specific
> - options; the platform specific options are deprecated
> - and will soon be removed.
> config EARLY_UART_CHOICE_MVEBU
> select EARLY_UART_MVEBU
> depends on ARM_64
> bool "Early printk via MVEBU UART"
> help
> Say Y here if you wish the early printk to direct their
> - output to a MVEBU UART. You can use this option to
> - provide the parameters for the MVEBU UART rather than
> - selecting one of the platform specific options below if
> - you know the parameters for the port.
> + output to a MVEBU UART.
>=20
> - This option is preferred over the platform specific
> - options; the platform specific options are deprecated
> - and will soon be removed.
> config EARLY_UART_CHOICE_PL011
> select EARLY_UART_PL011
> bool "Early printk via PL011 UART"
> help
> Say Y here if you wish the early printk to direct their
> - output to a PL011 UART. You can use this option to
> - provide the parameters for the PL011 UART rather than
> - selecting one of the platform specific options below if
> - you know the parameters for the port.
> + output to a PL011 UART.
>=20
> - This option is preferred over the platform specific
> - options; the platform specific options are deprecated
> - and will soon be removed.
> config EARLY_UART_CHOICE_SCIF
> select EARLY_UART_SCIF
> bool "Early printk via SCIF UART"
> help
> Say Y here if you wish the early printk to direct their
> - output to a SCIF UART. You can use this option to
> - provide the parameters for the SCIF UART rather than
> - selecting one of the platform specific options below if
> - you know the parameters for the port.
> + output to a SCIF UART.
>=20
> - This option is preferred over the platform specific
> - options; the platform specific options are deprecated
> - and will soon be removed.
> -
> - config EARLY_PRINTK_BRCM
> - bool "Early printk with 8250 on Broadcom 7445D0 boards with A15 process=
ors"
> - select EARLY_UART_8250
> - config EARLY_PRINTK_DRA7
> - bool "Early printk with 8250 on DRA7 platform"
> - select EARLY_UART_8250
> - config EARLY_PRINTK_EXYNOS5250
> - bool "Early printk with the second UART on Exynos5250"
> - select EARLY_UART_EXYNOS4210
> - depends on ARM_32
> - config EARLY_PRINTK_FASTMODEL
> - bool "Early printk with pl011 on ARM Fastmodel software emulators"
> - select EARLY_UART_PL011
> - config EARLY_PRINTK_HIKEY960
> - bool "Early printk with pl011 with Hikey 960"
> - select EARLY_UART_PL011
> - config EARLY_PRINTK_JUNO
> - bool "Early printk with pl011 on Juno platform"
> - select EARLY_UART_PL011
> - config EARLY_PRINTK_LAGER
> - bool "Early printk with SCIF0 on Renesas Lager board (R-Car H2 processo=
r)"
> - select EARLY_UART_SCIF
> - config EARLY_PRINTK_MIDWAY
> - bool "Early printk with pl011 on Calxeda Midway processors"
> - select EARLY_UART_PL011
> - config EARLY_PRINTK_MVEBU
> - bool "Early printk with MVEBU for Marvell Armada 3700 SoCs"
> - select EARLY_UART_MVEBU
> - depends on ARM_64
> - config EARLY_PRINTK_OMAP5432
> - bool "Early printk with UART3 on TI OMAP5432 processors"
> - select EARLY_UART_8250
> - config EARLY_PRINTK_RCAR3
> - bool "Early printk with SCIF2 on Renesas R-Car Gen3 processors"
> - select EARLY_UART_SCIF
> - config EARLY_PRINTK_SEATTLE
> - bool "Early printk with pl011 for AMD Seattle processor"
> - select EARLY_UART_PL011
> - config EARLY_PRINTK_SUN6I
> - bool "Early printk with 8250 on Allwinner A31 processors"
> - select EARLY_UART_8250
> - config EARLY_PRINTK_SUN7I
> - bool "Early printk with 8250 on Allwinner A20 processors"
> - select EARLY_UART_8250
> - config EARLY_PRINTK_THUNDERX
> - bool "Early printk with pl011 for Cavium ThunderX processor"
> - select EARLY_UART_PL011
> - depends on ARM_64
> - config EARLY_PRINTK_VEXPRESS
> - bool "Early printk with pl011 for versatile express"
> - select EARLY_UART_PL011
> - config EARLY_PRINTK_XGENE_MCDIVITT
> - bool "Early printk with 820 on Xgene mcdivitt platform"
> - select EARLY_UART_8250
> - config EARLY_PRINTK_XGENE_STORM
> - bool "Early printk with 820 on Xgene storm platform"
> - select EARLY_UART_8250
> - config EARLY_PRINTK_ZYNQMP
> - bool "Early printk with Cadence UART for Xilinx ZynqMP SoCs"
> - select EARLY_UART_CADENCE
> - depends on ARM_64
> endchoice
>=20
>=20
> @@ -219,25 +109,6 @@ config EARLY_UART_BASE_ADDRESS
> depends on EARLY_PRINTK
> hex "Early printk, physical base address of debug UART"
> range 0x0 0xffffffff if ARM_32
> - default 0xF040AB00 if EARLY_PRINTK_BRCM
> - default 0x4806A000 if EARLY_PRINTK_DRA7
> - default 0x1c090000 if EARLY_PRINTK_FASTMODEL
> - default 0x12c20000 if EARLY_PRINTK_EXYNOS5250
> - default 0xfff32000 if EARLY_PRINTK_HIKEY960
> - default 0x7ff80000 if EARLY_PRINTK_JUNO
> - default 0xe6e60000 if EARLY_PRINTK_LAGER
> - default 0xfff36000 if EARLY_PRINTK_MIDWAY
> - default 0xd0012000 if EARLY_PRINTK_MVEBU
> - default 0x48020000 if EARLY_PRINTK_OMAP5432
> - default 0xe6e88000 if EARLY_PRINTK_RCAR3
> - default 0xe1010000 if EARLY_PRINTK_SEATTLE
> - default 0x01c28000 if EARLY_PRINTK_SUN6I
> - default 0x01c28000 if EARLY_PRINTK_SUN7I
> - default 0x87e024000000 if EARLY_PRINTK_THUNDERX
> - default 0x1c090000 if EARLY_PRINTK_VEXPRESS
> - default 0x1c021000 if EARLY_PRINTK_XGENE_MCDIVITT
> - default 0x1c020000 if EARLY_PRINTK_XGENE_STORM
> - default 0xff000000 if EARLY_PRINTK_ZYNQMP

Shouldn't we put a default 0 value here ?

>=20
> config EARLY_UART_PL011_BAUD_RATE
> depends on EARLY_UART_PL011
> @@ -250,7 +121,6 @@ config EARLY_UART_PL011_BAUD_RATE
> not try to initialize the UART, so that bootloader or firmware
> settings can be used for maximum compatibility.
>=20
> - default 115200 if EARLY_PRINTK_FASTMODEL
> default 0
>=20
> config EARLY_UART_PL011_MMIO32
> @@ -274,13 +144,6 @@ config EARLY_UART_8250_REG_SHIFT
>=20
> Default to 0.
>=20
> - default 2 if EARLY_PRINTK_BRCM
> - default 2 if EARLY_PRINTK_DRA7
> - default 2 if EARLY_PRINTK_OMAP5432
> - default 2 if EARLY_PRINTK_SUN6I
> - default 2 if EARLY_PRINTK_SUN7I
> - default 2 if EARLY_PRINTK_XGENE_MCDIVITT
> - default 2 if EARLY_PRINTK_XGENE_STORM
> default 0

Seeing that all know example are setting this to 2, wouldn't it
make sense to change the default to 2 ?

Cheers
Bertrand

>=20
> choice EARLY_UART_SCIF_VERSION
> --=20
> 2.25.1
>=20


